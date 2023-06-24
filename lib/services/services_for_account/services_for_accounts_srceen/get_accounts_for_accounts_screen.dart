import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class GetAccounts {
  List<String> accountNames = [];
  List<String> brokerNames = [];
  List<double> totalSumForAccount = [];
  List<int> accountId = [];

  GetAccounts();

// Получение информации о доли валюты в различных инструментах
  Future <void> getAccounts() async {

    final signInService = SingInService();
    await signInService.getUserId();

    final url = Uri.parse('http://80.90.179.158:9999/accounts/?id=$userid');
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
      print('Список счетов -- Успешный ответ при получении списка счетов: ${response.statusCode}');

      // Парсим тело ответа
      Map<String, dynamic> decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      // print(decodedJson);
      List<Map<String, dynamic>> accounts = List<Map<String, dynamic>>.from(decodedJson['accounts_by_user']);
      for (Map<String, dynamic> account in accounts) {
        account.forEach((key, value) {
          accountNames.add(value['account_name']);
          brokerNames.add(value['broker_name']);
          totalSumForAccount.add(double.parse(value['total_volume_by_account_in_RUB'].toStringAsFixed(2)));
          accountId.add(int.parse(key));
        });
      }
    } else {
      // Обработка ошибки
      print('Список счетов -- Ошибка при получении списка счетов: ${response.statusCode}');
    }
    // print(accountNames);
    // print(brokerNames);
    // print(accountId);
  }

  Future <void> getAccountsForCalculator() async {

    final signInService = SingInService();
    await signInService.getUserId();

    final url = Uri.parse('http://80.90.179.158:9999/accounts/?id=$userid');
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
      print('Список счетов для калькулятора -- Успешный ответ при получении списка счетов для калькулятора: ${response.statusCode}');

      // Парсим тело ответа
      Map<String, dynamic> decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      // print(decodedJson);
      List<Map<String, dynamic>> accounts = List<Map<String, dynamic>>.from(decodedJson['accounts_by_user']);
      for (Map<String, dynamic> account in accounts) {
        account.forEach((key, value) {
          accountNames.add(value['account_name']);
          accountId.add(int.parse(key));
        });
      }
    } else {
      // Обработка ошибки
      print('Список счетов -- Ошибка при получении списка счетов для калькулятора: ${response.statusCode}');
    }
    // print(accountNames);
    // print(brokerNames);
    // print(accountId);
  }
}

