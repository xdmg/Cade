import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double radius;
  final double size;
  final Function() resFunction;

  const CustomIconButton(
      {Key? key,
      required this.radius,
      required this.resFunction,
      required this.icon,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          bottom: 1.0,
          right: 1.0,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              gradient: LinearGradient(
                colors: [Color(0x9951545C), Color(0x0051545C)],
                begin: Alignment(-1, -1),
                end: Alignment(0.5, 1),
                transform: GradientRotation(0.3),
              ),
            ),
          ),
        ),
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              colors: [Color(0xff1f252e), Color(0xff0c1015)],
              begin: Alignment(-1, -1),
              end: Alignment(0.5, 1),
              transform: GradientRotation(0.0),
            ),
          ),
          child: Center(
            child: TextButton(
              // mainAxisAlignment: MainAxisAlignment.center,
              // children: [
              onPressed: () {
                resFunction();
              },
              child: Icon(
                icon,
                color: Color(0xff51545C),
                shadows: <Shadow>[
                  Shadow(color: Color(0x59ffffff), blurRadius: 45.0)
                ],
              ),
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Color(0x1affffff)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius),
                  ))),
            ),
          ),
        ),
      ],
    );
  }
}
