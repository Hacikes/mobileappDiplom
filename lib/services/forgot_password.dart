import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:mobile_app_diplom/services/sign_in.dart';

class ForgotPassword {

  //final userId = SingInService().getUserId();
  // print(signInService);

  Future<int> forgotPassword(String password) async {
    final url = Uri.parse('http://80.90.179.158:9999/user/$userid');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Cookie': '$cookieValue'};
    final body = {
      'email': useremail,
      'username': userusername,
      'password': password,
      'is_active': useris_active,
      'is_verified': useris_verified,
      'role_id': userrole_id,
    };
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Обработка успешного ответа
      print('Успешный ответ: ${response.headers}');
      print('Успешный ответ: ${response.body}');
    }
    return response.statusCode;
  }
}