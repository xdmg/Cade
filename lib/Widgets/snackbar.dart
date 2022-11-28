import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:another_flushbar/flushbar.dart';

class FlushBar{
  final String message;
  final BuildContext passedContext;

  FlushBar(this.message, this.passedContext);

  Flushbar<bool> showFlushBar(){
    return Flushbar<bool>(
      barBlur: 5,
      flushbarStyle: FlushbarStyle.FLOATING,
      // leftBarIndicatorColor: Color(0xffc97846),
      backgroundColor: Color(0x99000000),
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      icon: Icon(Icons.error_outline,color: Color(0xffc97846)),
      duration: Duration(seconds:3),
      messageText: Text(
        message,
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          fontFamily: 'Karla',
        ),
      ),
    )..show(passedContext);
  }
}
