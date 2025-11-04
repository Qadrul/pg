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
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Soal 1/3',
          style: TextStyle(color: theme.colorScheme.onBackground),
        ),
        actions: const [ThemeToggleIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Masukkan Nama Kamu...",
              style: TextStyle(
                fontSize: 18,
                color: theme.colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Nama",
                hintStyle: TextStyle(color: theme.hintColor),
                filled: true,
                fillColor: theme.inputDecorationTheme.fillColor ?? theme.cardColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  provider.setName(nameController.text);
                  context.go('/quiz');
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
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
