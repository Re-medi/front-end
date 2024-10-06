import 'package:flutter/material.dart';
import 'package:remedi/ui/themes/AppTextStyles.dart';
import 'package:remedi/ui/themes/AppPalette.dart';
import 'package:remedi/ui/themes/IconAssets.dart';
import 'package:remedi/data/models/Disease.dart';
import 'package:lottie/lottie.dart';
class Loadingpage extends StatelessWidget {
  Widget _buildHeader() {
    return Column(
      children: [
        Text("환자 생성 중...", style: AppTextStyles.h2()),
        const SizedBox(height: 4),
        Text("Re:medi가 실습에 적절한 환자를 생성하고 있어요.", style: AppTextStyles.body(color: AppPalette.gray)),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildLoading() {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconAssets.animationLoading(),
            const SizedBox(height: 100),
          ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppPalette.background,
      ),
      body: Center(
        child: Column(
          children: [
            _buildHeader(),
            _buildLoading()
          ],
        ),
      ),
    );
  }
}