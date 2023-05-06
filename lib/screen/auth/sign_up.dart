import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:mobile_app_diplom/screen/auth/sigh_in.dart';
import 'package:mobile_app_diplom/services/sign_up.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();

  // Вводимые при регистрации поля
  String email = '';
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // SizedBox(height: 200.0,),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0,),
              TextFormField(
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
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter email';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
                    return 'Enter valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    username = value;
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
                  hintText: 'Name',
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Enter name';
                  } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(val)) {
                    return 'Enter valid name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0,),
              TextFormField(
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
                obscureText: true,
                validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars long': null,
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    print(username);
                    print(email);
                    print(password);
                    final signInService = SingUpService();

                    final statusCode =
                    await signInService.signIn(email, username, password);
                    switch (statusCode) {
                      case 201:
                      // Логин прошел успешно, переходим на экран Home
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn(toggleView: widget.toggleView,)),
                        );
                        break;
                      case 400:
                      // Ошибка 400, выводим сообщение об ошибке
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Пользователь с таким email уже существует'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        break;
                      default:
                      // Обработка других статусов ответа
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Упс... Что-то пошло не так ...'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        break;
                    }
                  };
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700]
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color:Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Действие при нажатии на кнопку
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn(toggleView: widget.toggleView,)),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
                child: Text(
                  'Login',
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



