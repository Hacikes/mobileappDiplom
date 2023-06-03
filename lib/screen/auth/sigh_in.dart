import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/auth/sign_up.dart';
import 'package:mobile_app_diplom/screen/home/home_screen_with_diagrams/home_currency.dart';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';
import 'package:mobile_app_diplom/screen/auth/forgot_password.dart';


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
      backgroundColor: ColorsClass.getBackgroundForSrceen(),
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
                'Вход',
                style: TextStyle(
                  fontSize: 36.0,
                  color: ColorsClass.getFrontForNotPressedButton(),
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
                    borderSide: BorderSide(color: ColorsClass.getBorderDecorationColor()),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsClass.getBorderDecorationColor()),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Почта',
                  filled: true,
                  fillColor: ColorsClass.getFrontForHintOnField(),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Введите почту';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
                    return 'Введите почту в формате user@usermail.ru';
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
                    borderSide: BorderSide(color: ColorsClass.getBorderDecorationColor()),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsClass.getBorderDecorationColor()),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Пароль',
                  filled: true,
                  fillColor: ColorsClass.getFrontForHintOnField(),
                ),
                obscureText: true,
                validator: (val) => val!.isEmpty ? 'Введите пароль': null,
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
                          MaterialPageRoute(builder: (context) => Home(toggleView: widget.toggleView,)),
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
                    backgroundColor: ColorsClass.getBackgroundForNotPressedButton(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  minimumSize: Size(double.infinity, 40),
                ),
                child: Text(
                  'Войти',
                  style: TextStyle(color:ColorsClass.getFrontForNotPressedButton()),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Действие при нажатии на кнопку
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgotPassword(toggleView: widget.toggleView,)),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
                child: Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    color: ColorsClass.getFrontForNotPressedButton(),
                    fontSize: 14.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  // Действие при нажатии на кнопку
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp(toggleView: widget.toggleView,)),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
                child: Text(
                  'Создать аккаунт',
                  style: TextStyle(
                    color: ColorsClass.getFrontForNotPressedButton(),
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



