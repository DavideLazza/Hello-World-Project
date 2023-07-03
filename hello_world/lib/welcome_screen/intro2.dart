import 'package:flutter/material.dart';

class Intro2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            const Text(
              'MANCHESTER CITY',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(45, 20, 45, 15),
              child: Text(
                'Nella notte di Istanbul il Manchester City vince la sua prima Champions League battendo un\'inter mai doma, che avrebbe meritato almeno di andare ai supplementari',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(height: 50),
            Image.asset(
              'images/city.png',
              height: 250,
            ),
          ],
        ));
  }
}
