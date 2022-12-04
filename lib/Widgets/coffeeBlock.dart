import 'package:daily_coffee/Widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Home.dart';
import '../details.dart';

class CoffeeBlock extends StatelessWidget {
  final String name;
  final String img;
  final String price;
  final String desc;

  const CoffeeBlock({Key? key, required this.name, required this.img, required this.price, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double parentWidth = MediaQuery.of(context).size.width * 0.40;
    return Container(
      height: 254,
      width: parentWidth,
      child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              width: parentWidth,
              height: 254,
              bottom: 1.1,
              right: 1.1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Color(0x9951545C), Color(0x0051545C)],
                    begin: Alignment(-1, -1),
                    end: Alignment(0.4, 0.4),
                    transform: GradientRotation(-0.5),
                  ),
                ),
              ),
            ),
            Container(
              width: parentWidth,
              height: 254,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [Color(0xff1f252e), Color(0xff0c1015)],
                  begin: Alignment(-1, -1),
                  end: Alignment(0.5, 0.7),
                  transform: GradientRotation(-0.5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                child: Column(
                  children: [
                    Container(
                      width: parentWidth * 0.85,
                      height: parentWidth * 0.85,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                img)),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    SizedBox(
                      width: parentWidth * 0.80,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Text(name,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 17,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    SizedBox(
                      width: parentWidth * 0.80,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                        child: Text("With ${desc}",
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              fontSize: 12,
                              color: Color(0xff51545C),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: parentWidth * 0.80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("\$",
                              style: TextStyle(
                                fontFamily: 'Karla',
                                fontSize: 17,
                                color: Color(0xffC97846),
                              )),
                          Text(" ${price}",
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              softWrap: false,
                              style: TextStyle(
                                fontFamily: 'Karla',
                                fontSize: 17,
                                color: Color(0xffffffff),
                              )),
                          Spacer(),
                          PrimaryCustomButton(
                              text: "", radius: 7, resFunction: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Details(img: img,name: name,desc: desc,price: price)));
                          },height: 30,width: 30,icon: Icons.remove_red_eye,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
