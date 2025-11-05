import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // // Navigasi otomatis ke halaman input nama setelah 2 detik
    Future.delayed(const Duration(seconds: 2), () {
      context.go('/name');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'), // // Menggunakan aset gambar → mempercantik UI
          width: 120,                                     // // Ukuran responsif bisa ditingkatkan (misal relative ke lebar layar)
        ),
      ),
    );
  }
}
