import 'package:flutter/material.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 300),
        child: const Column(
          children: [
            Text(
              'TARGET 8.9',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blueGrey),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(45, 20, 45, 15),
              child: Text(
                'By 2030, devise and implement policies to promote sustainable tourism that creates jobs and promotes local culture and products',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.blueGrey),
              ),
            ),
          ],
        ));
  }
}
