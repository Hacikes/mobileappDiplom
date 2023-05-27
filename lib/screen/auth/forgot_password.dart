import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/auth/sigh_in.dart';
import 'package:mobile_app_diplom/screen/auth/sign_up.dart';
import 'package:mobile_app_diplom/services/services_for_auth/forgot_password.dart';
import '../../services/services_for_auth/sign_in.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final _formKey = GlobalKey<FormState>();

  // Получаемые при логине поля
  String email = '';
  // String password = '';
  // String repeatPassword = '';

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
                'Если вы забыли пароль, напишете нам test1232@gmail.com и мы восстановим',
                style: TextStyle(
                  fontSize: 24.0,
                  color: ColorsClass.getFrontForPopUpMessages(),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0,),

              SizedBox(height: 10.0,),
              TextButton(
                onPressed: () {
                  // Действие при нажатии на кнопку
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
                child: Text(
                  'Вход',
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
