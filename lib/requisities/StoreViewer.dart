import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:istore/requisities/TextStyles.dart';

class StoreViewer extends StatelessWidget {
  StoreViewer({this.storeLink,this.storeName,this.storeType});
  final String storeName,storeType,storeLink;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.06),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.14,
                  width: MediaQuery.of(context).size.width*0.4,
                  color: Color(0xffeeeeee),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.13,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(storeName,style: kStoreName,),
                      Text(storeType,style: kStoreType,),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width*0.19,
                            height: MediaQuery.of(context).size.height*0.03,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(colors:[Color(0xffff9100),Color(0xffffd500)]),
                            ),
                            child: Center(
                              child: Text(
                                'Visit',
                                style: kVisit,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.19,
                            height: MediaQuery.of(context).size.height*0.03,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.grey)]
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Divider(
            color: Color(0xffcacaca),
            height: 5,
          ),
        )
      ],
    );
  }
}






