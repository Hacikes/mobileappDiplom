import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts_list.dart';
import 'dart:convert';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class TotalVolumeCurrencyByAccountInRUB {
  String totalSum ='';
  // Символ рубля в utf8
  String utf8RUB = '\u20BD';
  // int? userId ;
  TotalVolumeCurrencyByAccountInRUB();



// Получение информации о том, сколько всего денег на брокерских счетах у пользователя
  Future <void> getTotalVolumeCurrencyByAccountInRUB() async {

    // final signInService = SingInService();
    // await signInService.getUserId();

    final url = Uri.parse('http://80.90.179.158:9999/intruments/$GlobalAccountId/total_volume_RUB');
    final headers = {
      'Accept': 'application/json',
      'Accept-Encoding': 'gzip, deflate',
      'Accept-Language': 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7'
      };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // Обработка успешного ответа
      // print('Успешный ответ: ${response.headers}');
      // print('Успешный ответ: ${response.body}');
      // print('Успешный ответ: $url');
      print('Счёт --- Успешный ответ при получении общего количества денег для счёта: ${response.statusCode}');

      // Получение из ответа totalSum
      double data = jsonDecode(response.body);
      totalSum = '$data $utf8RUB';

      //totalSum = data['totalVolumeInRUB'].toDouble();
      print('totalSum: $totalSum');
    } else {
      // Обработка ошибки
      print('Счёт --- Ошибка при получении общего количества денег для счёта: ${response.statusCode}');
      // print('Успешный ответ: $url');
      totalSum = "XXX XXX XXX XXX";
    }
    // return totalSum;
  }

  Future <void> getTotalVolumeCurrencyByAccountInRUBParameterAccountId(int AccountIdForCalculator) async {

    // final signInService = SingInService();
    // await signInService.getUserId();

    final url = Uri.parse('http://80.90.179.158:9999/intruments/$AccountIdForCalculator/total_volume_RUB');
    final headers = {
      'Accept': 'application/json',
      'Accept-Encoding': 'gzip, deflate',
      'Accept-Language': 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7'
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // Обработка успешного ответа
      // print('Успешный ответ: ${response.headers}');
      // print('Успешный ответ: ${response.body}');
      // print('Успешный ответ: $url');
      print('Счёт --- Успешный ответ при получении общего количества денег для счёта: ${response.statusCode}');

      // Получение из ответа totalSum
      double data = jsonDecode(response.body);
      totalSum = '$data $utf8RUB';

      //totalSum = data['totalVolumeInRUB'].toDouble();
      //print(totalSum);
    } else {
      // Обработка ошибки
      print('Счёт --- Ошибка при получении общего количества денег для счёта: ${response.statusCode}');
      // print('Успешный ответ: $url');
    }
    // return totalSum;
  }
}

