import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello_world/utils/exercise.dart';

import 'package:hello_world/utils/impact.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ImpactPage extends StatelessWidget {
  const ImpactPage({super.key});

  @override
  Widget build(BuildContext context) {
    _authorize();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _requestData();
            },
            child: Text('ciao')),
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
  Future<List<Exercise>?> _requestData() async {
    //Initialize the result
    List<Exercise>? exercises = [];

    //Get the stored access token (Note that this code does not work if the tokens are null)
    final sp = await SharedPreferences.getInstance();
    var access = sp.getString('access');

    //If access token is expired, refresh it
    if (JwtDecoder.isExpired(access!)) {
      await _refreshTokens();
      access = sp.getString('access');
    } //if

    //Create the (representative) request
    // ignore: prefer_const_declarations
    final day = '2023-05-02';

    // ignore: prefer_interpolation_to_compose_strings
    final url = Impact.baseUrl +
        Impact.exerciseEndpoint +
        Impact.patientUsername +
        '/day/$day/';

    final urlcalorie = Impact.baseUrl +
        'data/v1/exercise/patients/' +
        'Jpefaq6m58' +
        '/daterange/start_date/2023-05-01/end_date/2023-05-7/';

    final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};

    //Get the response
    print('Calling: $url');
    final response = await http.get(Uri.parse(url), headers: headers);
    final responsecal = await http.get(Uri.parse(urlcalorie), headers: headers);

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      final decodedResponsecal = jsonDecode(responsecal.body);

      print(decodedResponsecal['data']);
      print(decodedResponsecal['data'].length);

      //fare doppio ciclo for, uno per i data dello stesso giorno (come adesso) e uno per ciclare i giorni

      for (var i = 0; i < decodedResponse['data'].length; i++) {
        final exercise = Exercise(
            activityName: decodedResponse['data']['data'][i]['activityName'],
            calories: decodedResponse['data']['data'][i]['calories'],
            distance: decodedResponse['data']['data'][i]['distance'],
            distanceUnit: decodedResponse['data']['data'][i]['distanceUnit'],
            date: day);

        exercises.add(exercise);
      }

      print(exercises.length);
      //for
    } else {
      return null;
    }
  } //_requestData

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
