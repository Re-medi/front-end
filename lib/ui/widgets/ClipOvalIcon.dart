import 'package:flutter/material.dart';
import 'package:remedi/ui/themes/AppPalette.dart';

class ClipOverIcon extends StatelessWidget {
  final Widget icon;
  final double circleSize;
  final Color? bgColor;

  const ClipOverIcon({
    super.key,
    required this.icon,
    this.circleSize = 36,
    this.bgColor = AppPalette.lightGray,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: bgColor,
        width: circleSize,
        height: circleSize,
        child: Center(
          child: SizedBox(
            child: icon,        // 아이콘 출력
          ),
        ),
      ),
    );
  }
}