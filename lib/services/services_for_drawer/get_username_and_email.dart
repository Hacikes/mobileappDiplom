import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class UserMe {
  String username = "";
  String email = "";

  UserMe();

// Получение информации о доли валюты в различных инструментах
  Future <void> getUserMe() async {

    final signInService = SingInService();
    await signInService.getUserId();

    final url = Uri.parse('http://80.90.179.158:9999/user/me');
    final headers = {
      'Accept': 'application/json',
      'Accept-Encoding': 'gzip, deflate',
      'Accept-Language': 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7',
      'Cookie': '$cookieValue'
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // Обработка успешного ответа
      // print('Успешный ответ: ${response.headers}');
      // print('Успешный ответ: ${response.body}');
      // print('Успешный ответ: $url');
      print('Выдвижная панель -- Успешный ответ при получении имени и почты пользователя: ${response.statusCode}');

      // Парсим тело ответа
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      //print(decodedJson);
      email = decodedJson['email'];
      username = utf8.decode(decodedJson['username'].codeUnits);
      //print(email);
      //print(username);

    } else {
      // Обработка ошибки
      print('Выдвижная панель -- Ошибка при получении имени и почты пользователя: ${response.statusCode}');
      // print('Успешный ответ: $url');
    }
    // return totalSum;
  }
}

