import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final double radius;
  final String text;
  final IconData icon;

  const CustomTextField(
      {Key? key, required this.radius, required this.text, required this.icon})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _textController = new TextEditingController();
  bool showSendIcon = false;

  TextEditingController getController() => _textController; //Function to get the text controller of this field;
  void setSendIcon () {showSendIcon = true;} //Function to show the send icon if set so;
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
            controller: _textController,
            onChanged: (text) {setState(() {});},
            expands: true,
            minLines: null,
            maxLines: null,
            cursorColor: Colors.grey,
            style: TextStyle(
              color: const Color(0x99ffffff),
              fontFamily: 'Karla',
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixIcon: Icon(widget.icon,
                  shadows: <Shadow>[
                    Shadow(color: Color(0x59ffffff), blurRadius: 45.0)
                  ],
                  color: Color(0xff51545C)),
              suffixIcon: showSendIcon ? IconButton(
                  icon: Icon(Icons.send, color: Color(0xffc97846)),
                  onPressed: () {
                    debugPrint('222');
                  }):null,
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
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
