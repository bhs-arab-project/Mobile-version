import 'package:bahasa_arab/user/ui/learning/learning.dart';
import 'package:bahasa_arab/user/ui/user.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(fontFamily: 'Kanit'),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final List<Widget> _children = [Learning(), HomeUser()];

  void onTabTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: _children[_currentPage],
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.blue[400],
            selectedItemBackgroundColor: Colors.blue[400],
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
            barHeight: 70),
        selectedIndex: _currentPage,
        onSelectTab: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.border_color,
            label: 'Belajar',
          ),
          FFNavigationBarItem(
            iconData: Icons.account_circle,
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
