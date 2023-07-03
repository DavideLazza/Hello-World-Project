import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routename = 'Homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsIconTheme: const IconThemeData(color: Colors.black87),
        iconTheme: const IconThemeData(color: Colors.black87),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
          padding: const EdgeInsets.only(left: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _toLoginPage(context);
              },
              icon: const Icon(Icons.account_circle_outlined))
        ],
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Discover',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey.shade500.withOpacity(0.5),
          selectedItemColor: Colors.black87,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Cerca"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "Preferiti"),
            BottomNavigationBarItem(
                icon: Icon(Icons.flight_takeoff_rounded), label: "Viaggi")
          ]),
    );
  }

  void _toLoginPage(BuildContext context) async {
    final sp = await SharedPreferences.getInstance();
    sp.remove('username');

    //Pop the drawer first
    Navigator.pop(context);
    //Then pop the HomePage
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  } //_toCalendarPage
  //build
} //HomePage
