import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // ← untuk state management berbasis Provider
import 'package:pg/providers/quiz_provider.dart'; // ← provider yang mengatur logika kuis (state & data)
import 'package:pg/providers/theme_provider.dart'; // ← provider yang mengatur tema (dark/light mode)
import 'package:pg/routes/app_route.dart'; // ← file yang berisi konfigurasi navigasi aplikasi (router)

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider()), // ← Inisialisasi provider kuis
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // ← Inisialisasi provider tema
      ],
      child: const MyApp(), // ← Root widget aplikasi
    ),
  );
}

///
/// KELAS UTAMA APLIKASI
/// 
/// `MyApp` adalah root dari seluruh widget aplikasi.
/// Ia menggunakan Provider untuk mengelola state tema & data kuis.
/// Ini menerapkan prinsip **Encapsulation & Polymorphism**
/// karena `ThemeProvider` dan `QuizProvider` memiliki method publik yang 
/// menyembunyikan detail internalnya dari UI.
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      // Consumer memantau perubahan pada ThemeProvider
      builder: (context, themeProvider, _) {
        return MaterialApp.router(
          title: 'PG',
          theme: themeProvider.themeData, 
          // ← Menggunakan data tema dari provider → contoh **Encapsulation**:
          // UI tidak langsung mengubah tema, tetapi melalui ThemeProvider.

          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router, 
          // ← Navigasi berbasis router (go_router) → contoh **modular design** dan **clean architecture**
        );
      },
    );
  }
}
