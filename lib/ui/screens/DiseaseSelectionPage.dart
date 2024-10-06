import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DiseaseSelectionPage extends StatelessWidget {

  Widget _header() {
    return Column(
      children: [
        Text("질환 선택하기")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close), // X 표시 아이콘
          onPressed: () {
            Navigator.pop(context); // 페이지 닫기
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            _header(),
            Text("안뇽")
          ],
        ),
      )
    );
  }
}