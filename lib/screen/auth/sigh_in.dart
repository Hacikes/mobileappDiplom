import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/auth/sign_up.dart';
import 'package:mobile_app_diplom/services/sign_in.dart';

import 'package:mobile_app_diplom/screen/auth/forgot_password.dart';
import '../home/home_currency.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();


  // Получаемые при логине поля
  String email = '';
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
                'Login',
                style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0,),
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
                validator: (val) => val!.isEmpty ? 'Enter password': null,
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    // print(email);
                    // print(password);
                    final signInService = SingInService();
                    final statusCode =
                    await signInService.signIn(email, password);
                    switch (statusCode) {
                      case 200:
                      // Логин прошел успешно, переходим на экран Home
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                        break;
                      case 400:
                      // Ошибка 400, выводим сообщение об ошибке
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Неверный логин или пароль'),
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
                    await signInService.getUserId();
                  };
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword(toggleView: widget.toggleView,)),
                  );
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp(toggleView: widget.toggleView,)),
                  );
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



