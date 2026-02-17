import 'package:flutter/material.dart';

import 'dart:typed_data';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:flutter_image_gallery_saver/flutter_image_gallery_saver.dart';

class DownloadButton extends StatelessWidget {
  final List<Uint8List> imageBytesList;

  const DownloadButton({
    super.key,
    required this.imageBytesList
  });

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return IconButton(
      icon: Icon(Icons.download),
      onPressed: () async {
        try {
          for (final imageBytes in imageBytesList) {
            await FlutterImageGallerySaver.saveImage(imageBytes);
          }

          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
              content: Text(
                imageBytesList.length == 1 ? t.galleryImageDownloaded : t.galleryImagesDownloaded,
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
    );
  }
}