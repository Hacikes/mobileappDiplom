import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts_list.dart';
import 'dart:convert';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class TypeOfInstrumentsPercentByAccount {
  List<String> keys = [];
  List<double> values = [];

  TypeOfInstrumentsPercentByAccount();

// Получение информации о доли валюты в различных инструментах
  Future <void> getTypeOfInstrumentsPercentByAccount() async {

    final signInService = SingInService();
    await signInService.getUserId();

    final url = Uri.parse('http://80.90.179.158:9999/intruments_volume/$GlobalAccountId/percent_by_instrument_name');
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
      print('Счёт-Инструменты -- Успешный ответ при получении доли инструментов для счёта: ${response.statusCode}');

      // Парсим тело ответа
      Map<String, dynamic> decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      //print(decodedJson);

      List<dynamic> AllInstruments = decodedJson['percent_for_instrument_name_for_account'];
      //print('percent_by_instrument_type: ${AllInstruments}');

      List<Map<String, dynamic>> shareList = decodedJson['percent_for_instrument_name_for_account']
          .map<Map<String, dynamic>>((item) => <String, dynamic>{item.keys.first: item[item.keys.first]['share']})
          .toList();
      //print(shareList);

      if (shareList.isEmpty) {
        keys = ['XXX'];
        values = [100.0];
      } else {
        for (Map<String, dynamic> instruments in shareList) {
          instruments.forEach((key, value) {
            keys.add(key);
            if (value is double) {
              values.add(double.parse(value.toStringAsFixed(
                  2))); // Ограничение до трех знаков после запятой
            } else if (value is int) {
              values.add(value.toDouble());
            }
          });
        }
      }
      // print('Ключи: ${keys}');
      // print('Значения: ${values}');
    } else {
      // Обработка ошибки
      print('Счёт-Инструменты -- Ошибка при получении доли инструментов для счёта: ${response.statusCode}');
      // print('Успешный ответ: $url');
    }
    // return totalSum;
  }
}

