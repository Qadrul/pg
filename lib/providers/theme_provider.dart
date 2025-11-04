import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadTheme(); // panggil saat inisialisasi
  }

  /// 🔹 Ubah tema dan simpan ke SharedPreferences
  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
  }

  /// 🔹 Ambil tema terakhir dari SharedPreferences
  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  ThemeData get themeData {
    return _isDarkMode
        ? ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            colorScheme: const ColorScheme.dark(
              primary: Colors.white,
              secondary: Colors.grey,
            ),
          )
        : ThemeData.light().copyWith(
            scaffoldBackgroundColor: const Color(0xFFEAF2FF),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFEAF2FF),
              iconTheme: IconThemeData(color: Colors.black),
            ),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2F6DFF),
              secondary: Color(0xFF6B7BA3),
            ),
          );
  }
}
