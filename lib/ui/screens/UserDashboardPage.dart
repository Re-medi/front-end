import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:remedi/ui/themes/AppPalette.dart';
import 'package:remedi/ui/themes/AppTextStyles.dart';
import 'package:remedi/ui/themes/IconAssets.dart';
import '../../data/models/PracticeState.dart';
import '../widgets/ClipOvalIcon.dart';
import '../widgets/MetaInfoSection.dart';
import '../widgets/PracticeCard.dart';



class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({super.key});

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {

  Widget _buildNameSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RichText(
          text: AppTextStyles.highlightedText(
            mainText: '김약사',
            subText: '님',
            style: AppTextStyles.h1(),
          ),
        ),
        Text('아는 것은 약이다! Re:medi가 도와줄게요', style: AppTextStyles.body(color: AppPalette.gray)),
        const SizedBox(height: 8)
      ],
    );
  }

  Widget _buildPracticeCardsSection() {
    return Column(
      children: [
        Expanded(flex: 1,child:
        PracticeCard(
          title: 'AI 환자와 연습 대화',
          subtitle: 'AI 튜터와 복약지도',
          duration: '5분',
          iconData: ClipOverIcon(icon: IconAssets.iconFire(color: AppPalette.primary), bgColor: AppPalette.primaryHighlight),
          buttonText: "AI 튜터와 복약지도",
          onTap: () {
            Provider.of<PracticeState>(context, listen: false).selectPracticeType(PracticeType.practiceChat);
            Navigator.pushNamed(context, '/disease_selection');
          },
        )),
        const SizedBox(height: 4),
        Expanded(flex: 1,child:
        PracticeCard(
          title: 'AI 환자와 실전 대화',
          subtitle: 'AI 튜터와 복약지도',
          duration: '3분',
          iconData: IconAssets.iconRemediOrange(size: 40),
          buttonText: "처방전으로만 복약지도",
          bgColor: AppPalette.secondary,
            highlightColor : AppPalette.secondaryHighlight,
            onTap: () {
              Provider.of<PracticeState>(context, listen: false).selectPracticeType(PracticeType.realChat);
              Navigator.pushNamed(context, '/disease_selection');
            }
        )),
      ],
    );
  }

  Widget _historyHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 12.0, 8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("최근 복약지도 실습", style: AppTextStyles.h4(color: AppPalette.gray),),
          Text("모든 실습 보기", style: AppTextStyles.h5(color: AppPalette.primary),),
        ])
    );
  }

  Widget _buildPracticeHistorySection() {
    return Column(
        children: [
          _historyHeader(),
          Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppPalette.lightGray,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                )),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> infoData = [
      {'content': '16', 'unit': '개', 'title': '총 실습\n활동'},
      {'content': '23', 'unit': '분', 'title': '총 학습\n시간'},
      {'content': '48', 'unit': '개', 'title': '내가\n지도한 약물'}
    ];

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(flex: 4, child: _buildNameSection()),
              Expanded(flex: 3, child: MetaInfoSection(infoData: infoData)),
              Expanded(flex: 6, child: _buildPracticeCardsSection()),
              Expanded(flex: 10, child: _buildPracticeHistorySection()),
            ],
          ),
        ),
      ),
    );
  }
}