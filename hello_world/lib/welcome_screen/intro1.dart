import 'package:flutter/material.dart';

class Intro1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Image.asset(
              'images/sdg.png',
              height: 350,
            ),
            const SizedBox(height: 50),
            const Text(
              'SDG',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(45, 20, 45, 15),
              child: Text(
                'The Sustainable Development Goals (SDG) are a series of 17 goals defined by ONU, in order to have a more sustainable future',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ],
        ));
  }
}
