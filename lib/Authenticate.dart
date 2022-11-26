import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Login.dart';
import 'Register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool flag = false;

  void switcher() {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return flag ? Login(switcher: switcher) : Register(switcher: switcher);
  }
}
