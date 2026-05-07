import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fsek_mobile/screens/gallery/download_button.dart';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:fsek_mobile/api_client/lib/api_client.dart';
import 'package:fsek_mobile/services/service_locator.dart';
import 'package:fsek_mobile/services/images.service.dart';

class ImageBrowserPage extends StatefulWidget {
  const ImageBrowserPage(
    {Key? key,
    required this.album,
    required this.initial,
    required this.imgIds})
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
                  child: DownloadButton(
                    imageFutures: [locator<ImagesService>().fetchImageBytes(widget.imgIds[index])],
                    icon: Icons.download_for_offline_rounded,
                    iconSize: 40,
                    successMessage: "The JPEG god smiles upon you",
                    errorMessage: "JPEG broke :o",
                  ),
                ),
              visible: smallDownload,
            ),
            GestureDetector(
              child: DownloadButton(
                imageFutures: [locator<ImagesService>().fetchImageBytes(widget.imgIds[index])]
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

  @override
  void initState() {
    super.initState();
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
      allowImplicitScrolling: true,
      itemBuilder: (context, index) {
        final imageProvider = locator<ImagesService>().fetchImage(widget.imgIds[index]);
        final thumbnailProvider = locator<ImagesService>().fetchImage(widget.imgIds[index], isThumbnail: true);

        return ImageContainer(
          imgIds: widget.imgIds,
          image: imageProvider,
          thumbnail: thumbnailProvider,
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
  final ImageProvider image;
  final ImageProvider? thumbnail;
  final double minScale;
  final double maxScale;
  final void Function(double)? onScaleChanged;

  const ImageContainer({
    Key? key,
    required this.imgIds,
    required this.image,
    this.thumbnail,
    this.minScale = 1.0,
    this.maxScale = 5.0,
    this.onScaleChanged,
    required this.index,
    required this.album,
  }) : super(key: key);

  @override
  _ImageContainerState createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> with AutomaticKeepAliveClientMixin {
  final TransformationController _transformationController =
      TransformationController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);  // needed because of AutomaticKeepAliveClientMixin

    var t = AppLocalizations.of(context)!;
    return InteractiveViewer(
      clipBehavior: Clip.none,
      transformationController: _transformationController,
      minScale: widget.minScale,
      maxScale: widget.maxScale,
      child: Column(
        children: [
          Spacer(flex: 1),

          Image(
            image: widget.image,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
            gaplessPlayback: true,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;  // done loading
              }

              return Stack(
                alignment: Alignment.center,
                children: [
                  if (widget.thumbnail != null)
                    Image(
                      image: widget.thumbnail!,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),

                  CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                  ),
                ]
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Image(
                image: const AssetImage("assets/img/f_logo.png"),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.contain,
                gaplessPlayback: true,
              );
            },
          ),

          Spacer(flex: 1),
          Text(
            "${t.galleryTitle} ${widget.index + 1} ${t.galleryOf} ${widget.imgIds.length}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 45)),
        ]
      ),
      onInteractionEnd: (scaleEndDetails) {
        double scale = _transformationController.value.getMaxScaleOnAxis();
        if (widget.onScaleChanged != null) {
          widget.onScaleChanged!(scale);
        }
      },
    );
  }
}
