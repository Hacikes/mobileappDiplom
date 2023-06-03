import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class LogOutService {

  Future<int> logout() async {
    final url = Uri.parse('http://80.90.179.158:9999/auth/logout');
    final headers = {
      'accept': 'application/json',
      'cookie': '$cookieValue',
      };
    //final body = {'username': username, 'password': password};
    final response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      // Обработка успешного ответа
      // print('Успешный ответ: ${response.headers}');
      // print('Успешный ответ: ${response.body}');
      print('Успешный ответ при логауте: ${response.statusCode}');


      //print(cookieValue);
    } else {
      // Обработка ошибки
      print('Ошибка пответ при логауте: ${response.statusCode}');
    }
    return response.statusCode;
  }


}