import 'package:daily_coffee/Widgets/button.dart';
import 'package:daily_coffee/Widgets/input.dart';
import 'package:daily_coffee/Widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'Services/auth.dart';

class Login extends StatefulWidget {
  final Function() switcher;

  Login({
    super.key,
    required this.switcher,
  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<CustomTextFieldState> _key = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _auth = AuthService();
  late CustomTextField passwordInput;

  notifyParent() {
    _key.currentState!.setState(() {});
  }

  void showError(BuildContext context, String Message) {
    final snackBar = SnackBar(
        padding: null,
        backgroundColor: Color(0x00ffffff),
        content: Container(
            padding: null,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(Message)));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
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
                  sync: true,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  key: _key,
                  radius: 7,
                  text: "Password",
                  icon: Icons.key_outlined,
                  parent: true,
                  sync: true,
                  childController: emailController,
                  parentController: passwordController,
                  notifyParent: notifyParent,
                  hideText: true,
                  onClick: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    context.loaderOverlay.show();
                    dynamic result = await _auth.signIn(
                        emailController.text, passwordController.text);
                    context.loaderOverlay.hide();
                    if (result.runtimeType == String)
                      FlushBar(result, context).showFlushBar();
                    passwordController.text = "";
                  },
                ),
              ],
            ),
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
                  CustomButton(
                      text: "SIGN UP",
                      radius: 5.0,
                      resFunction: () {
                        widget.switcher();
                      }),
                ],
              )),
        ],
      ),
    );
  }
}
