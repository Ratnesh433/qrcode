import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/gen_qr.dart';
import 'pages/scan_qr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/home": (context) => const HomePage(),
        "/generate": (context) => const GenerateCodePage(),
        "/scan": (context) => const ScanCodePage(),
      },
      initialRoute: "/home",
    );
  }
}
  