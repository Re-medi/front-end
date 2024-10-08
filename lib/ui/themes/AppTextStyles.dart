import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AppPalette.dart';

class AppTextStyles {

  static TextStyle h1({Color color = AppPalette.black}) {
    return GoogleFonts.inter(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
      color: color
    );
  }

  static TextStyle h2({Color color = AppPalette.black}) {
    return GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: color
    );
  }

  static TextStyle h3({Color color = AppPalette.black}) {
    return GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        color: color
    );
  }

  static TextStyle h4({Color color = AppPalette.black}) {
    return GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        color: color
    );
  }

  static TextStyle h5({Color color = AppPalette.black}) {
    return GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        height: 1.16,
        color: color
    );
  }

  static TextStyle cardTitle({Color color = AppPalette.black}) {
    return GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.6,
        color: color
    );
  }

  static TextStyle cardKeyword({Color color = AppPalette.black}) {
    return GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.8,
        color: color
    );
  }

  static TextStyle tableTitle({Color color = AppPalette.darkGray}) {
    return GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.7,
        color: color
    );
  }

  static TextStyle tableText({Color color = AppPalette.black}) {
    return GoogleFonts.inter(
        fontSize: 12,
        letterSpacing: -0.6,
        color: color
    );
  }


  static TextStyle body({Color color = AppPalette.black}) {
    return GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: color,
        letterSpacing: -0.2
    );
  }

  static TextStyle buttonText({Color color = AppPalette.white}) {
    return GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: color,
        letterSpacing: 0.8
    );
  }

  static TextSpan highlightedText({
    required String mainText,
    required String subText,
    TextStyle? style,
    double subSizeFactor = 0.7,
    Color color = Colors.black,
  }) {
    // default style
    style ??= h2(color: color);
    return TextSpan(
      children: [
        TextSpan(
          text: mainText,
          style: style.copyWith(color: color),
        ),
        const WidgetSpan(
          child: SizedBox(width: 2), // 원하는 간격 추가
        ),
        TextSpan(
          text: subText,
          style: style.copyWith(
            color: color,
            fontSize: style.fontSize != null
                ? style.fontSize! * subSizeFactor
                : null,
          ),
        ),
      ]
    );
  }

}