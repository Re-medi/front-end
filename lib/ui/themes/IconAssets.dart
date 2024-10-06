import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconAssets {
  static SvgPicture iconFire({double size = 28, Color? color}) {
    return SvgPicture.asset(
      'assets/icons/icon_fire.svg',
      height: size,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconRemediOrange({double size = 30}) {
    return SvgPicture.asset(
      'assets/icons/icon_remedi_orange.svg',
      height: size,
    );
  }
}