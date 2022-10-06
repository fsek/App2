import 'package:flutter/material.dart';
import 'package:fsek_mobile/environments/environment.dart';
import 'package:fsek_mobile/models/gallery/album.dart';
import 'package:fsek_mobile/widgets/loading_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:image_save/image_save.dart';

class ImageBrowserPage extends StatefulWidget {
  const ImageBrowserPage({Key? key, required this.album, required this.initial})
      : super(key: key);

  final Album album;
  final int initial;

  @override
  State<ImageBrowserPage> createState() => _ImageBrowserPageState();
}

class _ImageBrowserPageState extends State<ImageBrowserPage> {
  var index;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text("${widget.album.title!}"),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () async {
              try {
                http.Response image = await http.get(Uri.parse(
                    "${Environment.API_URL}${widget.album.images![index].file!
                        .large!["url"]!}"));
                ImageSave.saveImage(
                    image.bodyBytes,
                    "${widget.album.images![index].filename!}", albumName: "F-sektionen");
                ScaffoldMessenger.of(context).showSnackBar(
                    new SnackBar(content: Text(t.galleryImageDownloaded),));
              } on Exception catch (_) {
                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: Text(t.galleryImageDownloadError),));}
            },
          )
        ],
      ),
      body: PageView.builder(
        controller: PageController(initialPage: widget.initial),
        itemCount: widget.album.images!.length,
        itemBuilder: (context, index) => Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          InteractiveViewer(
            panEnabled: false,
            // Set it to false
            boundaryMargin: EdgeInsets.all(100),
            minScale: 0.5,
            maxScale: 4,
            child: Image.network(
              "${Environment.API_URL}${widget.album.images![index].file!.large!["url"]!}",
              loadingBuilder: (context, widget, loadingProgress) {
                this.index = index;
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
            "${t.galleryTitle} ${index + 1} ${t.galleryOf} ${widget.album.images!.length}",
            style: Theme.of(context).textTheme.headline6,
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 15, 0, 0)),
        ])),
      ),
    );
  }
}
