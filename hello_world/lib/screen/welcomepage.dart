import 'package:flutter/material.dart';
import 'package:hello_world/welcome_screen/intro1.dart';
import 'package:hello_world/welcome_screen/intro2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: _controller,
        children: [
          Intro1(),
          Intro2(),
          Container(color: Colors.green),
        ],
      ),
      Container(
        alignment: const Alignment(0, 0.75),
        child: SmoothPageIndicator(controller: _controller, count: 3),
      )
    ]));
  }
}
