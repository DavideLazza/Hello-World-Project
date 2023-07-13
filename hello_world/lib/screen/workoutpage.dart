import 'package:flutter/material.dart';
import 'package:hello_world/database/entities/exercise.dart';
import 'package:hello_world/repository/databaseRepository.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WorkoutPage extends StatelessWidget {
  WorkoutPage({super.key});

  PageController controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blueGrey, size: 30),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Consumer<DatabaseRepository>(builder: (context, dbr, child) {
          return FutureBuilder(
              future: dbr.findAllExercises(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as List<Exercise>;
                  return PageView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final exercise = data[index];
                        return Column(
                          children: [
                            Stack(children: [
                              const Positioned(
                                left: 20,
                                top: 20,
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              Positioned(
                                left: 50,
                                top: 20,
                                child: Text(
                                  '${exercise.date}',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.blueGrey,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              SizedBox(
                                  height: 250,
                                  child: Center(
                                    child: Text(
                                      '${exercise.name}',
                                      style: const TextStyle(
                                        fontSize: 40,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3,
                                      ),
                                    ),
                                  )),
                            ]),
                            Container(
                              height: 463,
                              decoration: const BoxDecoration(
                                color: Colors.blueGrey,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 40, left: 20, right: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: SizedBox(
                                            height: 100,
                                            width: 150,
                                            child: Column(
                                              children: [
                                                Text('${exercise.cal}',
                                                    style: const TextStyle(
                                                        fontSize: 40)),
                                                const Text(
                                                  'Calories',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: SizedBox(
                                            height: 100,
                                            width: 170,
                                            child: Column(
                                              children: [
                                                Text('${exercise.avgHR}',
                                                    style: const TextStyle(
                                                        fontSize: 40)),
                                                const Text(
                                                  'Avg HeartRate (bpm)',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Card(
                                      color: Colors.white,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: SizedBox(
                                        height: 100,
                                        width: 340,
                                        child: Column(
                                          children: exercise.speed == null
                                              ? [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(35.0),
                                                    child: Text(
                                                        'Data not available',
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            color: Colors.red,
                                                            fontStyle: FontStyle
                                                                .italic)),
                                                  ),
                                                ]
                                              : [
                                                  Text(
                                                      '${double.parse(exercise.speed!.toStringAsFixed(2))}',
                                                      style: const TextStyle(
                                                          fontSize: 40)),
                                                  const Text(
                                                    'Avg speed Km/h',
                                                    style:
                                                        TextStyle(fontSize: 15),
                                                  )
                                                ],
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: SizedBox(
                                            height: 100,
                                            width: 200,
                                            child: Column(
                                              children: [
                                                Text(
                                                    '${((exercise.duration)! / (60000)).round()}',
                                                    style: const TextStyle(
                                                        fontSize: 40)),
                                                const Text(
                                                  'Active duration (min)',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: SizedBox(
                                            height: 100,
                                            width: 120,
                                            child: Column(
                                              children: exercise.dist == null
                                                  ? [
                                                      const Padding(
                                                        padding: EdgeInsets.all(
                                                            20.0),
                                                        child: Text(
                                                            'Data not available',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                color:
                                                                    Colors.red,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic)),
                                                      ),
                                                    ]
                                                  : [
                                                      Text(
                                                          '${double.parse(exercise.dist!.toStringAsFixed(2))}',
                                                          style:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      40)),
                                                      const Text(
                                                        'Distance (Km)',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      )
                                                    ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      });
                } else {
                  return const CircularProgressIndicator();
                }
              });
        }));
  }
}
