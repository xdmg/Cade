import 'dart:ui';
import 'package:daily_coffee/coffee.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'HomeBody.dart';
import 'Services/auth.dart';
import 'Widgets/iconButton.dart';
import 'Widgets/primaryButton.dart';
import 'database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navigator = 0;
  int current = 0;
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom != 0.0;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    context.loaderOverlay.hide();
    return StreamProvider<List<Coffee>?>.value(
        initialData: null,
        value: DatabaseService().coffees,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Visibility(
            visible: !showFab,
            child: Container(
              width: width * 0.90,
              height: height*0.075,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    new BoxShadow(
                      color: Color(0xd9000000),
                      blurRadius: 35.0,
                    ),
                  ]),
              child: Stack(
                children: [
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2.0,
                        sigmaY: 2.0,
                      ),
                      child: Container(
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(15),
                          // ),
                          // height: 60,
                          // width: MediaQuery.of(context).size.width * 0.90,
                          ),
                    ),
                  ),
                  Container(
                    height: height*0.075,
                    decoration: BoxDecoration(
                      color: Color(0xd9000000),
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
          ),
          body: current == 0 ? HomeBody() : Container(),
          appBar: AppBar(
            toolbarHeight: height * 0.09,
            elevation: 0.0,
            backgroundColor: const Color(0xff0c1015),
            flexibleSpace: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: width * 0.86,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIconButton(
                            icon: Icons.menu,
                            radius: 10.0,
                            size: height * 0.055,
                            resFunction: () {}),
                        Row(
                          children: [
                            PrimaryCustomButton(
                                width: width * 0.155,
                                height: height * 0.036,
                                text: "\$ 5.62",
                                radius: 7,
                                resFunction: () {}),
                            SizedBox(
                              width: width * 0.05,
                            ),
                            Container(
                              width: width * 0.1,
                              height: width * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0x9951545C),
                                    Color(0x0051545C)
                                  ],
                                  begin: Alignment(-1, -1),
                                  end: Alignment(0.5, 1.0),
                                  transform: GradientRotation(0.1),
                                ),
                              ),
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                shape: const CircleBorder(),
                                minWidth: 0,
                                onPressed: () {
                                  _auth.signOut();
                                },
                                child: Icon(
                                  size: height * 0.046,
                                  Icons.account_circle,
                                  color: Color(0x99000000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
