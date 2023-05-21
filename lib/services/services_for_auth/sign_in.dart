import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';

// Глобальные переменные куки и user id для пользователя задаются тут
String? cookieValue;
int? userid;
String? useremail;
bool? useris_active;
bool? useris_superuser;
bool? useris_verified;
String? userusername;
int? userrole_id;

class SingInService {

  Future<int> signIn(String username, String password) async {
    final url = Uri.parse('http://80.90.179.158:9999/auth/login');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'};
    final body = {'username': username, 'password': password};
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Обработка успешного ответа
      // print('Успешный ответ: ${response.headers}');
      // print('Успешный ответ: ${response.body}');
      print('Успешный ответ при авторизации: ${response.statusCode}');


      // Поиск и сохранение Cookie в переменную cookieValue
      final setCookieHeader = response.headers['set-cookie'];
      final regex = RegExp(r'(bonds=[^;,\s]+)');
      final match = regex.firstMatch(setCookieHeader!);
      cookieValue = match?.group(0);
      //print(cookieValue);
    } else {
      // Обработка ошибки
      print('Ошибка при авторизации: ${response.statusCode}');
    }
    return response.statusCode;
  }

// Получение user_id
  Future<int?> getUserId() async {
    final url = Uri.parse('http://80.90.179.158:9999/user/me');
    final headers = {
      'Accept-Encoding': 'gzip, deflate, br',
      'Cookie': '$cookieValue'};
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // Обработка успешного ответа
      // print('Успешный ответ: ${response.headers}');
      // print('Успешный ответ: ${response.body}');
      print('Успешный ответ при получении userid: ${response.statusCode}');

      // Получение из ответа user_id и запись его в глобальную переменную userid и не только их
      Map data = jsonDecode(response.body);
      userid = data['id'];
      useremail = data['email'];
      useris_active = data['is_active'];
      useris_superuser = data['is_superuser'];
      useris_verified = data['is_verified'];
      userrole_id = data['role_id'];
      userusername = data['username'];
      //print(userid);
    } else {
      // Обработка ошибки
      print('Ошибка при получении userid: ${response.statusCode}');
    }
    return userid;
  }
}