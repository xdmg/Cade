import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          bodyText2:TextStyle(
            color: const Color(0xccffffff),
          ),
        ),
        scaffoldBackgroundColor: const Color(0xff0c1015),
      ),
      home: const Login(title: 'This is being changed'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key, required this.title});
  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome back, please login...',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Karla',
              ),
            ),
            SizedBox(
              height: 50.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?"
                    ),
                    SizedBox(width: 15),
                    Container(
                      child: InkWell(
                        onTap: () {},
                        child: Ink(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                              colors: [Color(0xff1f252e), Color(0xff0c1015)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: const Color(0xff51545C),
                                  fontFamily: 'DMSans',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
             ),
          ],
        ),
      ),
    );
  }
}
