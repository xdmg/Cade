import 'dart:ui';
import 'package:daily_coffee/coffee.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'HomeBody.dart';
import 'database.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:provider/provider.dart';
import 'navbar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navigator = 0;
  int current = 0;

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    context.loaderOverlay.hide();
    return StreamProvider<List<Coffee>?>.value(
        initialData: null,
        value: DatabaseService().coffees,
        child: Scaffold(
          // extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [new BoxShadow(
                color: Colors.black,
                blurRadius: 35.0,
              ),]
            ),
            child: Stack(
              children: [
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 9.0,
                      sigmaY: 9.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.85,
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xcc000000),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Color(0x1affffff)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () {
                          // print("pressed");
                          if (current != 0)
                            setState(() {
                              current = 0;
                            });
                        },
                        child: current == 0
                            ? Icon(
                                size: 25,
                                Icons.home,
                                color: Color(0xffC97846),
                                shadows: <Shadow>[
                                  Shadow(
                                      color: Color(0xffC97845),
                                      blurRadius: 55.0)
                                ],
                              )
                            : Icon(
                                size: 25,
                                Icons.home_outlined,
                                color: Color(0xff51545C),
                              ),
                      ),
                      SizedBox(width: 30),
                      TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Color(0x1affffff)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () {
                          if (current != 1)
                            setState(() {
                              current = 1;
                            });
                        },
                        child: current == 1
                            ? Icon(
                                size: 25,
                                Icons.shopping_cart,
                                color: Color(0xffC97846),
                                shadows: <Shadow>[
                                  Shadow(
                                      color: Color(0xffC97845),
                                      blurRadius: 55.0)
                                ],
                              )
                            : Icon(
                                size: 25,
                                Icons.shopping_cart_outlined,
                                color: Color(0xff51545C),
                              ),
                      ),
                      SizedBox(width: 30),
                      TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Color(0x1affffff)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () {
                          if (current != 2)
                            setState(() {
                              current = 2;
                            });
                        },
                        child: current == 2
                            ? Icon(
                                size: 25,
                                Icons.coffee,
                                color: Color(0xffC97846),
                                shadows: <Shadow>[
                                  Shadow(
                                      color: Color(0xffC97845),
                                      blurRadius: 55.0)
                                ],
                              )
                            : Icon(
                                size: 25,
                                Icons.coffee_outlined,
                                color: Color(0xff51545C),
                              ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: current == 0 ? HomeBody() : Container(),
        ));
  }
}
