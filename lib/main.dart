import 'package:deroli_mobile/screens/Amount/AmountPage.dart';
import 'package:deroli_mobile/screens/Request-Money/request_money.dart';
import 'package:deroli_mobile/screens/home/activities.dart';
import 'package:deroli_mobile/screens/receipt/receipt.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IBMPlexSans',
        scaffoldBackgroundColor: Color(0xFFF9F9F9),
      ),
      home: RequestMoney(),
    );
  }
}
