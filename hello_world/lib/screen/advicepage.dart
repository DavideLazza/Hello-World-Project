import 'package:flutter/material.dart';

class AdvicePage extends StatelessWidget {
  AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blueGrey, size: 30),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(child: Text('ciao')),
    );
  }
}
