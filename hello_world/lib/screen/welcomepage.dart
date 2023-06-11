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
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 800,
            child: PageView(
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
          ),
          isLastPage
              ? Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const HomePage())));
                          },
                          child: const Text(
                            'DO IT LATER',
                          ),
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                          ),
                        ),
                        TextButton(
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const LoginPage())));
                          },
                        ),
                      ]),
                )
              : Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () => controller.jumpToPage(2),
                            child: const Text('SKIP')),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                          ),
                        ),
                        TextButton(
                            onPressed: () => controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut),
                            child: const Text('NEXT')),
                      ]),
                )
        ],
      ),
    );
  }
}
