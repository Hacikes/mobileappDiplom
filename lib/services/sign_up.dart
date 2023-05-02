import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';

class SingUpService {

  Future<void> signIn(String email, String username, String password) async {
    final url = Uri.parse('http://80.90.179.158:9999/auth/register');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      'email': email,
      'username': username,
      'password': password,
      'is_active': true,
      'is_verified': false,
      'role_id': 1,
    });
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Обработка успешного ответа
      print('Успешный ответ: ${response.headers}');
      print('Успешный ответ: ${response.body}');
    } else {
      // Обработка ошибки
      print('Ошибка: ${response.statusCode}');
    }
  }
}