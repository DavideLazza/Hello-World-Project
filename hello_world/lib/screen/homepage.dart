import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:hello_world/repository/databaseRepository.dart';
import 'package:hello_world/screen/impactpage.dart';
import 'package:hello_world/screen/profilepage.dart';
import 'package:hello_world/screen/welcomepage.dart';
import 'package:hello_world/screen/workoutpage.dart';
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
            icon: Icon(Icons.analytics_outlined),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ImpactPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.video_library_outlined),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => WorkoutPage()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            padding: const EdgeInsets.all(15),
            onPressed: () {
              _toProfilePage(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              height: 50,
            ),

            // FUTURE BUILDER DAI CHE 'NDEMO
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<DatabaseRepository>(builder: (context, dbr, child) {
                  return FutureBuilder(
                      future: dbr.getExercisesCount(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final data = snapshot.data as int;
                          if (data != 0) {
                            return Card(
                              color: Colors.blueGrey,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: SizedBox(
                                height: 150,
                                width: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('N° of exercises done',
                                          style: TextStyle(fontSize: 15)),
                                      Text(
                                        '$data',
                                        style: TextStyle(fontSize: 40),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
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
                          return Card(
                            color: Colors.blueGrey.shade300,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Km covered',
                                        style: TextStyle(fontSize: 15)),
                                    Text(
                                      '${double.parse(data.toStringAsFixed(2))}', //data
                                      style: TextStyle(fontSize: 40),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      });
                }),
              ],
            ),
            const SizedBox(
              height: 5,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<DatabaseRepository>(builder: (context, dbr, child) {
                  return FutureBuilder(
                      future: dbr.getTotalCalories(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final data = snapshot.data as int;
                          return Card(
                            color: Colors.blueGrey.shade200,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Calories burnt',
                                        style: TextStyle(fontSize: 15)),
                                    Text(
                                      '$data',
                                      style: TextStyle(fontSize: 40),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
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
                          return Card(
                            color: Colors.blueGrey.shade50,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: SizedBox(
                              height: 150,
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Calories burnt per day',
                                        style: TextStyle(fontSize: 15)),
                                    Text(
                                      '${(data / 7).round()}',
                                      style: TextStyle(fontSize: 40),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      });
                }),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Card(
              color: Colors.greenAccent.shade100,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const SizedBox(
                height: 150,
                width: 316,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('CO2 saved', style: TextStyle(fontSize: 15)),
                      Text(
                        '300',
                        style: TextStyle(fontSize: 40),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
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
