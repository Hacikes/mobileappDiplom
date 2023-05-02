import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';

// Глобальные переменные куки и user id для пользователя задаются тут
String? cookieValue;
int? userid;

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  // Получаемые при логине поля
  String email = '';
  String password = '';

  Future<void> signIn() async {
    final url = Uri.parse('http://80.90.179.158:9999/auth/login');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'};
    final body = {'username': 'string', 'password': 'string'};
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Обработка успешного ответа
      print('Успешный ответ: ${response.headers}');
      print('Успешный ответ: ${response.body}');

      // Поиск и сохранение Cookie в переменную cookieValue
      final setCookieHeader = response.headers['set-cookie'];
      final regex = RegExp(r'bonds=.{157}');
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

  @override
  void initState() {
    super.initState();
    signIn().then((value) => getUserId());
    //getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // SizedBox(height: 200.0,),
                Text(
                'Login',
                style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0,),
              TextField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 10.0,),
              TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  print(email);
                  print(password);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700]
                ),
                child: Text(
                  'Sign In',
                  style: TextStyle(color:Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Действие при нажатии на кнопку
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  // Действие при нажатии на кнопку
                  widget.toggleView();
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



