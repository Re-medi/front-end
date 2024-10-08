import 'package:flutter/material.dart';
import 'package:remedi/ui/themes/app_palette.dart';
import 'package:remedi/ui/themes/app_text_styles.dart';

class MetaInfoSection extends StatelessWidget {
  final List<Map<String, String>> infoData;

  const MetaInfoSection({
    super.key,
    required this.infoData,
  });

  Widget _infoColumn({
    required String content,
    required String unit,
    required String title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: AppTextStyles.highlightedText(
            mainText: content,
            subText: unit,
            style: AppTextStyles.h2(),
            color: AppPalette.darkGray,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: AppTextStyles.h5(color: AppPalette.gray),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(
      height: 44,
      alignment: Alignment.center,
      child: const VerticalDivider(
        width: 1.0,
        color: AppPalette.lightGray,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(infoData.length, (index) {
          final item = infoData[index];
          return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _infoColumn(
                    content: item['content'] ?? '',
                    unit: item['unit'] ?? '',
                    title: item['title'] ?? '',
                  ),
                ),
                if (index < infoData.length - 1)
                  _verticalDivider(),
              ],
            ),
          );
        }),
    );
  }
}