import 'package:flutter/material.dart';
import 'package:istore/requisities/StoreViewer.dart';

class SearchPage extends StatefulWidget {
  SearchPage({this.searchedText});
  String searchedText;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height*0.07,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 10,
                    ),
                  ),
                ),
                SizedBox(width: 1,),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 10,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                StoreViewer(storeName: 'Dominos',storeType: 'Food',image: 'images/Dominos.png',distance: '15km',),
                StoreViewer(storeName: 'Burger King',storeType: 'Food',image: 'images/BurgerKing.png',distance: '25km'),
                StoreViewer(storeName: 'The Body Shop',storeType: 'Pharma',image: 'images/body_shop.png',distance: '10km'),
                StoreViewer(storeName: 'Shop',storeType: 'Fashion',image: 'images/shop_logo.png',distance: '2km'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
