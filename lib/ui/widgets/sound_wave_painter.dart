import 'package:flutter/material.dart';
import 'dart:math';
import 'package:remedi/ui/themes/app_palette.dart';

class SoundWavePainter extends CustomPainter {
  final double soundLevel;
  double smoothedSoundLevel = 0.0;

  SoundWavePainter(this.soundLevel);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppPalette.lightGray
      ..style = PaintingStyle.fill;

    final barCount = 12;
    final barWidth = 8.0;
    final spacing = 4.0;
    final maxHeight = 4.0;
    final minHeight = 8.0;
    final cornerRadius = Radius.circular(9.0);
    final random = Random();

    smoothedSoundLevel = smoothedSoundLevel * 0.3 + soundLevel * 0.7;

    final totalWidth = barCount * barWidth + (barCount - 1) * spacing;
    double startX = (size.width - totalWidth) / 2;

    for (int i = 0; i < barCount; i++) {
      final randomFactor = 0.8 + random.nextDouble() * 0.4;
      final barHeight = max(minHeight, (smoothedSoundLevel * maxHeight * randomFactor));

      final x = startX + i * (barWidth + spacing);
      final y = (size.height / 2) - (barHeight / 2);

      final rRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        cornerRadius,
      );

      canvas.drawRRect(rRect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}