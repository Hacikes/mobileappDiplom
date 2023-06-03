import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class AddAccountService {

  Future<int> addAccount(String account_name, String broker_name, int accountId) async {
    final url = Uri.parse('http://80.90.179.158:9999/accounts/$accountId');
    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      'account_name': account_name,
      'broker_name': broker_name,
      'user_id': userid,
    });
    final response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Обработка успешного ответа
      // print('Успешный ответ: ${response.headers}');
      // print('Успешный ответ: ${response.body}');
      print('Успешный ответ при создании счёта: ${response.statusCode}');
    } else {
      // Обработка ошибки
      print('Ошибка при создании счёта: ${response.statusCode}');
    }
    return response.statusCode;
  }
}