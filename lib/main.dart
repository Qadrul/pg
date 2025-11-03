import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pg/providers/quiz_provider.dart';
import 'package:pg/routes/app_route.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Quiz App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFEAF2FF),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2F6DFF)),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
