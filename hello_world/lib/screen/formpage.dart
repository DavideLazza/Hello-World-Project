import 'package:flutter/material.dart';
import 'package:hello_world/provider/kilometergoal.dart';
import 'package:hello_world/screen/profilepage.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String fName = "";
  String lName = "";
  String height = "";
  String weight = "";
  String age = "";
  String gender = "";
  int goal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change your account info'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                setState(() {
                  fName = text;
                });
              },
              textInputAction: TextInputAction.next,
              style: const TextStyle(
                  fontFamily: "Poppins", fontSize: 18, color: Colors.blueGrey),
              decoration: const InputDecoration(
                  hintText: 'First Name',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  lName = text;
                });
              },
              textInputAction: TextInputAction.next,
              style: const TextStyle(
                  fontFamily: "Poppins", fontSize: 18, color: Colors.blueGrey),
              decoration: const InputDecoration(
                  hintText: 'Last Name',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  height = text;
                });
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                  fontFamily: "Poppins", fontSize: 18, color: Colors.blueGrey),
              decoration: const InputDecoration(
                  hintText: 'Height (cm)',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  weight = text;
                });
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                  fontFamily: "Poppins", fontSize: 18, color: Colors.blueGrey),
              decoration: const InputDecoration(
                  hintText: 'Weight (kg)',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  age = text;
                });
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                  fontFamily: "Poppins", fontSize: 18, color: Colors.blueGrey),
              decoration: const InputDecoration(
                  hintText: 'Age', hintStyle: TextStyle(color: Colors.black)),
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  gender = text;
                });
              },
              textInputAction: TextInputAction.next,
              style: const TextStyle(
                  fontFamily: "Poppins", fontSize: 18, color: Colors.blueGrey),
              decoration: const InputDecoration(
                  hintText: 'Gender',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  goal = int.parse(text);
                });
                context.read<KilometerGoal>().setKm(goal);
              },
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                  fontFamily: "Poppins", fontSize: 18, color: Colors.blueGrey),
              decoration: const InputDecoration(
                  hintText: 'Activities goal (Km)',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfilePage(
                    name: fName,
                    surname: lName,
                    height: height,
                    weight: weight,
                    age: age,
                    gender: gender,
                  )));
        },
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
