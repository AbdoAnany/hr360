import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as G;

class Network {
  final _baseUrl = 'https://offers.elnoorphp.com/api/';

  Future<Response> get(
      {required String endPoint, userToken, String? lang, params}) async {
    // ignore: omit_local_variable_types
    Map<String, dynamic> headers = {};

    if (userToken != null) {
      headers.addAll({'Authorization': 'Bearer $userToken'});
    }
    if (lang != null) {
      headers.addAll({'Accept-Language': lang});
    }
    log('Calling $_baseUrl$endPoint   with params $params  and headers $headers');

    var response = await Dio().get('$_baseUrl$endPoint',
        options: Options(headers: headers), queryParameters: params);


    print('response.realUri');
    print(response.realUri);
    return response;
  }

  Future<Response> postData({
    required endUrl,
    required dynamic body,
    bool isFormData = false,
    String? userToken,
  }) async {
    log('Calling $_baseUrl$endUrl with body $body');
    // ignore: unused_local_variable
    var formData = FormData.fromMap(body);
    // ignore: omit_local_variable_types
    Map<String, dynamic> headers = {};

    headers.addAll({'accept': 'application/json'});

    if (userToken != null) {
      headers.addAll({
        'Authorization': 'Bearer $userToken',
      });
    }
    var response = await Dio().post('$_baseUrl$endUrl',
        options: Options(headers: headers), data: isFormData ? formData : body);
    // if (response.statusCode == 200 ||
    //     response.statusCode == 201 ||
    //     response.statusCode == 204) {
    // } else {
    //   errorHandler(response.data, response.statusCode);
    // }
    return response;
  }

  Future<Response> put(
      {required String endUrl,
      dynamic body,
      String? bearerToken,
      bool isFormData = true}) async {
    // ignore: omit_local_variable_types
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
    };
    if (bearerToken != null) {
      headers.addAll({'Authorization': 'Bearer $bearerToken'});
    }
    log('Calling $_baseUrl$endUrl   with body $body  \n isFormData $isFormData');
    var formData = FormData.fromMap(body);
    var response = await Dio().put(
      // ignore: prefer_single_quotes
      "$_baseUrl$endUrl",
      data: isFormData ? formData : body,
      options: Options(
        headers: headers,
        followRedirects: true,
        //  contentType: Headers.formUrlEncodedContentType,
        contentType: "application/x-www-form-urlencoded",
      ),
    );
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204) {
    } else {
      errorHandler(response.data, response.statusCode!);
    }

    log('response = ${response.data}');

    return response;
  }

  Future<Response> delete(
      {String? endUrl, dynamic body, String? bearerToken}) async {
    // ignore: omit_local_variable_types
    Map<String, dynamic> headers = {
      'Accept': 'application/json',
    };
    if (bearerToken != null) {
      headers.addAll({'Authorization': 'Bearer $bearerToken'});
    }
    var response = await Dio().delete(
      // ignore: prefer_single_quotes
      "$_baseUrl$endUrl",
      data: body,
      options: Options(
          headers: headers, contentType: Headers.formUrlEncodedContentType),
    );

    return response;
  }

  void errorHandler(String errorBody, int statusCode) {
    String message = "";
    if (errorBody != null) {
      String body = errorBody;
      var jsonObject = jsonDecode(body);
      message = jsonObject['message'];
      G.Get.dialog(Center(
        child: Container(
          width: G.Get.width * .7,
          height: 150,
          color: Colors.white,
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Container(
                  height: 100,
                  child: Center(
                    child: Text(
                      message,
                    ),
                  ),
                ),
                // CustomButton(
                //   text: 'إغلاق',
                //   width: 100,
                //   hight: 40,
                //   onTap: () {
                //     G.Get.back();
                //   },
                // )
              ])),
        ),
      ));
      //  Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
    }
  }
}
