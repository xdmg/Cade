import 'package:daily_coffee/Widgets/button.dart';
import 'package:daily_coffee/Widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<CustomTextFieldState> _key = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  late CustomTextField passwordInput;

  notifyParent() {
    _key.currentState!.setState(() {});
  }

  // @override
  // void initState() {
  // emailController = TextEditingController();
  // }

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
              notifyParent: notifyParent,
            ),
            SizedBox(height: 10),
            CustomTextField(
              key: _key,
              radius: 7,
              text: "Password",
              icon: Icons.key_outlined,
              parent: true,
              controller: emailController,
              notifyParent: notifyParent,
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