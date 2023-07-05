import 'package:flutter/material.dart';

class Intro2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            const Text(
              'TARGET 8.9',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blueGrey),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(45, 20, 45, 15),
              child: Text(
                'Target 8.9 wants to devise and implement policies to promote sustainable tourism that creates jobs and promote local culture and products',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, color: Colors.blueGrey),
              ),
            ),
            const SizedBox(height: 50),
            Image.asset(
              'images/bike.png',
              height: 260,
            ),
          ],
        ));
  }
}
