import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hello_world/utils/impact.dart';
import 'package:hello_world/utils/steps.dart';
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
  Future<List<Steps>?> _requestData() async {
    //Initialize the result
    List<Steps>? result;

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
    final day = '2023-05-04';
    // ignore: prefer_interpolation_to_compose_strings
    final url = Impact.baseUrl +
        Impact.stepsEndpoint +
        Impact.patientUsername +
        '/day/$day/';
    final headers = {HttpHeaders.authorizationHeader: 'Bearer $access'};

    //Get the response
    print('Calling: $url');
    final response = await http.get(Uri.parse(url), headers: headers);

    //if OK parse the response, otherwise return null
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      result = [];
      for (var i = 0; i < decodedResponse['data']['data'].length; i++) {
        result.add(Steps.fromJson(decodedResponse['data']['date'],
            decodedResponse['data']['data'][i]));
      } //for
    } //if
    else {
      result = null;
    } //else

    //Return the result
    print(result);
    return result;
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
  } //_refreshTokens
} //HomePage
