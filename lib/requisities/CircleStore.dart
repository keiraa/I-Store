import 'package:flutter/material.dart';
import 'package:istore/requisities/TextStyles.dart';

class CircleStore extends StatelessWidget {
  CircleStore({this.icon,this.name});
  final String icon,name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Image(
              image: AssetImage('images/$icon'),
            ),
            radius: 35,
          ),
          Text(
            name,
            style: kiconText,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}