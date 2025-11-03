import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fsek_mobile/services/api.service.dart';
import 'package:fsek_mobile/widgets/loading_widget.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:flutter_image_gallery_saver/flutter_image_gallery_saver.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/environments/environment.dart';
import 'package:http/http.dart' as http;

class ImageBrowserPage extends StatefulWidget {
  const ImageBrowserPage({Key? key, required this.album, required this.initial, required this.imgIds})
      : super(key: key);

  final AlbumRead album;
  final int initial;
  final List<int> imgIds;

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

  Future<Uint8List> fetchImageBytes(int id) async {
    try {
      final url = "${Environment.API_URL}/img/images/$id/original";
      // final url = "https://backend.fsektionen.se/img/images/${id}/original";
      final response = await http.get(Uri.parse(url),
          headers: {"Authorization": "Bearer ${ApiService.access_token}"});

      if (response.statusCode != 200 || response.bodyBytes.isEmpty) {
      throw Exception("Failed to load image: HTTP ${response.statusCode}");
    }

    return response.bodyBytes;
  } catch (e) {
    print("Error fetching image: $e");
    throw Exception("Image fetch failed");
  }
}

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(t.localeName == "sv"
              ? widget.album.titleSv
              : widget.album.titleEn),
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
                        final imageBytes =
                            await fetchImageBytes(widget.imgIds[index]);
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
                    final imageBytes =
                        await fetchImageBytes(widget.imgIds[index]);
                    await FlutterImageGallerySaver.saveImage(imageBytes);
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        content: Text(
                          t.galleryImageDownloaded,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest));
                  } on Exception catch (_) {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        content: Text(
                          t.galleryImageDownloadError,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest));
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
          imgIds: widget.imgIds,
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
  final List<int> imgIds;
  // A function that sets the index in the main widget is passed down the widget-tree.
  // This weird passing-up-and-down of things isn't optimal, but was written to just
  // easily slot into the current image_browser page.
  final Function(int) callback;
  final PageController pageController;

  const PageViewBuilder(
      {Key? key,
      required this.imgIds,
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
  late List<Future<ImageProvider<Object>>?> _imageFutures;

  @override
  void initState() {
    super.initState();
    _imageFutures = List.filled(widget.imgIds.length, null);
  }
  

  Future<ImageProvider<Object>> _fetchImage(int id) async {
    try {
      final url = "${Environment.API_URL}/img/images/$id/large";
      // final url = "https://backend.fsektionen.se/img/images/${id}/large";
      final response = await http.get(Uri.parse(url),
          headers: {"Authorization": "Bearer ${ApiService.access_token}"});

      if (response.statusCode != 200) {
        print("HTTP error: ${response.statusCode}");
        print("Response body: ${String.fromCharCodes(response.bodyBytes)}");
        return const AssetImage("assets/img/f_logo.png");
      }

      if (response.bodyBytes.isEmpty) {
        print("Received empty response");
        return const AssetImage("assets/img/f_logo.png");
      }

      return MemoryImage(response.bodyBytes);
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
      itemCount: widget.imgIds.length,
      controller: widget.pageController,
      onPageChanged: (int newIndex) {
        widget.callback(newIndex);
      },
      itemBuilder: (context, index) {
        final imageFuture = _imageFutures[index] ??= _fetchImage(widget.imgIds[index]);

        final image = FutureBuilder<ImageProvider<Object>>(
          future: imageFuture,
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
          imgIds: widget.imgIds,
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
  final List<int> imgIds;
  final Widget image;
  final double minScale;
  final double maxScale;
  final void Function(double)? onScaleChanged;

  const ImageContainer({
    Key? key,
    required this.imgIds,
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
              "${t.galleryTitle} ${widget.index + 1} ${t.galleryOf} ${widget.imgIds.length}",
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
