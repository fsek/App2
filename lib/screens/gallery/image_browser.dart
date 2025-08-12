import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/widgets/loading_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_image_gallery_saver/flutter_image_gallery_saver.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';

class ImageBrowserPage extends StatefulWidget {
  const ImageBrowserPage({Key? key, required this.album, required this.initial})
      : super(key: key);

  final AlbumRead album;
  final int initial;

  @override
  State<ImageBrowserPage> createState() => _ImageBrowserPageState();
}

class _ImageBrowserPageState extends State<ImageBrowserPage> {
  late int index;
  bool smallDownload = false;
  late Timer _timer;


  @override 
  void initState() {
    super.initState();
    index = widget.initial;
  }

  void indexUpdate(int newIndex) {
    setState(() {
      this.index = newIndex;
    });
  }


  Future<Uint8List> fetchImageBytes (int id) async {
    final response = await ApiService.apiClient.dio.get(
      "/img/$id", 
      options: Options(responseType: ResponseType.bytes));

    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            t.localeName == "sv" ? widget.album.titleSv : widget.album.titleEn
            ),
          actions: [
            Visibility(
              child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: <Color>[
                        const Color(0xFFFF0064),
                        const Color(0xFFFF7600),
                        const Color(0xFFFFD500),
                        const Color(0xFF8CFE00),
                        const Color(0xFF00E86C),
                        const Color(0xFF00F4F2),
                        const Color(0xFF00CCFF),
                        const Color(0xFF70A2FF),
                        const Color(0xFFA96CFF),
                      ],
                    ).createShader(bounds);
                  },
                  child: IconButton(
                    icon: Icon(Icons.download_for_offline_rounded, size: 40),
                    onPressed: () async {
                      try {
                        final imageBytes = await fetchImageBytes(widget.album.imgs[index].id);
                        await FlutterImageGallerySaver.saveImage(imageBytes);
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          content: Text("The JPEG god smiles upon you"),
                        ));
                      } on Exception catch (_) {
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          content: Text("JPEG broke :o"),
                        ));
                      }
                    },
                  )),
              visible: smallDownload,
            ),
            GestureDetector(
              child: IconButton(
                icon: Icon(Icons.download),
                onPressed: () async {
                  try {
                    final imageBytes = await fetchImageBytes(widget.album.imgs[index].id);
                    await FlutterImageGallerySaver.saveImage(imageBytes);
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        content: Text(
                          t.galleryImageDownloaded,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.surfaceContainerHighest));
                  } on Exception catch (_) {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        content: Text(
                          t.galleryImageDownloadError,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.surfaceContainerHighest));
                  }
                },
              ),
              onPanCancel: () => _timer.cancel(),
              onPanDown: (_) => {
                _timer = Timer(Duration(seconds: 4), () {
                  smallDownload = true;
                  setState(() {});
                })
              },
            )
          ],
        ),
        body: Center(
            child: PageViewBuilder(
          initial: widget.initial,
          album: widget.album,
          callback: indexUpdate,
          pageController: new PageController(initialPage: widget.initial),
        )));
  }
}

// These custom classes are here to solve the issue of
// panning a zoomed image also scrolling between the images.
// Simply put, it disables scrolling between images when the user is zoomed in on an image.

class PageViewBuilder extends StatefulWidget {
  final AlbumRead album;
  final int initial;
  // A function that sets the index in the main widget is passed down the widget-tree.
  // This weird passing-up-and-down of things isn't optimal, but was written to just
  // easily slot into the current image_browser page.
  final Function(int) callback;
  final PageController pageController;

  const PageViewBuilder(
      {Key? key,
      required this.album,
      required this.initial,
      required this.callback,
      required this.pageController})
      : super(key: key);

  @override
  _PageViewBuilderState createState() => _PageViewBuilderState();
}

class _PageViewBuilderState extends State<PageViewBuilder> {
  bool _pagingEnabled = true;

  Future<ImageProvider<Object>> fetchImage(int id) async {
  try {
    final response = await ApiService.apiClient.dio.get(
      "/img/$id", 
      options: Options(responseType: ResponseType.bytes));

    return MemoryImage(Uint8List.fromList(response.data!));
    
  } catch (e) {
    print("Error fetching image: $e");
    return AssetImage("assets/img/f_logo.png");
  }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: _pagingEnabled
          ? const PageScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: widget.album.imgs.length,
      controller: widget.pageController,
      onPageChanged: (int newIndex) {
         widget.callback(newIndex);
          },
      itemBuilder: (context, index) {
        final image = FutureBuilder<ImageProvider<Object>>(
          future: fetchImage(widget.album.imgs[index].id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingWidget();
            } else if (snapshot.hasError || !snapshot.hasData) {
              return const Center(child: Icon(Icons.broken_image));
            }

        return Image(
          image: snapshot.data!,
          fit: BoxFit.contain,
        );
      },
    );
        return ImageContainer(
          image: image,
          album: widget.album,
          index: index,
          onScaleChanged: (scale) {
            setState(() {
              // Disabling scrolling if zoomed in.
              _pagingEnabled = scale <= 1.0;
            });
          },
        );
      },
    );
  }
}

class ImageContainer extends StatefulWidget {
  final AlbumRead album;
  final int index;
  final Widget image;
  final double minScale;
  final double maxScale;
  final void Function(double)? onScaleChanged;

  const ImageContainer({
    Key? key,
    required this.image,
    this.minScale = 1.0,
    this.maxScale = 5.0,
    this.onScaleChanged,
    required this.index,
    required this.album,
  }) : super(key: key);

  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  final TransformationController _transformationController =
      TransformationController();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: InteractiveViewer(
          clipBehavior: Clip.none,
          transformationController: _transformationController,
          minScale: widget.minScale,
          maxScale: widget.maxScale,
          child: Column(children: [
            Padding(padding: EdgeInsets.fromLTRB(0, 45, 0, 45)),
            widget.image,
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 45)),
            Text(
              "${t.galleryTitle} ${widget.index + 1} ${t.galleryOf} ${widget.album.imgs.length}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ]),
          onInteractionEnd: (scaleEndDetails) {
            double scale = _transformationController.value.getMaxScaleOnAxis();
            if (widget.onScaleChanged != null) {
              widget.onScaleChanged!(scale);
            }
          },
        ));
  }
}

