import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class TypeOfCurrencyInstrumentsPercent {
  double type_of_currency_instruments_percent = 0.0;
  TypeOfCurrencyInstrumentsPercent();

// Получение информации о доли валюты в различных инструментах
  Future <void> getTypeOfCurrencyInstrumentsPercent() async {

    final signInService = SingInService();
    await signInService.getUserId();

    final url = Uri.parse('http://80.90.179.158:9999/intruments_volume/$userid/percent_by_instrument_type');
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
      print('Успешный ответ при получении доли валюты в интсрументах для пользователя: ${response.statusCode}');

      // Распарсиваем тело ответа
      final data = jsonDecode(response.body);
      final percentByInstrumentType = List<Map<String, dynamic>>.from(data['percent_by_instrument_type']);
      final typeInstrumentsPercent = percentByInstrumentType.map((item) => item.values.first.toDouble()).toList();
      print(percentByInstrumentType);


    } else {
      // Обработка ошибки
      print('Ошибка при получении доли валюты в интсрументах для пользователя: ${response.statusCode}');
      // print('Успешный ответ: $url');
    }
    // return totalSum;
  }
}

