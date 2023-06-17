import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts_list.dart';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';

class FreeCurrencyOnAccount {
  int totalQuantity = 0;

  FreeCurrencyOnAccount();

  Future<void> getFreeCurrencyOnAccount(String currencyNameParameter) async {
    final url = Uri.parse(
        'http://80.90.179.158:9999/intruments/$GlobalAccountId/free_currency_for_account?currency_name=$currencyNameParameter');
    final headers = {
      'Accept': 'application/json',
      'Accept-Encoding': 'gzip, deflate',
      'Accept-Language': 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7'
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson =
      jsonDecode(utf8.decode(response.bodyBytes));

      List<Map<String, dynamic>> currencyList =
      List<Map<String, dynamic>>.from(decodedJson['free_currency_for_account']);
      if (currencyList.isNotEmpty) {
        currencyList.forEach((currency) {
          currency.forEach((key, value) {
            Map<String, dynamic> currencyData = value;
            totalQuantity = currencyData['total_quantity'];
          });
        });
      }

      print('Успешный ответ при получении свободной валюты: ${response.statusCode}');
    } else {
      print('Ошибка при получении свободной валюты: ${response.statusCode}');
    }
  }
}
