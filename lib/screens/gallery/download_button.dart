import 'package:flutter/material.dart';

import 'dart:typed_data';
import 'package:fsek_mobile/l10n/app_localizations.dart';
import 'package:flutter_image_gallery_saver/flutter_image_gallery_saver.dart';

class DownloadButton extends StatelessWidget {
  final List<Future<Uint8List>> imageFutures;
  final IconData? icon;
  final double? iconSize;
  final String? successMessage;
  final String? errorMessage;

  const DownloadButton({
    super.key,
    required this.imageFutures,
    this.icon,
    this.iconSize,
    this.successMessage,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return IconButton(
      icon: Icon(icon ?? Icons.download, size: iconSize),
      onPressed: () async {
        try {
          for (final imageFuture in imageFutures) {
            imageFuture.then((imageBytes) async => await FlutterImageGallerySaver.saveImage(imageBytes));
          }

          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
              content: Text(
                successMessage ?? (imageFutures.length == 1 ? t.galleryImageDownloaded : t.galleryImagesDownloaded),
                style: Theme.of(context).textTheme.labelLarge,
              ),
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest));
        } on Exception catch (_) {
          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
              content: Text(
                errorMessage ?? t.galleryImageDownloadError,
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