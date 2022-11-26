import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double radius;
  final Function() resFunction;

  const CustomButton(
      {Key? key,
      required this.text,
      required this.radius,
      required this.resFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          bottom: 1.1,
          right: 1.1,
          child: Container(
            width: 100,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              gradient: LinearGradient(
                colors: [Color(0x9951545C), Color(0x0051545C)],
                begin: Alignment(-1, -1),
                end: Alignment(0.5, 0.1),
                transform: GradientRotation(0.8),
              ),
            ),
          ),
        ),
        Container(
          width: 100,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              colors: [Color(0xff1f252e), Color(0xff0c1015)],
              begin: Alignment(-1, -1),
              end: Alignment(0.5, 0),
              transform: GradientRotation(0.8),
            ),
          ),
          child: TextButton(
            // mainAxisAlignment: MainAxisAlignment.center,
            // children: [
            onPressed: () {
              resFunction();
            },
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xff51545C),
                fontFamily: 'DMSans',
                fontSize: 13,
                fontWeight: FontWeight.w700,
                shadows: <Shadow>[
                  Shadow(color: Color(0x66ffffff), blurRadius: 55.0)
                ],
              ),
            ),
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Color(0x1affffff)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                ))),
          ),
        ),
      ],
    );
  }
}
