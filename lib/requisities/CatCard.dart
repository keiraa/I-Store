import 'package:flutter/material.dart';
import 'package:istore/requisities/TextStyles.dart';



class CatCard extends StatelessWidget {
  CatCard({this.name,this.img});
  final String img,name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Color(0xfff3e5f5),
            child: Image(
              image: AssetImage('images/$img'),
            ),
          ),
          SizedBox(width: 20,),
          Text(
            name,
            style: kCatText,
          ),
        ],
      ),
    );
  }
}