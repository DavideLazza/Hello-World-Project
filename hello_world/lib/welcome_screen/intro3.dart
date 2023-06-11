import 'package:flutter/material.dart';

class Intro3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 180),
        child: Column(
          children: [
            Image.asset(
              'images/milan.png',
              height: 250,
            ),
            const SizedBox(height: 100),
            const Text(
              'ALLA FINE VINCE SEMPRE IL MILAN',
              textAlign: TextAlign.center,
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
          ],
        ));
  }
}
