import 'package:flutter/material.dart';

class Intro3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Image.asset(
              'images/aaa.png',
              height: 300,
            ),
            const SizedBox(height: 50),
            const Text(
              'MY GOAL',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(45, 20, 45, 15),
              child: Text(
                'This app wants to encourage people reaching their fitness goals in a sustainable way, discovering the local lands, their products and culture',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ],
        ));
  }
}
