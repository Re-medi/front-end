import 'package:flutter/material.dart';
import 'package:remedi/ui/themes/app_palette.dart';

class RecordingButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onStart;
  final VoidCallback onStop;

  const RecordingButton({
    Key? key,
    required this.isListening,
    required this.onStart,
    required this.onStop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36.0),
      child: SizedBox(
        width: 80.0,
        height: 80.0,
        child: FloatingActionButton(
          onPressed: isListening ? onStop : onStart,
          backgroundColor: isListening ? AppPalette.primaryHighlight : AppPalette.primary,
          elevation: 0,
          child: Icon(
            isListening ? Icons.upload_rounded : Icons.mic_rounded,
            size: 40,
            color: isListening ? AppPalette.primary : AppPalette.white,
          ),
          shape: CircleBorder(
            side: BorderSide(
              color: isListening ? AppPalette.primaryDark : AppPalette.primary,
              width: 4.0,
            ),
          ),
        ),
      ),
    );
  }
}