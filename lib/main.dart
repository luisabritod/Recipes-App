import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitas_app/core/theme/app_theme.dart';
import 'package:receitas_app/pages/pages.dart';
import 'package:receitas_app/providers/providers.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ReceitasProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
