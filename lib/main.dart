import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:health_code/providers/auth_provider.dart';
import 'package:health_code/providers/doctor_provider.dart';
import 'package:health_code/providers/appointment_provider.dart';
import 'package:health_code/screens/splash_screen.dart';
import 'package:health_code/theme/app_theme.dart';

void main() {
  runApp(const HealthCodeApp());
}

class HealthCodeApp extends StatelessWidget {
  const HealthCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ChangeNotifierProvider(create: (_) => AppointmentProvider()),
      ],
      child: MaterialApp(
        title: 'Health Code',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
