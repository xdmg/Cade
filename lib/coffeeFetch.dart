import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:daily_coffee/Widgets/coffeeBlock.dart';
import 'package:provider/provider.dart';
import 'Widgets/coffeeBlock.dart';
import 'coffee.dart';

class Coffees extends StatefulWidget {
  final String keyword;

  const Coffees({Key? key, required this.keyword}) : super(key: key);

  @override
  State<Coffees> createState() => _CoffeesState();
}

class _CoffeesState extends State<Coffees> {
  List<Widget> coffeeLister(List<Coffee> coffees) {
    List<Widget> finalList = [];
    for (Coffee coffee in coffees) {
      finalList.add(CoffeeBlock(
        name: coffee.name,
        desc: coffee.desc,
        price: coffee.price,
        img: coffee.img,
      ));
    }
    finalList.add(SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.40,
    ));
    finalList.add(SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width * 0.40,
    ));
    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    final coffees = Provider.of<List<Coffee>?>(context);
    // for (var doc in coffees)
    //   print(doc.data());
    var size = MediaQuery.of(context).size;

    return ShaderMask(
      shaderCallback: (Rect rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Colors.transparent,
            Colors.transparent,
            Colors.black
          ],
          stops: [
            0.0,
            0.05,
            0.95,
            1.0
          ], // 10% purple, 80% transparent, 10% purple
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: ListView(
          padding: EdgeInsets.fromLTRB(0, size.height*0.0225, 0, 0),
          // shrinkWrap: true,
          // physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            Wrap(
              spacing: MediaQuery.of(context).size.width * 0.04,
              runSpacing: MediaQuery.of(context).size.height * 0.038,
              alignment: WrapAlignment.center,
              children: coffees != null ? coffeeLister(coffees) : [],
              // [
              //   ,
              //   CoffeeBlock(),
              //   CoffeeBlock(),
              //   CoffeeBlock(),
              //   CoffeeBlock(),
              //   CoffeeBlock(),
              //   CoffeeBlock(),
              //   SizedBox(height: 50,),
              //   SizedBox(height: 50,),
              // ]
            ),
          ]),
    );
  }
}
