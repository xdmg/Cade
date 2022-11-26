import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Services/auth.dart';
import 'Widgets/button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return Scaffold(
      body: Center(
        child: CustomButton(
            text: "SIGN OUT",
            radius: 5.0,
            resFunction: () {
              _auth.signOut();
            }),
      ),
    );
  }
}
