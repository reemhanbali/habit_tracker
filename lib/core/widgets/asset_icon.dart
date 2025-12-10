import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssetIcon extends StatelessWidget {
  final String path;
  final double size;

  const AssetIcon(this.path, {super.key, this.size = _iconSize});

  @override
  Widget build(BuildContext context) {
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(path, width: size, height: size);
    }
    return Image.asset(path, width: size, height: size);
  }

  static const double _iconSize = 20;
}
