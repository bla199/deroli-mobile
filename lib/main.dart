import 'package:deroli_mobile/navigation/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IBMPlexSans',
        scaffoldBackgroundColor: Color(0xFFF9F9F9),
      ),
      routerConfig: AppRouter().router,
    );
  }
}
