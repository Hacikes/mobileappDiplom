import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts_list.dart';
import 'dart:convert';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class FreeCashInRUB {
  double freeCash = 0.0;
  // Символ рубля в utf8
  String utf8RUB = '\u20BD';
  // int? userId ;
  FreeCashInRUB();



// Получение информации о том, сколько всего денег на брокерских счетах у пользователя
  Future <void> getFreeCashInRUB() async {

    // final signInService = SingInService();
    // await signInService.getUserId();

    final url = Uri.parse('http://80.90.179.158:9999/intruments/$GlobalAccountId/total_value_for_instrument_type_id');
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
      print('Список инструментов счёта --- Успешный ответ при получении свободного количества денег для счёта: ${response.statusCode}');

      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      //print(decodedJson);
      freeCash = decodedJson['total_value_for_instrument_type_id'];
      // print(freeCash);

    } else {
      // Обработка ошибки
      print('Список инструментов счёта --- Ошибка при получении свободного количества денег для счёта: ${response.statusCode}');
      // print('Успешный ответ: $url');
    }
    // return totalSum;
  }
}

