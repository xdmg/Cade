import 'package:daily_coffee/Widgets/input.dart';
import 'package:daily_coffee/coffeeFetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeBody extends StatefulWidget {
  HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController searchController = TextEditingController();
  int navigator = 0, value = 0;
  String type = "All";

  void notifyParent() {
      setState(() {
        value = 0;
        type = searchController.text;
        print(type);
      });
  }

  Widget chip(String text, int val) => TextButton(
        onPressed: () {
          setState(() {
            searchController.text = "";
            value = val;
            type = text;
          });
        },
        child: value != val
            ? Column(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF51545B),
                    ),
                  ),
                  SizedBox(height: 7),
                  Icon(Icons.circle, color: Color(0x00C97845), size: 7),
                ],
              )
            : Column(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Karla',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      shadows: <Shadow>[
                        Shadow(color: Color(0xccC97845), blurRadius: 35.0)
                      ],
                      color: Color(0xFFC97845),
                    ),
                  ),
                  SizedBox(height: 7),
                  Icon(Icons.circle,
                      shadows: <Shadow>[
                        Shadow(color: Color(0xccC97845), blurRadius: 35.0)
                      ],
                      color: Color(0xFFC97845),
                      size: 6),
                ],
              ),
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Color(0x0dfffffe)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ))),
      );

  // Widget iconChip(IconData icon, int nav) => TextButton(
  //       onPressed: () {
  //         setState(() {
  //           navigator = nav;
  //         });
  //       },
  //       child: navigator != nav
  //           ? Icon(
  //               icon,
  //               color: Color(0xFF51545B),
  //             )
  //           : Icon(Icons.circle, color: Color(0x00C97845), size: 7),
  //       style: ButtonStyle(
  //           overlayColor: MaterialStateProperty.all(Color(0x0dfffffe)),
  //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //               RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(14),
  //           ))),
  //     );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(width);
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: const Color(0xffc97846),
        child: Center(
          child: SizedBox(
            width: width*0.86,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0,0,0,height*0.025),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(
                    height: height * 0.005,
                  ),
                  CustomTextField(
                      sync: false,
                      radius: 10,
                      text: "Search for various flavours..",
                      icon: Icons.search,
                      childController: searchController,
                      notifyParent: notifyParent,
                      onClick: () {},
                      parentController: null),
                  SizedBox(height: height * 0.025),
                  Container(
                    height: height * 0.070,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              chip("All", 0),
                              SizedBox(
                                width: 10,
                              ),
                              chip("Espresso", 1),
                              SizedBox(
                                width: 25,
                              ),
                              chip("Cappuccino", 2),
                              SizedBox(
                                width: 25,
                              ),
                              chip("Latte", 3),
                              SizedBox(
                                width: 25,
                              ),
                              chip("Flat Coffee", 4),
                              SizedBox(
                                width: 25,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 5),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Coffees(
                    keyword: type,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
