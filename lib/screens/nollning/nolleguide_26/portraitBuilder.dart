import 'package:flutter/material.dart';

class PortraitData {
  final String imagePath;
  final int flex;
  final VoidCallback? onTap;

  const PortraitData({
    required this.imagePath,
    this.flex = 1,
    this.onTap
  });
}

class PortraitRow extends StatelessWidget {
  final List<PortraitData> portraits;
  final int sideFlex;
  final int gapFlex;

  const PortraitRow({
    super.key,
    required this.portraits,
    this.sideFlex = 1,
    this.gapFlex = 1,
  });

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      Expanded(flex: sideFlex, child: const SizedBox()),
    ];

    for (var i = 0; i < portraits.length; i++) {
      final p = portraits[i];
      children.add(
        Expanded(
          flex: p.flex,
          child: InkWell(
            onTap: p.onTap,
            child: Image.asset(
              p.imagePath,
              fit: BoxFit.fitWidth,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
            ),
          ),
        ),
      );
      if (i != portraits.length - 1) {
        children.add(Expanded(flex: gapFlex, child: const SizedBox()));
      }
    }
    children.add(Expanded(flex: sideFlex, child: const SizedBox()));

    return Row(children: children);
  }
}