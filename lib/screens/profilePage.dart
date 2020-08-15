import 'package:flutter/material.dart';
import 'package:istore/requisities/PicContainer.dart';
import 'package:istore/requisities/TextStyles.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                  Center(
                    child: Text(
                      'User Profile',
                      style: kHeaderStyle,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
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
                      InkWell(
                        onTap: () async{
                          setState(() {
                          });
                        },
                        child: Tab(
                          icon: Image(
                            image: AssetImage('images/searchIcon.png'),
                            height: 30,
                            width: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.25),
                child: Center(
                  child: Text(
                    'Coming Soon :)',
                    style: kMainHeaderStyle.copyWith(
                        color: Color(0xffc9c9c9),
                        fontSize: 30
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
