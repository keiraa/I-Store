import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:istore/requisities/CatCard.dart';
import 'package:istore/requisities/CircleStore.dart';
import 'package:istore/requisities/PicContainer.dart';
import 'package:istore/requisities/TextStyles.dart';
import 'package:istore/screens/SearchPage.dart';


class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {

  String _searchedText;
  FocusNode focus = FocusNode();
  ScrollController scrollController = ScrollController();
  bool topView = true;


  bool haveSearched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focus.addListener((){
      onFocusChange();
    });
    scrollController.addListener(() {
      onScroll();
    });
  }

  void onFocusChange(){
    setState(() {
      topView = false;
    });
  }

  void onScroll(){
    if(scrollController.position.userScrollDirection == ScrollDirection.reverse)
    {
      setState(() {
        topView = false;
      });
    }
    else if(scrollController.position.userScrollDirection == ScrollDirection.forward)
    {
      if(scrollController.position.pixels == 0.0)
      {
        setState(() {
          topView = true;
        });
      }
    }
  }

  Future<bool> onWillPopScope(){
    if(!topView)
    {
      setState(() {
        topView = true;
      });
      focus.unfocus();
    }
    else if(haveSearched)
    {
      setState(() {
        haveSearched = false;
        _searchedText = '';
      });
    }
    else
    {
      Navigator.pop(context);
    }
    return Future.value(false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focus.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPopScope,
      child: haveSearched?

      Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: (){
              setState(() {
                haveSearched = false;
                _searchedText = '';
              });
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xfff7ba06),Color(0xffEDB20B),Color(0xffECB10A)],),
            ),
          ),
          title: Text(_searchedText,),
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
        body: SearchPage(searchedText: _searchedText,),
      )

          :Scaffold(
        resizeToAvoidBottomPadding: false,
        body: GestureDetector(
          onVerticalDragCancel: (){
            if(scrollController.position.pixels == 0.0)
            {
              setState(() {
                topView = true;
              });
            }
          },
          child: Stack(
            children: <Widget>[
              Visibility(
                visible: topView,
                child: Stack(
                  children: <Widget>[
                    PicContainer(h: 0.3,image: 'images/gradient.png',),
                    PicContainer(left: MediaQuery.of(context).size.width*0.7,h: 0.15,w: 0.3,image: 'images/UpperCurve.png',),
                    PicContainer(left: MediaQuery.of(context).size.width*0.7,h: 0.15,w: 0.3,image: 'images/UpperCurve.png',),
                    PicContainer(top: MediaQuery.of(context).size.height*0.1,h: 0.2,w: 0.4,image: 'images/LowerCurve.png',),
                    PicContainer(top: MediaQuery.of(context).size.height*0.1,h: 0.2,w: 0.4,image: 'images/LowerCurve.png',),
                  ],
                ),
              ),
              ListView(
                controller: scrollController,
                children: <Widget>[
                  Visibility(
                    visible: topView,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                        Center(
                          child: Text(
                            'Local Stores',
                            style: kHeaderStyle,
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                      ],
                    ),
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
                                focusNode:focus,
                                onChanged: (value){
                                  setState(() {
                                    _searchedText = value;
                                  });
                                },
                                onSubmitted: (value){
                                  focus.unfocus();
                                },
                                decoration: ksearchBarDecoration,
                                cursorColor: Color(0xffff9100),
                              )
                          ),
                          InkWell(
                            onTap: () async{
                              setState(() {
                                focus.unfocus();
                                if(_searchedText.isNotEmpty)
                                {
                                  haveSearched = true;
                                }
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CatCard(img: 'grocery.png',name: 'Grocery',),
                            CatCard(img: 'fashionIcon.png',name: 'Fashion',)
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CatCard(img: 'pharmaIcon.png',name: 'Pharma',),
                            CatCard(img: 'bakeryIcon.png',name: 'Bakery',)
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CatCard(img: 'foodIcon.png',name: 'Food',),
                            CatCard(img: 'electronicIcon.png',name: 'Electronics',)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
