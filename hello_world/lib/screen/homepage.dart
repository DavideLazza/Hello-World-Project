import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

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
          padding: EdgeInsets.only(left: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.account_circle_outlined))
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
  } //build
} //HomePage