import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pg/providers/theme_provider.dart';

class ThemeToggleIcon extends StatelessWidget {
  const ThemeToggleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);  // // Akses ThemeProvider
    final isDark = themeProvider.isDarkMode;

    return IconButton(
      icon: Icon(
        isDark ? Icons.wb_incandescent_rounded : Icons.wb_sunny_rounded, // // Icon berubah sesuai tema
        color: isDark ? Colors.white : Colors.black,                        // // Warna icon menyesuaikan mode
      ),
      onPressed: () {
        themeProvider.toggleTheme(); // // Toggle tema → update state global
      },
    );
  }
}
