import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello_world/database/entities/exercise.dart';
import 'package:hello_world/repository/databaseRepository.dart';

import 'package:hello_world/utils/activity.dart';

import 'package:hello_world/utils/impact.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ImpactPage extends StatefulWidget {
  ImpactPage({super.key});

  @override
  State<ImpactPage> createState() => _ImpactPageState();
}

class _ImpactPageState extends State<ImpactPage> {
  int l = 0;

  TextEditingController dateController = TextEditingController();
  TextEditingController dateController2 = TextEditingController();

  List<Activity>? act1;

  @override
  void initState() {
    super.initState();
    dateController.text = '';
    dateController2.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Select data range',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Max 7 days range',
              style: TextStyle(
                fontSize: 17,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: dateController,
              style: const TextStyle(
                  fontFamily: "Poppins", fontSize: 18, color: Colors.blueGrey),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black,
                  ),
                  hintText: "Enter start date",
                  hintStyle: TextStyle(color: Colors.black)),
              readOnly: true,
              onTap: () async {
                _authorize();
                DateTime? pickedStartDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023, 2, 1),
                    lastDate: DateTime(2023, 12, 31));
                if (pickedStartDate != null) {
                  String StartDate =
                      DateFormat('yyyy-MM-dd').format(pickedStartDate);
                  print(StartDate);
                  setState(() {
                    dateController.text = StartDate.toString();
                  });
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Data not selected, try again')));
                }
              },
            ),
            TextField(
              controller: dateController2,
              style: const TextStyle(
                  fontFamily: "Poppins", fontSize: 18, color: Colors.blueGrey),
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.black,
                  ),
                  hintText: "Enter end date",
                  hintStyle: TextStyle(color: Colors.black)),
              readOnly: true,
              onTap: () async {
                var x = DateTime.now().day;
                DateTime? pickedEndDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(
                        int.parse(dateController.text.substring(0, 4)),
                        int.parse(dateController.text.substring(5, 7)),
                        int.parse(dateController.text.substring(8, 10))),
                    firstDate: DateTime(
                        int.parse(dateController.text.substring(0, 4)),
                        int.parse(dateController.text.substring(5, 7)),
                        int.parse(dateController.text.substring(8, 10))),
                    lastDate: int.parse(dateController.text.substring(8, 10)) +
                                7 <
                            x
                        ? DateTime(
                            int.parse(dateController.text.substring(0, 4)),
                            int.parse(dateController.text.substring(5, 7)),
                            int.parse(dateController.text.substring(8, 10)) + 7)
                        : DateTime(
                            int.parse(dateController.text.substring(0, 4)),
                            int.parse(dateController.text.substring(5, 7)),
                            DateTime.now().day));
                if (pickedEndDate != null) {
                  String EndDate =
                      DateFormat('yyyy-MM-dd').format(pickedEndDate);

                  //DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG
                  print(EndDate);

                  setState(
                    () {
                      dateController2.text = EndDate.toString();
                    },
                  );
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    'Data not selected, try again',
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  )));
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      act1 = await _requestData(
                          dateController.text, dateController2.text);
                      l = act1!.length;

                      // DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG
                      print(act1);
                      print(l);
                      print(act1?[0].activityName);
                    },
                    child: const Text(
                      'Get data',
                    )),
                ElevatedButton(
                    onPressed: () async {
                      for (var i = 0; i < l; i++) {
                        await Provider.of<DatabaseRepository>(context,
                                listen: false)
                            .insertExercises(Exercise(
                                null,
                                act1?[i].activityName,
                                act1?[i].calories,
                                act1?[i].distance,
                                act1?[i].distanceUnit,
                                act1?[i].avgHR,
                                act1?[i].speed,
                                act1?[i].duration,
                                act1?[i].date));
                      }

                      //DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG

                      print('data added');
                    },
                    child: const Text('Save data')),
                ElevatedButton(
                    onPressed: () async {
                      await Provider.of<DatabaseRepository>(context,
                              listen: false)
                          .deleteExercises();

                      //DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG DEBUG

                      print('data removed');
                    },
                    child: const Text('Delete data'))
              ],
            )
          ],
        )),
      ),

      // NEW DISPLAY

      // DISPLAY DATA WITH FUTURE BUILDER

      // body: Center(
      //   child: Consumer<DatabaseRepository>(
      //     builder: (context, dbr, child) {
      //       return FutureBuilder(
      //           future: dbr.findAllExercises(),
      //           builder: (context, snapshot) {
      //             if (snapshot.hasData) {
      //               final data = snapshot.data as List<Exercise>;
      //               return ListView.builder(
      //                 itemCount: data.length,
      //                 itemBuilder: (context, index) {
      //                   final exercise = data[index];
      //                   return Card(
      //                     elevation: 5,
      //                     child: ListTile(
      //                       title: Text(exercise.name!),
      //                       subtitle: Text(
      //                           'ID: ${exercise.id}, calories: ${exercise.cal}'),
      //                     ),
      //                   );
      //                 },
      //               );
      //             } else {
      //               return CircularProgressIndicator();
      //             }
      //           });
      //     },
      //   ),
      // ),
    );
  }

  //build
  Future<int?> _authorize() async {
    //check if the IMPACT backend is up
    final urlisup = Impact.baseUrl + Impact.pingEndpoint;
    final responseisup = await http.get(Uri.parse(urlisup));

    if (responseisup.statusCode == 200) {
      print('Impact backend is up');
    }
    //Create the request

    final url = Impact.baseUrl + Impact.tokenEndpoint;
    final body = {'username': Impact.username, 'password': Impact.password};

    //Get the response
    print('Calling: $url');
    final response = await http.post(Uri.parse(url), body: body);

    //If 200, set the token
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      sp.setString('access', decodedResponse['access']);
      sp.setString('refresh', decodedResponse['refresh']);
    } //if

    //Just return the status code
    return response.statusCode;
  }

  //_authorize
  Future<List<Activity>?> _requestData(String startDate, String endDate) async {
    //Initialize the result
    List<Activity>? activities = [];
    var urlEx = "";

    //Get the stored access token (Note that this code does not work if the tokens are null)
    final sp = await SharedPreferences.getInstance();
    var access = sp.getString('access');

    //If access token is expired, refresh it
    if (JwtDecoder.isExpired(access!)) {
      await _refreshTokens();
      access = sp.getString('access');
    }

    if (startDate == endDate) {
      // ignore: prefer_interpolation_to_compose_strings
      urlEx = Impact.baseUrl +
          Impact.exerciseEndpoint +
          Impact.patientUsername +
          '/day/$startDate/';

      final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};
      print('Calling: $urlEx');
      final response = await http.get(Uri.parse(urlEx), headers: headers);

      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);

        for (var j = 0; j < decodedResponse['data']['data'].length; j++) {
          final activity = Activity(
              activityName: decodedResponse['data']['data'][j]['activityName'],
              calories: decodedResponse['data']['data'][j]['calories'],
              distance: decodedResponse['data']['data'][j]['distance'],
              distanceUnit: decodedResponse['data']['data'][j]['distanceUnit'],
              avgHR: decodedResponse['data']['data'][j]['averageHeartRate'],
              speed: decodedResponse['data']['data'][j]['speed'],
              duration: decodedResponse['data']['data'][j]['activeDuration'],
              date: decodedResponse['data']['date']);

          activities.add(activity);
        }
        return activities;
      } else {
        return null;
      }
    } else {
      // ignore: prefer_interpolation_to_compose_strings
      urlEx = Impact.baseUrl +
          Impact.exerciseEndpoint +
          Impact.patientUsername +
          '/daterange/start_date/$startDate/end_date/$endDate/';

      final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};

      //Get the response
      print('Calling: $urlEx');
      final response = await http.get(Uri.parse(urlEx), headers: headers);

      //if OK parse the response, otherwise return null
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);

        for (var i = 0; i < decodedResponse['data'].length; i++) {
          for (var j = 0; j < decodedResponse['data'][i]['data'].length; j++) {
            final activity = Activity(
                activityName: decodedResponse['data'][i]['data'][j]
                    ['activityName'],
                calories: decodedResponse['data'][i]['data'][j]['calories'],
                distance: decodedResponse['data'][i]['data'][j]['distance'],
                distanceUnit: decodedResponse['data'][i]['data'][j]
                    ['distanceUnit'],
                avgHR: decodedResponse['data'][i]['data'][j]
                    ['averageHeartRate'],
                speed: decodedResponse['data'][i]['data'][j]['speed'],
                duration: decodedResponse['data'][i]['data'][j]
                    ['activeDuration'],
                date: decodedResponse['data'][i]['date']);

            activities.add(activity);
          }
        }
        return activities;
      } else {
        return null;
      }
    }
  }

  // return activities;
  Future<int> _refreshTokens() async {
    //Create the request
    final url = Impact.baseUrl + Impact.refreshEndpoint;
    final sp = await SharedPreferences.getInstance();
    final refresh = sp.getString('refresh');
    final body = {'refresh': refresh};

    //Get the respone
    print('Calling: $url');
    final response = await http.post(Uri.parse(url), body: body);

    //If 200 set the tokens
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final sp = await SharedPreferences.getInstance();
      sp.setString('access', decodedResponse['access']);
      sp.setString('refresh', decodedResponse['refresh']);
    } //if

    //Return just the status code
    return response.statusCode;
  }
}
