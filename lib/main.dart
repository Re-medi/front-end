import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remedi/ui/themes/app_palette.dart';
import 'package:remedi/ui/screens/user_dashboard_page.dart';
import 'package:remedi/ui/screens/disease_selection_page.dart';
import 'package:remedi/ui/screens/loading_page.dart';
import 'package:remedi/ui/screens/patient_creation_page.dart';
import 'package:remedi/ui/screens/medication_real_page.dart';
import 'package:remedi/ui/screens/medication_chat_page.dart';
import 'package:remedi/data/models/practice_state.dart';

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