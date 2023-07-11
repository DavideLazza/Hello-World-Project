import 'package:flutter/material.dart';
import 'package:hello_world/provider/kilometerdone.dart';
import 'package:hello_world/provider/kilometergoal.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                height: 165,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'You achieved ${context.watch<KilometerDone>().kmDone}/${context.watch<KilometerGoal>().km} Km of your goal',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      context.watch<KilometerDone>().kmDone >=
                              context.watch<KilometerGoal>().km
                          ? const Text(
                              'Good job, take a rest!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            )
                          : const Text(
                              'You have some km left, go exploring your lands in a sustainable way!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const SizedBox(
                height: 120,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'Stay hydrated and say NO to single use plastic! When running or cycling remember to use your personal eco water bottle'),
                ),
              ),
            ),
            Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const SizedBox(
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'Leave your car at home! By walking or cycling you save about 100 g/km of CO2'),
                ),
              ),
            ),
            Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const SizedBox(
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'take advantage of your sports activities to explore new places'),
                ),
              ),
            ),
            Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const SizedBox(
                height: 100,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'Respect the nature and local culture. Share your activities with other people, it will be great!'),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
