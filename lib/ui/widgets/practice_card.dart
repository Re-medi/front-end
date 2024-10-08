import 'package:flutter/material.dart';
import 'package:remedi/ui/themes/app_palette.dart';
import 'package:remedi/ui/themes/app_text_styles.dart';

class PracticeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String duration;
  final String buttonText;
  final Widget iconData;
  final Color bgColor;
  final Color highlightColor;
  final VoidCallback onTap;

  const PracticeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.iconData,
    required this.buttonText,
    required this.onTap,
    this.bgColor = AppPalette.primary,
    this.highlightColor = AppPalette.primaryHighlight
  });

  Widget _title({
    required String title,
    required String time,
}) {
    return Row(
      children: [
        iconData,
        const SizedBox(width: 12),
        Text(title, style: AppTextStyles.h4(color: AppPalette.white)),
      ],
    );
  }

  Widget _header({
    required String title,
    required String time,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _title(title: title, time: time),
        Text(time, style: AppTextStyles.h4(color: highlightColor))
      ],
    );
  }

  Widget _button({required String buttonText}) {
    return Container(
        decoration: BoxDecoration(
          color: AppPalette.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
      child: Center(
        child: Text(buttonText, style: AppTextStyles.buttonText(color: bgColor),)
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Column(
          children: [
            Expanded(flex: 1, child: _header(title: title, time: duration)),
            const SizedBox(height: 2),
            Expanded(flex: 1, child: _button(buttonText: buttonText)),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}