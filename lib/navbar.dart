import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:another_flushbar/flushbar.dart';

// class NavBar extends StatefulWidget {
//   int navigator;
//   final Function(int val) changeNav;
//   final BuildContext context;
//   NavBar({Key? key, required this.changeNav, required this.navigator, required this.context}) : super(key: key);
//
//   @override
//   State<NavBar> createState() => _NavBarState();
// }
//
// class _NavBarState extends State<NavBar> {
//   @override
//   Widget build(BuildContext context) {
//     print("ran");
//     return Flushbar(
//       barBlur: 5,
//       flushbarStyle: FlushbarStyle.FLOATING,
//       backgroundColor: Color(0x99000000),
//       margin: EdgeInsets.all(8),
//       borderRadius: BorderRadius.circular(8),
//       messageText: Container(
//         height: 35,
//         child: Container(
//           height: 26,
//           width: MediaQuery.of(widget.context).size.width,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   if (widget.navigator != 0){
//                     setState(() {
//                       widget.changeNav(0);
//                       widget.navigator = 0;
//                     });
//                   }
//                 },
//                 icon: widget.navigator == 0 ? Icon(
//                   size: 25,
//                   Icons.home,
//                   color: Color(0xffC97846),
//                   shadows: <Shadow>[
//                     Shadow(color: Color(0xffC97845), blurRadius: 55.0)
//                   ],
//                 ) : Icon(
//                   size: 25,
//                   Icons.home_outlined,
//                   color: Color(0xff51545C),
//                 ),
//               ),
//               SizedBox(width: 25),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     widget.changeNav(0);
//                     widget.navigator = 0;
//                   });
//                   if (widget.navigator != 1){
//                     widget.changeNav(1);
//                   }
//                 },
//                 icon: widget.navigator == 1 ? Icon(
//                   size: 25,
//                   Icons.shopping_cart,
//                   color: Color(0xffC97846),
//                   shadows: <Shadow>[
//                     Shadow(color: Color(0xffC97845), blurRadius: 55.0)
//                   ],
//                 ) : Icon(
//                   size: 25,
//                   Icons.shopping_cart_outlined,
//                   color: Color(0xff51545C),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     )..show(widget.context);
//   }
// }

class NavBar {
  final int current;
  // final Function(int val) changeNav;
  final BuildContext passedContext;

  NavBar(this.passedContext, this.current,);

  Flushbar<bool> showNavBar() {
    return Flushbar(
      barBlur: 5,
      flushbarStyle: FlushbarStyle.FLOATING,
      backgroundColor: Color(0x99000000),
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      messageText: Container(
        height: 35,
        child: Container(
          height: 26,
          width: MediaQuery.of(passedContext).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  print("pressed");
                  // if (current != 0) changeNav(0);
                },
                icon: current == 0
                    ? Icon(
                        size: 25,
                        Icons.home,
                        color: Color(0xffC97846),
                        shadows: <Shadow>[
                          Shadow(color: Color(0xffC97845), blurRadius: 55.0)
                        ],
                      )
                    : Icon(
                        size: 25,
                        Icons.home_outlined,
                        color: Color(0xff51545C),
                      ),
              ),
              SizedBox(width: 25),
              IconButton(
                onPressed: () {
                  // if (current != 1) changeNav(1);
                },
                icon: current == 1
                    ? Icon(
                        size: 25,
                        Icons.shopping_cart,
                        color: Color(0xffC97846),
                        shadows: <Shadow>[
                          Shadow(color: Color(0xffC97845), blurRadius: 55.0)
                        ],
                      )
                    : Icon(
                        size: 25,
                        Icons.shopping_cart_outlined,
                        color: Color(0xff51545C),
                      ),
              ),
            ],
          ),
        ),
      ),
    )..show(passedContext);
  }
}
