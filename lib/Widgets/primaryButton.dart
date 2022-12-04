import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryCustomButton extends StatelessWidget {
  final String text;
  final double radius;
  double? width;
  double? height;
  IconData? icon;
  final Function() resFunction;

  PrimaryCustomButton({
    Key? key,
    required this.text,
    required this.radius,
    required this.resFunction,
    this.width,
    this.height,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          bottom: 0.6,
          child: Container(
            width: width != null ? width : 60,
            height: height != null ? height : 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Color(0xfffda168),
            ),
          ),
        ),
        Container(
          width: width != null ? width : 60,
          height: height != null ? height : 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Color(0xffC97846),
            boxShadow: [
              BoxShadow(
                color: Color(0x99C97846),
                blurRadius: 30,
              )
            ],
          ),
          child: TextButton(
            onPressed: () {
              resFunction();
            },
            child: icon == null
                ? Text(text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xffffffff),
                      fontFamily: 'Karla',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ))
                : Icon(
                    icon,
                    size: 14,
                    color: Colors.white,
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
