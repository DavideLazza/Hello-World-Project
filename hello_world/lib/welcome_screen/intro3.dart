import 'package:flutter/material.dart';

class Intro3 extends StatelessWidget {
  const Intro3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        padding: const EdgeInsets.only(top: 300),
        child: const Column(
          children: [
            Text(
              'MY GOAL',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(45, 20, 45, 15),
              child: Text(
                'This app aims to encourage people to achieve their fitness goals in a sustainable way, discovering local areas, their products and culture',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
          ],
        ));
  }
}
