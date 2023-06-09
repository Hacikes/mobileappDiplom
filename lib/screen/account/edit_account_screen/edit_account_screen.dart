import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts.dart';
import 'package:mobile_app_diplom/screen/auth/sigh_in.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_accounts_srceen/add_account.dart';
import 'package:mobile_app_diplom/services/services_for_auth/sign_up.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key, required this.toggleView, required this.AccountName, required this.brokerName}) : super(key: key);
  final String AccountName;
  final String brokerName;
  final Function toggleView;

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {

  final _formKey = GlobalKey<FormState>();

  // Вводимые при регистрации поля
  String accountName = '';
  String brokerName = '';
  int accountId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.getBackgroundForSrceen(),
      appBar: AppBar(
        title: const Text('Редактирование счёта'),
        backgroundColor: ColorsClass.getBackgroundForAppbar(),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        actions: const <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // SizedBox(height: 200.0,),
              SizedBox(height: 10.0,),
              TextFormField(
                initialValue: widget.AccountName,
                onChanged: (value) {
                  setState(() {
                    accountName = value;
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
                  hintText: 'Наименование счёта',
                  filled: true,
                  fillColor: ColorsClass.getFrontForHintOnField(),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Введите новое наименование счёта';
                  } else if (!RegExp(r'^[a-zA-Z0-9а-яА-я]+$').hasMatch(val)) {
                    return 'Спец. символы в имени не допустимы';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                initialValue: widget.brokerName,
                onChanged: (value) {
                  setState(() {
                    brokerName = value;
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
                  hintText: 'Наименование брокера',
                  filled: true,
                  fillColor: ColorsClass.getFrontForHintOnField(),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Введите новое наименование брокера';
                  } else if (!RegExp(r'^[a-zA-Z0-9а-яА-я]+$').hasMatch(val)) {
                    return 'Спец. символы в имени не допустимы';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    print(accountName);
                    print(brokerName);
                    final addAccountService = AddAccountService();

                    final statusCode =
                    await addAccountService.addAccount(accountName, brokerName);
                    switch (statusCode) {
                      case 200:
                      // Создание счёта прошел успешно, возврат на список счетов
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Accounts(toggleView: widget.toggleView,)),
                        );
                        break;
                      case 400:
                      // Ошибка 400, выводим сообщение об ошибке
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Необходимо заполнить все поля'),
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
                  backgroundColor: ColorsClass.getBackgroundForNotPressedButton(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 40),
                ),
                child: Text(
                  'Сохранить',
                  style: TextStyle(color:ColorsClass.getFrontForNotPressedButton()),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}



