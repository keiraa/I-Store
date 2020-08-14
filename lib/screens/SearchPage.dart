import 'package:flutter/material.dart';
import 'package:istore/requisities/StoreViewer.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 20,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xfff7ba06),Color(0xffEDB20B),Color(0xffECB10A)],),
          ),
        ),
        title: Text('Krishna Nagar',),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Tab(
              icon: Image(
                image: AssetImage('images/searchWhite.png'),
                height: 28,
                width: 28,
              ),
            ),
          ),
        ],
      ),
      body: Container(
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
                  StoreViewer(storeName: 'Shop Name',storeType: 'Fashion',),
                  StoreViewer(storeName: 'Shop Name',storeType: 'Fashion',),
                  StoreViewer(storeName: 'Shop Name',storeType: 'Fashion',),
                  StoreViewer(storeName: 'Shop Name',storeType: 'Fashion',),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
