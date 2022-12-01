import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryCustomButton extends StatelessWidget {
  final String text;
  final double radius;
  final Function() resFunction;

  const PrimaryCustomButton(
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
          bottom: 0.6,
          child: Container(
            width: 60,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Color(0xfffda168),
            ),
          ),
        ),
        Container(
          width: 60,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Color(0xffC97846),
            boxShadow: [BoxShadow(
              color: Color(0x59C97846),
              blurRadius: 30,
            )],
          ),
          child: TextButton(
            onPressed: () {
              resFunction();
            },
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xffffffff),
                fontFamily: 'DMSans',
                fontSize: 12,
                fontWeight: FontWeight.w700,
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
