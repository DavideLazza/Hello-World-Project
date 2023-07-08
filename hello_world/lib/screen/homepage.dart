import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:hello_world/repository/databaseRepository.dart';
import 'package:hello_world/screen/impactpage.dart';
import 'package:hello_world/screen/profilepage.dart';
import 'package:hello_world/screen/welcomepage.dart';
import 'package:provider/provider.dart';

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
            padding: const EdgeInsets.all(15),
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
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ImpactPage()));
              },
              icon: Icon(Icons.analytics_outlined)),
          IconButton(
              padding: const EdgeInsets.all(15),
              onPressed: () {
                _toProfilePage(context);
              },
              icon: const Icon(Icons.account_circle_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Welcome $presname,',
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'this is a recap of your week\'s activities',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 80,
            ),

            // FUTURE BUILDER DAI CHE 'NDEMO
            Consumer<DatabaseRepository>(builder: (context, dbr, child) {
              return FutureBuilder(
                  future: dbr.getExercisesCount(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data as int;
                      return Text('N° of exercises done: $data');
                    } else {
                      return CircularProgressIndicator();
                    }
                  });
            }),
            Consumer<DatabaseRepository>(builder: (context, dbr, child) {
              return FutureBuilder(
                  future: dbr.getTotalKm(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data as double;
                      return Text('Km covered: $data');
                    } else {
                      return CircularProgressIndicator();
                    }
                  });
            }),
            Consumer<DatabaseRepository>(builder: (context, dbr, child) {
              return FutureBuilder(
                  future: dbr.getTotalCalories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data as int;
                      return Text('Calories burnt: $data');
                    } else {
                      return CircularProgressIndicator();
                    }
                  });
            }),
            Consumer<DatabaseRepository>(builder: (context, dbr, child) {
              return FutureBuilder(
                  future: dbr.getTotalCalories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data as int;
                      return Text(
                          'Calories burnt per day: ${(data / 7).round()}');
                    } else {
                      return CircularProgressIndicator();
                    }
                  });
            }),
          ],
        ),
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
