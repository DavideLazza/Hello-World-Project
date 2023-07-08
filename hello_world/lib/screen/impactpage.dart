import 'dart:convert';
import 'dart:io';

import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/database/entities/exercise.dart';
import 'package:hello_world/repository/databaseRepository.dart';

// import 'package:hello_world/database/database.dart';
// import 'package:hello_world/database/entities/exercise.dart';
// import 'package:hello_world/repository/databaseRepository.dart';
import 'package:hello_world/utils/activity.dart';

import 'package:hello_world/utils/impact.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ImpactPage extends StatelessWidget {
  ImpactPage({super.key});

  int l = 0;
  List<Activity>? act1;

  final act = Activity(
      activityName: 'corsa',
      calories: 300,
      distance: 500,
      distanceUnit: 'Km',
      date: '2023-05-03');

  @override
  Widget build(BuildContext context) {
    _authorize();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              ElevatedButton(
                child: Text('get data'),
                onPressed: () async {
                  act1 = await _requestData();
                  l = act1!.length;
                  print(act1);
                  print(l);
                  print(act1?[0].activityName);
                },
              ),
              ElevatedButton(
                child: Text('save this week data inside db'),
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
                            act1?[i].date));
                  }
                  print('data added');
                },
              ),
              ElevatedButton(
                child: Text('remove data from db'),
                onPressed: () async {
                  await Provider.of<DatabaseRepository>(context, listen: false)
                      .deleteExercises();
                  print('data removed');
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pop(context);
      }),
    );
  } //build

  //This method allows to  obtain the JWT token pair from IMPACT and store it in SharedPreferences
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
  } //_authorize

  //This method allows to obtain the JWT token pair from IMPACT and store it in SharedPreferences
  Future<List<Activity>?> _requestData() async {
    //Initialize the result
    List<Activity>? activities = [];

    //Get the stored access token (Note that this code does not work if the tokens are null)
    final sp = await SharedPreferences.getInstance();
    var access = sp.getString('access');

    //If access token is expired, refresh it
    if (JwtDecoder.isExpired(access!)) {
      await _refreshTokens();
      access = sp.getString('access');
    } //if

    // ignore: prefer_interpolation_to_compose_strings
    final urlprova = Impact.baseUrl +
        Impact.exerciseEndpoint +
        Impact.patientUsername +
        '/day/2023-05-02';

    final urlEx = Impact.baseUrl +
        Impact.exerciseEndpoint +
        Impact.patientUsername +
        Impact.dateRange;

    final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};

    //Get the response
    print('Calling: $urlEx');
    final response = await http.get(Uri.parse(urlEx), headers: headers);
    final responseprova = await http.get(Uri.parse(urlprova), headers: headers);

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final decodedResponseprova = jsonDecode(responseprova.body);

      // print(decodedResponse['data'].length);
      // print(decodedResponse['data'].length);
      // print(decodedResponse['data'][2]['data'].length);
      // print(decodedResponseprova['data']['date'][0].runtimeType);

      //fare doppio ciclo for, uno per i data dello stesso giorno (come adesso) e uno per ciclare i giorni

      // final exerciseDao = database.exerciseDao;
      // var c = 0;

      // final exercise = Exercise(
      //     c++,
      //     decodedResponseprova['data']['data'][0]['activityName'],
      //     decodedResponseprova['data']['data'][0]['calories'],
      //     decodedResponseprova['data']['data'][0]['distance'],
      //     decodedResponseprova['data']['data'][0]['distanceUnit'],
      //     decodedResponseprova['data']['date'][0]);

      for (var i = 0; i < decodedResponse['data'].length; i++) {
        for (var j = 0; j < decodedResponse['data'][i]['data'].length; j++) {
          final activity = Activity(
              activityName: decodedResponse['data'][i]['data'][j]
                  ['activityName'],
              calories: decodedResponse['data'][i]['data'][j]['calories'],
              distance: decodedResponse['data'][i]['data'][j]['distance'],
              distanceUnit: decodedResponse['data'][i]['data'][j]
                  ['distanceUnit'],
              date: decodedResponse['data'][i]['date']);

          activities.add(activity);
        }
      }
      return activities;

      // activity: decodedResponse['data'][i]['data'][j]['activityName'],
      // cal: decodedResponse['data'][i]['data'][j]['calories'],
      // dist: decodedResponse['data'][i]['data'][j]['distance'],
      // distunit: decodedResponse['data'][i]['data'][j]['distanceUnit'],
      // date: decodedResponse['data'][i]['date']);

      // final prova = Exercise(1, 'corsa', 200, 8.53, 'Km', '2023-05-07');

      // await exerciseDao.insertExercises(prova);
      // null,
      // decodedResponseprova['data']['data'][0]['activityName'],
      // decodedResponseprova['data']['data'][0]['calories'],
      // decodedResponseprova['data']['data'][0]['distance'],
      // decodedResponseprova['data']['data'][0]['distanceUnit'],
      // decodedResponseprova['data']['date'][0]));

      // result = await exerciseDao.findAllExercises();

      // activities.add(activity);
    } else {
      return null;
    }
  }

  // return activities;

  // print(exercises);
  // print(exercises.length);

  //for
  //   } else {
  //     return null;
  //   }
  // } //_requestData

//This method allows to obtain the JWT token pair from IMPACT and store it in SharedPreferences
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
  } //_refreshT //HomePage
}
