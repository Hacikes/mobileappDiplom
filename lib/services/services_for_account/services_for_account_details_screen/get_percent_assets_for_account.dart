import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts_list.dart';
import 'dart:convert';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class TypeOfCurrencyInstrumentsPercentByAccount {
  List<String> keys = [];
  List<double> values = [];

  TypeOfCurrencyInstrumentsPercentByAccount();

// Получение информации о доли валюты в различных инструментах
  Future <void> getTypeOfCurrencyInstrumentsPercentByAccount() async {

    // final signInService = SingInService();
    // await signInService.getUserId();

    final url = Uri.parse('http://80.90.179.158:9999/intruments_volume/$GlobalAccountId/percent_by_instrument_type');
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
      print('Хомяк-Активы -- Успешный ответ при получении доли активов для пользователя: ${response.statusCode}');

      // Парсим тело ответа
      Map<String, dynamic> decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      // print(decodedJson);

      List<dynamic> percentCurrencyOnAllInstruments = decodedJson['percent_by_instrument_type'];
      print('percent_by_instrument_type: ${percentCurrencyOnAllInstruments}');

      for (Map<String, dynamic> assets in percentCurrencyOnAllInstruments) {
        assets.forEach((key, value) {
          keys.add(key);
          if (value is double) {
            values.add(double.parse(value.toStringAsFixed(2))); // Ограничение до трех знаков после запятой
          } else if (value is int) {
            values.add(value.toDouble());
          }
        });
      }
      // print('Ключи: ${keys}');
      // print('Значения: ${values}');
    } else {
      // Обработка ошибки
      print('Хомяк-Активы -- Ошибка при получении доли активов для пользователя: ${response.statusCode}');
      // print('Успешный ответ: $url');
    }
    // return totalSum;
  }
}

