import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/ui/themes/AppPalette.dart';
import 'package:remedi/ui/screens/UserDashboardPage.dart';
import 'package:remedi/ui/screens/DiseaseSelectionPage.dart';
import 'package:remedi/ui/screens/LoadingPage.dart';
import 'package:remedi/ui/screens/PatientCreationPage.dart';
import 'package:remedi/ui/screens/MedicationRealPage.dart';
import 'package:remedi/ui/screens/MedicationChatPage.dart';
import 'package:remedi/data/models/PracticeState.dart';

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
          '/disease_selection': (context) => const DiseaseSelectionPage(),
          '/loading': (context) => const Loadingpage(),
          '/patient': (context) => const PatientCreationPage(),
          '/chat': (context) => const MedicationChatPage(),
          '/real': (context) => const MedicationRealPage(),
        },
      ),
    );
  }
}