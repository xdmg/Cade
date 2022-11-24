import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffc97846),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: const Color(0xccffffff),
          ),
        ),
        scaffoldBackgroundColor: const Color(0xff0c1015),
      ),
      home: Login(),
    );
  }
}
