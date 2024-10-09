import 'package:flutter/material.dart';
import 'package:remedi/ui/themes/app_palette.dart';

class RecordingChatButton extends StatelessWidget {
  final bool isListening;
  final VoidCallback onStart;
  final VoidCallback onStop;
  final VoidCallback onSend;

  const RecordingChatButton({
    Key? key,
    required this.isListening,
    required this.onStart,
    required this.onStop,
    required this.onSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 80.0,
              height: 80.0,
              child: FloatingActionButton(
                onPressed: isListening ? onSend : onStart,
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
          ),
          // 녹음 중일 때 나타나는 Stop 버튼을 오른쪽으로 이동하여 위치 고정
          if (isListening)
            Positioned(
              bottom: 0,
              right: 90, // 오른쪽으로 떨어진 위치 조정
              child: SizedBox(
                width: 52.0,
                height: 52.0,
                child: FloatingActionButton(
                  onPressed: onStop,
                  backgroundColor: AppPalette.lightGray,
                  elevation: 0,
                  child: Icon(
                    Icons.close_rounded,
                    size: 24,
                    color: AppPalette.darkGray,
                  ),
                  shape: CircleBorder(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}