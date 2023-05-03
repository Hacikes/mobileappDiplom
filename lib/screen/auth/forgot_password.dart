import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/auth/sigh_in.dart';
import 'package:mobile_app_diplom/screen/auth/sign_up.dart';

import '../../services/sign_in.dart';

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
  String password = '';
  String repeatPassword = '';

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
                'Password recovery',
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
                validator: (val) => val!.isEmpty ? 'Enter email': null,
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
                validator: (val) => val!.isEmpty ? 'Enter password': null,
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    repeatPassword = value;
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
                  hintText: 'Repeat password',
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                validator: (val) => val!.isEmpty ? 'Enter repeat password': null,
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    // print(email);
                    // print(password);
                    // print(repeatPassword);
                    final signInService = SingInService();
                    //await signInService.getUserId();
                    final statusCode =
                    await signInService.signIn(email, password);
                    switch (statusCode) {
                      case 200 :
                      // Логин прошел успешно, переходим на экран Home
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn(toggleView: widget.toggleView,)),
                        );
                        break;
                      case 400:
                      // Ошибка 400, выводим сообщение об ошибке
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Пользователя с указанной почтой не существует'),
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
                  'Recovery password',
                  style: TextStyle(color:Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Действие при нажатии на кнопку
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn(toggleView: widget.toggleView,)),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                ),
                child: Text(
                  'Sign In',
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
