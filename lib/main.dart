import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/student_model.dart';
import 'screens/dashboard_screen.dart';
import 'theme/app_theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Student adapter
  Hive.registerAdapter(StudentModelAdapter());

  // Open students database box
  await Hive.openBox<StudentModel>('students');

  runApp(const DeboraApp());
}


class DeboraApp extends StatelessWidget {
  const DeboraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Debora School',

      theme: AppTheme.lightTheme,

      home: const DashboardScreen(),
    );
  }
}