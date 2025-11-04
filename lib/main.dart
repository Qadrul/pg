import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pg/providers/quiz_provider.dart';
import 'package:pg/providers/theme_provider.dart';
import 'package:pg/routes/app_route.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp.router(
          title: 'Quiz App',
          theme: themeProvider.themeData, // ← pakai theme dari provider
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}