import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pg/widgets/theme_toogle_icon.dart';
import 'package:provider/provider.dart';
import 'package:pg/providers/quiz_provider.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController nameController = TextEditingController();  // // Controller input nama

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);  // // Mengakses QuizProvider
    final theme = Theme.of(context);                     // // Mengakses tema (dual theme)

    return Scaffold(
      appBar: AppBar(
        actions: const [ThemeToggleIcon()],             // // Tombol toggle tema
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Masukkan Nama Kamu...",
                style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w100, // Thin
                fontSize: 18,
                color: theme.colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Nama",
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',                     // ← Tambahkan font Poppins
                  fontWeight: FontWeight.w100,
                  color: theme.hintColor,
                ),
                filled: true,
                fillColor: theme.inputDecorationTheme.fillColor ?? theme.cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontFamily: 'Poppins'), // ← Tambahkan font Poppins untuk teks input
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  provider.setName(nameController.text); // // Simpan nama ke provider
                  context.go('/quiz');                   // // Navigasi ke halaman quiz
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontFamily: 'Poppins', 
                  fontWeight: FontWeight.w400,
                  ),   // ← Tambahkan font Poppins
              ),
            ),
          ],
        ),
      ),
    );
  }
}
