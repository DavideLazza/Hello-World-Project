import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/screen/profilepage.dart';
import 'package:hello_world/screen/welcomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginpage.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
    required this.presname,
    required this.name1,
    required this.surname1,
    required this.height1,
    required this.weight1,
    required this.age1,
    required this.gender1,
  }) : super(key: key);

  String presname = "",
      name1 = "",
      surname1 = "",
      height1 = "",
      weight1 = "",
      age1 = "",
      gender1 = "";

  static const routename = 'Homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            padding: EdgeInsets.all(15),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const WelcomePage()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blueGrey,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsIconTheme: const IconThemeData(color: Colors.blueGrey, size: 30),
        iconTheme: const IconThemeData(color: Colors.blueGrey, size: 30),
        centerTitle: true,
        actions: [
          IconButton(
              padding: const EdgeInsets.all(15),
              onPressed: () {
                _toProfilePage(context);
              },
              icon: const Icon(Icons.account_circle_outlined))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Welcome $presname',
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 30,
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

  void _toProfilePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProfilePage(
              name: name1,
              surname: surname1,
              height: height1,
              weight: weight1,
              age: age1,
              gender: gender1,
            )));
  }
  //build
} //HomePage
