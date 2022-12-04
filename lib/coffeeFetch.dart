import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:daily_coffee/Widgets/coffeeBlock.dart';
import 'package:provider/provider.dart';
import 'coffee.dart';

class Coffees extends StatefulWidget {
  final String keyword;

  const Coffees({Key? key, required this.keyword}) : super(key: key);

  @override
  State<Coffees> createState() => _CoffeesState();
}

class _CoffeesState extends State<Coffees> {
  List<Widget> coffeeLister(List<Coffee> coffees) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<Widget> finalList = [];
    for (Coffee coffee in coffees) {
      if (widget.keyword == "All" ||
          (coffee.name.toLowerCase().contains(widget.keyword.toLowerCase()) ||
              coffee.desc.toLowerCase().contains(widget.keyword.toLowerCase())))
        finalList.add(CoffeeBlock(
          name: coffee.name,
          desc: coffee.desc,
          price: coffee.price,
          img: coffee.img,
        ));
    }
    if (finalList.isEmpty)
      finalList.add(SizedBox(
          height: height * 0.57,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: width * 0.2,
                shadows: <Shadow>[
                  Shadow(color: Color(0xccC97845), blurRadius: width*0.3)
                ],
                color: Color(0xFFC97845),
              ),
              SizedBox(height: height*0.02,),
              Text(
                  style: TextStyle(fontSize: 18, fontFamily: 'Karla'),
                  "Sorry but nothing was found..."),
            ],
          ))));
    finalList.add(SizedBox(
      height: height * 0.08,
      width: width * 0.40,
    ));
    finalList.add(SizedBox(
      height: height * 0.08,
      width: width * 0.40,
    ));
    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    final coffees = Provider.of<List<Coffee>?>(context);
    // for (var doc in coffees)
    //   print(doc.data());
    var size = MediaQuery.of(context).size;

    return Wrap(
      spacing: MediaQuery.of(context).size.width * 0.04,
      runSpacing: MediaQuery.of(context).size.height * 0.03,
      alignment: WrapAlignment.center,
      children: coffees != null ? coffeeLister(coffees) : [],
    );
  }
}
