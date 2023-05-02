import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';

// Глобальные переменные куки и user id для пользователя задаются тут
String? cookieValue;
int? userid;

class SingInService {

  Future<void> signIn(String username, String password) async {
    final url = Uri.parse('http://80.90.179.158:9999/auth/login');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'};
    final body = {'username': username, 'password': password};
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Обработка успешного ответа
      print('Успешный ответ: ${response.headers}');
      print('Успешный ответ: ${response.body}');

      // Поиск и сохранение Cookie в переменную cookieValue
      final setCookieHeader = response.headers['set-cookie'];
      final regex = RegExp(r'(bonds=[^;,\s]+)');
      final match = regex.firstMatch(setCookieHeader!);
      cookieValue = match?.group(0);
      //print(cookieValue);
    } else {
      // Обработка ошибки
      print('Ошибка: ${response.statusCode}');
    }
  }

// Получение user_id
  Future<void> getUserId() async {
    final url = Uri.parse('http://80.90.179.158:9999/user/me');
    final headers = {
      'Accept-Encoding': 'gzip, deflate, br',
      'Cookie': '$cookieValue'};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // Обработка успешного ответа
      print('Успешный ответ: ${response.headers}');
      print('Успешный ответ: ${response.body}');

      // Получение из ответа user_id и запись его в глобальную переменную userid
      Map data = jsonDecode(response.body);
      userid = data['id'];
      //print(userid);
    } else {
      // Обработка ошибки
      print('Ошибка: ${response.statusCode}');
    }
  }
}