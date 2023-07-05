import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hello_world/screen/homepage.dart';
import 'package:hello_world/screen/loginpage.dart';
import 'package:hello_world/welcome_screen/intro1.dart';
import 'package:hello_world/welcome_screen/intro2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../welcome_screen/intro3.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              Intro1(),
              Intro2(),
              Intro3(),
            ],
          ),
          isLastPage
              ? Container(
                  alignment: const Alignment(0, 0.85),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 160),
                          child: SmoothPageIndicator(
                              controller: controller,
                              count: 3,
                              effect: WormEffect(
                                activeDotColor: Colors.blueGrey.shade800,
                              )),
                        ),
                        TextButton(
                          child: Text(
                            'NEXT',
                            style: TextStyle(color: Colors.blueGrey.shade800),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HomePage(
                                          presname: "",
                                          name1: "",
                                          surname1: "",
                                          height1: "",
                                          weight1: "",
                                          age1: "",
                                          gender1: "",
                                        ))));
                          },
                        ),
                      ]),
                )
              : Container(
                  alignment: const Alignment(0, 0.85),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () => controller.jumpToPage(2),
                            child: Text(
                              'SKIP',
                              style: TextStyle(color: Colors.blueGrey.shade800),
                            )),
                        SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: WormEffect(
                              activeDotColor: Colors.blueGrey.shade800),
                        ),
                        TextButton(
                            onPressed: () => controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut),
                            child: Text('NEXT',
                                style: TextStyle(
                                    color: Colors.blueGrey.shade800))),
                      ]),
                )
        ],
      ),
    );
  }
}
