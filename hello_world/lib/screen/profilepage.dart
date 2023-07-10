import 'package:flutter/material.dart';
import 'package:hello_world/screen/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'formpage.dart';
import 'loginpage.dart';

class ProfilePage extends StatelessWidget {
  String name = "",
      surname = "",
      height = "",
      weight = "",
      age = "",
      gender = "";

  ProfilePage(
      {required this.name,
      required this.surname,
      required this.height,
      required this.weight,
      required this.age,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            const Text(
              'User Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontFamily: "Poppins"),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const FormPage())));
                },
                icon: const Icon(
                  Icons.mode_edit_outline,
                  color: Colors.white,
                )),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'User Name: ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Poppins"),
                  ),
                  Text(name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Poppins",
                          decoration: TextDecoration.underline))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'User Surname: ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Poppins"),
                  ),
                  Text(surname,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Poppins",
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'User Height (cm): ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Poppins"),
                    ),
                    Text(height,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Poppins",
                            decoration: TextDecoration.underline)),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'User Weight (kg): ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Poppins"),
                    ),
                    Text(weight,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Poppins",
                            decoration: TextDecoration.underline)),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'User Age: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Poppins"),
                    ),
                    Text(age,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Poppins",
                            decoration: TextDecoration.underline)),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'User Gender: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Poppins"),
                    ),
                    Text(gender,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Poppins",
                            decoration: TextDecoration.underline)),
                  ],
                )),
            const SizedBox(
              height: 65,
            ),
            ElevatedButton(
              onPressed: () {
                _toLoginPage(context);
              },
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Text(
                'Log in/out',
                style: TextStyle(fontFamily: "Poppins", fontSize: 18),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(
                      presname: name,
                      name1: name,
                      surname1: surname,
                      height1: height,
                      weight1: weight,
                      age1: age,
                      gender1: gender,
                    )));
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.blueGrey,
          ),
        ));
  }
}

void _toLoginPage(BuildContext context) async {
  final sp = await SharedPreferences.getInstance();
  sp.remove('username');

  final profiledata = await SharedPreferences.getInstance();
  profiledata.remove('first name');

  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
}
