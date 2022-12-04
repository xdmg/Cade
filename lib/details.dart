import 'dart:ui';
import 'package:daily_coffee/Widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Details extends StatefulWidget {
  final String img;
  final String name;
  final String desc;
  final String price;

  Details({Key? key, required this.img, required this.name, required this.desc, required this.price})
      : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width,
            height: height * 0.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.img)),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  height: height * 0.2,
                  width: width,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 25.0,
                        sigmaY: 25.0,
                      ),
                      child: Container(
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(15),
                          // ),
                          // width: MediaQuery.of(context).size.width * 0.90,
                          ),
                    ),
                  ),
                ),
                Positioned(
                  height: height * 0.2,
                  width: width,
                  bottom: 0,
                  child: Container(
                    height: height * 0.2,
                    decoration: BoxDecoration(
                      backgroundBlendMode: BlendMode.lighten,
                      color: Color(0x99000000),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  child: Text(widget.name,
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'DMSans',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 23,
                                      )),
                                ),
                              ),
                              // SizedBox(
                              //   height: 2,
                              // ),
                              SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                                  child: Text("With ${widget.desc}",
                                      overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: TextStyle(
                                        fontFamily: 'Karla',
                                        fontSize: 17,
                                        color: Color(0xffA5A4A4),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    size: 21,
                                    color: Color(0xffD17842),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontFamily: 'Karla',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "(6,414)",
                                    style: TextStyle(
                                      fontFamily: 'Karla',
                                      fontSize: 15,
                                      color: Color(0xccA5A4A4),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width * 0.35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Color(0xff101419),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(17)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.energy_savings_leaf,
                                            size: 26,
                                            color: Color(0xffD17842),
                                          ),
                                          Text("Coffee",
                                              style: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 13,
                                                  color: Color(0xff7A7B7D))),
                                        ],
                                      )),
                                  SizedBox(width: 10),
                                  Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Color(0xff101419),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(17)),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.water_drop,
                                            size: 26,
                                            color: Color(0xffD17842),
                                          ),
                                          Text("Milk",
                                              style: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  fontSize: 13,
                                                  color: Color(0xff7A7B7D))),
                                        ],
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 130,
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xff101419),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text("Lightly Roasted",
                                    style: TextStyle(
                                        fontFamily: 'DMSans',
                                        fontSize: 13,
                                        color: Color(0xff7A7B7D))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.075, vertical: height * 0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: Color(0xff7A7B7D)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        "A cappuccino is the perfect balance of coffee, steamed milk and foam. This coffee is all about the structure and the even splitting of all elements into equal thirds. An expertly made cappuccino should be rich, but not acidic and have a mildly sweet flavouring from the milk.",
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Size",
                        style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 16,
                            color: Color(0xff7A7B7D)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: width * 0.25,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xff0C0F14),
                                border: Border.all(
                                  color: Color(0xffD17842),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Text(
                                "S",
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0xffD17842)),
                              )),
                          SizedBox(width: width * 0.04),
                          Container(
                              width: width * 0.25,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xff141921),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Text(
                                "M",
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 16,
                                    color: Color(0xccffffff)),
                              )),
                          SizedBox(width: width * 0.04),
                          Container(
                              width: width * 0.25,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xff141921),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Text(
                                "L",
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    fontSize: 16,
                                    color: Color(0xccffffff)),
                              )),
                        ],
                      ),

                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Price",
                            style: TextStyle(
                                fontFamily: 'DMSans',
                                fontSize: 15,
                                color: Color(0xFF7A7B7C)),
                          ),
                          Row(
                            children: [
                              Text("\$",
                                  style: TextStyle(
                                    fontFamily: 'Karla',
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFC97845),
                                  )),
                              Text(" ${widget.price}",
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                    fontFamily: 'Karla',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 21,
                                    color: Color(0xfffffffe),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      PrimaryCustomButton(text: 'Buy Now', radius: 15,width: width*0.6,height: 50, resFunction: () {},)
                    ],
                  ),                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
