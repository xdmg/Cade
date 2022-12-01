import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final double radius;
  final String text;
  final IconData icon;
  final TextEditingController childController;
  final TextEditingController? parentController;
  final Function() notifyParent;
  final Function() onClick;
  final hideText;
  bool parent;

  CustomTextField(
      {Key? key,
      required this.radius,
      required this.text,
      required this.icon,
      required this.childController,
      this.parent = false,
      required this.notifyParent,
      this.hideText = false,
      required this.onClick,
      this.parentController})
      : super(key: key);

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          width: MediaQuery.of(context).size.width * 0.85,
          height: 50,
          bottom: 1.1,
          right: 1.1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
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
          width: MediaQuery.of(context).size.width * 0.85,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            gradient: LinearGradient(
              colors: [Color(0xff1f252e), Color(0xff0c1015)],
              begin: Alignment(-1, -1),
              end: Alignment(0.3, 0),
              transform: GradientRotation(0.97),
            ),
          ),
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            controller: widget.parent
                ? widget.parentController
                : widget.childController,
            onChanged: (text) {
              widget.notifyParent();
            },
            obscureText: widget.hideText,
            minLines: null,
            maxLines: 1,
            cursorColor: Colors.grey,
            style: TextStyle(
              color: const Color(0x99ffffff),
              fontFamily: 'Karla',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.fade,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixIcon: Icon(widget.icon,
                  shadows: <Shadow>[
                    Shadow(color: Color(0x59ffffff), blurRadius: 45.0)
                  ],
                  color: Color(0xff51545C)),
              suffixIcon: widget.parent
                 ? widget.childController.text.length > 0 &&
                          widget.parentController!.text.length > 0
                      ? MaterialButton(
                          child: Icon(
                            Icons.send,
                            color: Color(0xffc97846),
                            shadows: <Shadow>[
                              Shadow(color: Color(0xffc97846), blurRadius: 55.0)
                            ],
                          ),
                          minWidth: 0,
                          padding: EdgeInsets.zero,
                          shape: const CircleBorder(),
                          onPressed: () {
                            widget.onClick();
                          })
                      : null
                  : null,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              hintText: widget.text,
              hintStyle: TextStyle(
                color: const Color(0xff51545C),
                fontFamily: 'Karla',
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
