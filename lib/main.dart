import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 여기 추가
import 'package:remedi/ui/screens/DiseaseSelectionPage.dart';
import 'package:remedi/ui/themes/AppPalette.dart';
import 'package:remedi/ui/screens/UserDashboardPage.dart';
import 'package:remedi/data/models/PracticeState.dart'; // PracticeState 추가

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PracticeState(),
      child: MaterialApp(
        title: 'Re:medi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.primary),
          scaffoldBackgroundColor: AppPalette.background,
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const UserDashboardPage(),
          '/disease_selection': (context) => DiseaseSelectionPage(),
        },
      ),
    );
  }
}