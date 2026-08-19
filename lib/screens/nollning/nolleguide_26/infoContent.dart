import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentBlock {
  final Widget Function(BuildContext) build;
  const ContentBlock._(this.build);

  factory ContentBlock.title(String text) => ContentBlock._(
      (context) => Center(child:
      Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 30,
            fontFamily: "Consolas",
            fontWeight: FontWeight.bold,
            color: Colors.green,
        ),
      ),)
  );

  factory ContentBlock.subheading(String text) => ContentBlock._(
      (context) => Center(child:
      Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 20,
            fontFamily: "Consolas",
            fontWeight: FontWeight.w600,
            color: Colors.green
        ),
      ),)
  );

  factory ContentBlock.uncenteredSubheading(String text) => ContentBlock._(
          (context) => Text(
        text,
        style: const TextStyle(
            fontSize: 20,
            fontFamily: "Consolas",
            fontWeight: FontWeight.w600,
            color: Colors.green
        ),
      ),
  );

  factory ContentBlock.text(String text) => ContentBlock._(
        (context) => Text(
        text,
        style: const TextStyle(
            fontSize: 14,
            fontFamily: "Consolas",
            color: Colors.green
        ),
      )
  );

  factory ContentBlock.clickableText(String text) => ContentBlock._(
      (context) => Linkify(
        text: text,
        linkifiers: [UrlLinkifier(), PhoneNumberLinkifier(), EmailLinkifier()],
        onOpen: (link) async {
          if(link is EmailElement) {
            _launchMail(link.url);
          } else if (link is PhoneNumberElement) {
            _launchPhone(link.url);
          } else if (link is UrlElement) {
            _launchUrl(link.url);
          }
        },
        style: const TextStyle(
          fontSize: 14,
          fontFamily: "Consolas",
          color: Colors.green
        ),
        linkStyle: const TextStyle(
            color: Colors.blue,
            fontFamily: "Consolas",
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue),
      )
  );

  factory ContentBlock.image(String path) => ContentBlock._(
      (context) => ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      )
  );

  factory ContentBlock.spacer({double height = 16}) => ContentBlock._(
      (context) => SizedBox(height: height)
  );

  static Future<void> _launchMail(String mail) async {
    final Uri launchUri = Uri(
      scheme: 'mailto',
      path: mail
    );
    await launchUrl(launchUri);
  }

  static Future<void> _launchPhone(String number) async {
    final sanitizedNbr = number.replaceAll(RegExp(r'[^\d+]'), '');
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: sanitizedNbr
    );
    await launchUrl(launchUri);
  }

  static Future<void> _launchUrl(String url) async {
    await launchUrl(Uri.parse(url));
  }
}