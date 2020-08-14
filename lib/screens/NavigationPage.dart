import 'package:flutter/material.dart';
import 'package:istore/requisities/TextStyles.dart';
import 'package:istore/screens/Featured.dart';
import 'package:istore/screens/GlobalStores.dart';
import 'package:istore/screens/StorePage.dart';


class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  int _currentIndex = 0;
  List<Widget> _screens = [Featured(),StorePage(),StorePage(),GlobalStores(),StorePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        items: kNavBarList,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
