import 'package:deroli_mobile/navigation/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        useMaterial3: true,
        fontFamily: 'IBMPlexSans',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarDividerColor: Colors.transparent,
          ),
        ),
      ),
      routerConfig: AppRouter().router,
    );
  }
}
