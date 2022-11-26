import 'package:daily_coffee/Widgets/button.dart';
import 'package:daily_coffee/Widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_coffee/Services/auth.dart';

class Register extends StatefulWidget {
  final Function() switcher;

  Register({super.key, required this.switcher});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<CustomTextFieldState> _key = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _auth = AuthService();
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
              'New here? Sign-up to start!',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Karla',
              ),
            ),
            SizedBox(height: 15),
            Form(
                child: Column(
              children: [
                CustomTextField(
                  radius: 7,
                  text: "Email",
                  icon: Icons.email_outlined,
                  childController: emailController,
                  parentController: passwordController,
                  notifyParent: notifyParent,
                  onClick: () {},
                ),
                SizedBox(height: 10),
                CustomTextField(
                  key: _key,
                  radius: 7,
                  text: "Password",
                  icon: Icons.key_outlined,
                  parent: true,
                  childController: emailController,
                  parentController: passwordController,
                  notifyParent: notifyParent,
                  hideText: true,
                  onClick: () async {
                    dynamic result = await _auth.register(
                        emailController.text, passwordController.text);
                    if (result == null) print("Try again please");
                  },
                ),
              ],
            )),
            SizedBox(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontFamily: 'Karla',
                      ),
                    ),
                    SizedBox(width: 15),
                    CustomButton(
                        text: "LOGIN",
                        radius: 5.0,
                        resFunction: () {
                          widget.switcher();
                        }),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
