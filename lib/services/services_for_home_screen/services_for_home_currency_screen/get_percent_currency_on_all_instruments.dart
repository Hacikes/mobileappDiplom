import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class ShareOfCurrencyInAllInstruments {
  //List<String> share_of_currency_in_all_instruments = [];
  List<String> keys = [];
  List<double> values = [];

  ShareOfCurrencyInAllInstruments();

// Получение информации о доли валюты в различных инструментах
  Future <void> getShareOfCurrencyInAllInstruments() async {
    final signInService = SingInService();
    await signInService.getUserId();

    final url = Uri.parse(
        'http://80.90.179.158:9999/intruments_volume/$userid/percent_currency_on_all_instruments_by_user');
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
      print('Хомяк-Валюта --- Успешный ответ при получении доли валюты в инструментах для пользователя: ${response.statusCode}');

      // Парсим тело ответа
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      //print(decodedJson);
      List<dynamic> percentCurrencyOnAllInstruments = decodedJson['percent_currency_on_all_instruments'];
      //print(percentCurrencyOnAllInstruments);

      for (Map<String, dynamic> currency in percentCurrencyOnAllInstruments) {
        currency.forEach((key, value) {
          keys.add(key);
          //values.add(value);
          if (value is double) {
            values.add(double.parse(value.toStringAsFixed(2))); // Ограничение до трех знаков после запятой
          } else if (value is int) {
            values.add(value.toDouble());
          }
        });
      }

      //print(keys); // ['RUB', 'USD']
      //print(values); // [92.93680297397769, 7.063197026022305]

    } else {
        // Обработка ошибки
        print(
            'Хомяк-Валюта --- Ошибка при получении доли валюты в инструментах для пользователя: ${response
                .statusCode}');
      }
    }
  }