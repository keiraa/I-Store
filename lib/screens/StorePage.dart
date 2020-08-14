import 'package:flutter/material.dart';
import 'package:istore/requisities/CatCard.dart';
import 'package:istore/requisities/CircleStore.dart';
import 'package:istore/requisities/PicContainer.dart';
import 'package:istore/requisities/TextStyles.dart';


class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

  String _searchedText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          PicContainer(h: 0.3,image: 'images/gradient.png',),
          PicContainer(left: MediaQuery.of(context).size.width*0.7,h: 0.15,w: 0.3,image: 'images/UpperCurve.png',),
          PicContainer(left: MediaQuery.of(context).size.width*0.7,h: 0.15,w: 0.3,image: 'images/UpperCurve.png',),
          PicContainer(top: MediaQuery.of(context).size.height*0.1,h: 0.2,w: 0.4,image: 'images/LowerCurve.png',),
          PicContainer(top: MediaQuery.of(context).size.height*0.1,h: 0.2,w: 0.4,image: 'images/LowerCurve.png',),
          ListView(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height*0.07,),
              Center(
                child: Text(
                  'Local Stores',
                  style: kHeaderStyle,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.07,),
              Card(
                color: Colors.white,
                elevation: 30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                          child: TextField(
                            onChanged: (value){
                              setState(() {
                                _searchedText = value;
                              });
                            },
                            decoration: ksearchBarDecoration,
                            cursorColor: Color(0xffff9100),
                          )
                      ),
                      Tab(
                        icon: Image(
                          image: AssetImage('images/searchIcon.png'),
                          height: 30,
                          width: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Favorites',
                      style: kFavTitle,
                    ),
                    Text(
                      'Nearby',
                      style: ksideBar,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      CircleStore(icon: 'BurgerKing.png',name: 'Burger\nKing',),
                      CircleStore(icon: 'Dominos.png',name: 'Dominos\nPizza',),
                      CircleStore(icon: 'shop_logo.png',name: 'Shop\nLogo',),
                      CircleStore(icon: 'body_shop.png',name: 'Burger\nKing',),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Categories',
                      style: kFavTitle,
                    ),
                    Text(
                      'All',
                      style: ksideBar,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CatCard(img: 'grocery.png',name: 'Grocery',),
                      SizedBox(width: 30,),
                      CatCard(img: 'fashionIcon.png',name: 'Fashion',)
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      CatCard(img: 'pharmaIcon.png',name: 'Pharma',),
                      SizedBox(width: 30,),
                      CatCard(img: 'bakeryIcon.png',name: 'Bakery',)
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
