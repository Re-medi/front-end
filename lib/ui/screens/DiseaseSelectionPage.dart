import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/ui/themes/AppTextStyles.dart';
import 'package:remedi/ui/themes/AppPalette.dart';
import 'package:remedi/data/models/Disease.dart';
import '../../data/models/PracticeState.dart';

class DiseaseSelectionPage extends StatelessWidget {
  Widget _buildHeader() {
    return Column(
      children: [
        Text("질환 선택하기", style: AppTextStyles.h2()),
        const SizedBox(height: 4),
        Text("원하는 질환 분야를 선택하세요.", style: AppTextStyles.body(color: AppPalette.gray)),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildDiseaseGridView(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 한 줄에 두 개의 카드 배치
          mainAxisSpacing: 10,  // 세로 간격 설정
          crossAxisSpacing: 10, // 가로 간격 설정
          childAspectRatio: 160 / 145, // 가로:세로 비율 설정
        ),
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 10.0),
        itemCount: diseaseCards.length,
        itemBuilder: (context, index) {
          final disease = diseaseCards[index];
          return _buildDiseaseCard(context, disease);
        },
      ),
    );
  }

  Widget _buildKeyword(String keyword) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: AppPalette.primaryHighlight,
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Text(keyword, style: AppTextStyles.cardKeyword(color: AppPalette.primary),),
    );
  }

  Widget _buildDiseaseCard(BuildContext context, Disease disease) {
    return InkWell(
      onTap: () {
        Provider.of<PracticeState>(context, listen: false)
            .selectDiseaseCategory(disease.category);
        Navigator.pushNamed(context, '/loading');
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppPalette.white,
          border: Border.all(
            color: AppPalette.lightGray,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            disease.icon,
            const SizedBox(height: 10),
            Text(disease.name, style: AppTextStyles.cardTitle(color: AppPalette.black)),
            const SizedBox(height: 8),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,),
                child: Row(
                    children: [
                      _buildKeyword(disease.keywords[0]),
                      const SizedBox(width: 4),
                      _buildKeyword(disease.keywords[1])
                    ])
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close), // X 표시 아이콘
          onPressed: () {
            Navigator.pop(context); // 페이지 닫기
          },
        ),
        backgroundColor: AppPalette.background,
      ),
      body: Center(
        child: Column(
          children: [
            _buildHeader(),
            _buildDiseaseGridView(context),
          ],
        ),
      ),
    );
  }
}