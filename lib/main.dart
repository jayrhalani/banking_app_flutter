import 'package:banking_app_flutter/resources/asset_res.dart';
import 'package:flutter/material.dart';
import 'package:banking_app_flutter/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neobank',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        fontFamily: AssetRes.sairaFamily,
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
