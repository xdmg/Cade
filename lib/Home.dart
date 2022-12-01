import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'HomeBody.dart';
import 'package:another_flushbar/flushbar.dart';
import 'navbar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navigator = 0;

  bool _checkConfiguration() => true;

  // late Flushbar navbar;

  @override
  void initState() {
    super.initState();
    if (_checkConfiguration())
      Future.delayed(Duration.zero, () {
        // NavBar(navigator: navigator,changeNav: changeNav,context: context);
        // navbar = Flushbar(
        //   barBlur: 5,
        //   flushbarStyle: FlushbarStyle.FLOATING,
        //   backgroundColor: Color(0x99000000),
        //   margin: EdgeInsets.all(8),
        //   borderRadius: BorderRadius.circular(8),
        //   messageText: Container(
        //     height: 35,
        //     child: Container(
        //       height: 26,
        //       width: MediaQuery.of(context).size.width,
        //       child: Row(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           IconButton(
        //             onPressed: () {
        //               setState(() {
        //                 print("setting");
        //                 navigator = 0;
        //               });
        //               if (navigator != 0){
        //                 changeNav(0);
        //               }
        //             },
        //             icon: navigator == 0 ? Icon(
        //               size: 25,
        //               Icons.home,
        //               color: Color(0xffC97846),
        //               shadows: <Shadow>[
        //                 Shadow(color: Color(0xffC97845), blurRadius: 55.0)
        //               ],
        //             ) : Icon(
        //               size: 25,
        //               Icons.home_outlined,
        //               color: Color(0xff51545C),
        //             ),
        //           ),
        //           SizedBox(width: 25),
        //           IconButton(
        //             onPressed: () {
        //               setState(() {
        //                 print("setting");
        //                 navigator = 1;
        //               });
        //               if (navigator != 1){
        //                 changeNav(1);
        //               }
        //             },
        //             icon: navigator == 1 ? Icon(
        //               size: 25,
        //               Icons.shopping_cart,
        //               color: Color(0xffC97846),
        //               shadows: <Shadow>[
        //                 Shadow(color: Color(0xffC97845), blurRadius: 55.0)
        //               ],
        //             ) : Icon(
        //               size: 25,
        //               Icons.shopping_cart_outlined,
        //               color: Color(0xff51545C),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // );
        // navbar..show(context);
      });
  }

  void changeNav(int val) {
    print("parent change nav");
    setState(() {
      navigator == 1;
      // navbar..show(context);
    });
  }

  int current = 0;

  @override
  Widget build(BuildContext context) {
    context.loaderOverlay.hide();
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Flushbar(
          barBlur: 5,
          // flushbarStyle: FlushbarStyle.FLOATING,
          backgroundColor: Color(0x99000000),
          // margin: EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(20),
          messageText: Container(
            height: 35,
            child: Container(
              height: 26,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // print("pressed");
                      if (current != 0)
                        setState(() {
                          current = 0;
                        });
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
                      if (current != 1)
                        setState(() {
                          current = 1;
                        });
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
        ),
      ),
      body: current == 0
          ? HomeBody(changeNav: changeNav, current: navigator)
          : Container(),
    );
  }
}
