
import 'package:daily_coffee/Widgets/input.dart';
import 'package:daily_coffee/coffeeFetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Services/auth.dart';
import 'Widgets/iconButton.dart';
import 'Widgets/primaryButton.dart';

class HomeBody extends StatefulWidget {
  HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController searchController = TextEditingController();
  AuthService _auth = AuthService();
  int navigator = 0, value = 0;
  String type = "All";


  Widget chip(String text, int val) => TextButton(
        onPressed: () {
          setState(() {
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
                        Shadow(color: Color(0x66C97845), blurRadius: 35.0)
                      ],
                      color: Color(0xFFC97845),
                    ),
                  ),
                  SizedBox(height: 7),
                  Icon(Icons.circle,
                      shadows: <Shadow>[
                        Shadow(color: Color(0x66C97845), blurRadius: 35.0)
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
    return Padding(
      padding: EdgeInsets.fromLTRB(29.0, height*0.06, 29, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                  icon: Icons.menu, radius: 10.0, size: 44, resFunction: () {}),
              Row(
                children: [
                  PrimaryCustomButton(
                      text: "\$ 5.62", radius: 7, resFunction: () {}),
                  SizedBox(
                    width: width*0.05,
                  ),
                  Container(
                    width: width*0.1,
                    height: width*0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                        colors: [Color(0x9951545C), Color(0x0051545C)],
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
                        size: 40,
                        Icons.account_circle,
                        color: Color(0x99000000),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: height*0.025,
          ),
          CustomTextField(
              radius: 10,
              text: "Search for various flavours..",
              icon: Icons.search,
              childController: searchController,
              notifyParent: () {},
              onClick: () {},
              parentController: null),
          SizedBox(height: height*0.025),
          Container(
            height: height*0.070,
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
          SizedBox(height: MediaQuery.of(context).size.height*0.65,child: Coffees(keyword: type,)),
        ],
      ),
    );
  }
}
