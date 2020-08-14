import 'package:flutter/material.dart';
import 'package:istore/screens/Featured.dart';
import 'package:istore/screens/GlobalStores.dart';
import 'package:istore/screens/LoginPage.dart';
import 'package:istore/screens/NavigationPage.dart';
import 'package:istore/screens/RegisterPage.dart';
import 'package:istore/screens/SearchPage.dart';
import 'package:istore/screens/StorePage.dart';
import 'package:istore/screens/ZIPScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: NavigationPage(),
    );
  }
}

