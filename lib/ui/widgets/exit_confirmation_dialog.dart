import 'package:flutter/material.dart';
import 'package:remedi/ui/themes/app_text_styles.dart';
import 'package:remedi/ui/themes/app_palette.dart';
import 'package:remedi/ui/themes/icon_assets.dart';

Future<bool> showExitConfirmationDialog(BuildContext context) async {
  return await showModalBottomSheet<bool>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconAssets.iconPatient(),
            const SizedBox(height: 16),
            Text("실습을 정말 끝내시겠어요?", style: AppTextStyles.h2()),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPalette.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 0,
                ),
                onPressed: () => Navigator.of(context).pop(true),
                child: Text("대화 끝내기", style: AppTextStyles.buttonText(color: AppPalette.white)),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPalette.lightGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 0,
                ),
                onPressed: () => Navigator.of(context).pop(false),
                child: Text("취소하기", style: AppTextStyles.buttonText(color: AppPalette.darkGray)),
              ),
            ),
          ],
        ),
      );
    },
  ) ?? false;
}