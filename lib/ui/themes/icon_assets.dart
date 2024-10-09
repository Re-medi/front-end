import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

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

  // disease icons
  static SvgPicture iconInfectious({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_infectious.svg',
      height: size,
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconCardio({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_cardio.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconDerm({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_derm.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconEndo({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_endo.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconEnt({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_ent.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconGastro({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_gastro.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconGu({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_gu.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconHema({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_hema.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconMsk({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_msk.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconNeuro({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_neuro.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconOncoimmune({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_oncoimmune.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static SvgPicture iconRespiratory({double size = 60, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_respiratory.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static Widget animationLoading({double size = 80}) {
    return Lottie.asset(
        'assets/animations/animated_loading.json',
        height: size,
      repeat: true,
    );
  }

  static SvgPicture iconVoice({double size = 48, Color? color}) {
    return SvgPicture.asset(
        'assets/icons/icon_voice.svg',
        height: size,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null
    );
  }

  static Image iconPatient({double size = 96}) {
    return Image.asset(
        'assets/icons/icon_patient.png',
        height: size,
    );
  }
}