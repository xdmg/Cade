import 'package:daily_coffee/Widgets/button.dart';
import 'package:daily_coffee/Widgets/input.dart';
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

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController emailController;
  late CustomTextField passwordInput;

  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    emailController = TextEditingController();
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
            SizedBox(height: 15),
            CustomTextField(
              radius: 7,
              text: "Email",
              icon: Icons.email_outlined,
              controller: emailController,
              notifyParent: refresh,
            ),
            SizedBox(height: 10),
            CustomTextField(
              radius: 7,
              text: "Password",
              icon: Icons.key_outlined,
              parent: true,
              controller: emailController,
              notifyParent: refresh,
            ),
            SizedBox(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontFamily: 'Karla',
                      ),
                    ),
                    SizedBox(width: 15),
                    CustomButton(text: "SIGN UP", radius: 5.0),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
