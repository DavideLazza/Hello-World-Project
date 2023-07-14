import 'package:flutter/material.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
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
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const SizedBox(
                height: 80,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'Leave your car at home! Walking or cycling saves about 100 g/km of CO2'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const SizedBox(
                height: 80,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'take advantage of your sports activities to explore new places'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 5,
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const SizedBox(
                height: 110,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'Respect nature and local culture. Share your activities with other people, it will be great!'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                      'Remember to consume the necessary calories for your exercises, try some zero-kilometer local food!'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
