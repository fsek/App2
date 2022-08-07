import 'package:flutter/material.dart';
import 'package:fsek_mobile/environments/environment.dart';
import 'package:fsek_mobile/models/gallery/album.dart';
import 'package:fsek_mobile/widgets/loading_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImageBrowserPage extends StatelessWidget {
  const ImageBrowserPage({Key? key, required this.album, required this.initial})
      : super(key: key);

  final Album album;
  final int initial;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        controller: PageController(initialPage: initial),
        itemCount: album.images!.length,
        itemBuilder: (context, index) => Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          InteractiveViewer(
            panEnabled: false, // Set it to false
            boundaryMargin: EdgeInsets.all(100),
            minScale: 0.5,
            maxScale: 4,
            child: Image.network(
              "${Environment.API_URL}${album.images![index].file!.large!}",
              loadingBuilder: (context, widget, loadingProgress) {
                if (loadingProgress == null)
                  return widget;
                else
                  return LoadingWidget();
              },
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "${t.galleryTitle} ${index + 1} ${t.galleryOf} ${album.images!.length}",
            style: Theme.of(context).textTheme.headline6,
          )
        ])),
      ),
    );
  }
}
