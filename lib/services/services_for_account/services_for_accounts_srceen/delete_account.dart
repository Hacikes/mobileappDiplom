import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class DeleteAccountService {

  Future<int> deleteAccount(int accountId) async {
    final url = Uri.parse('http://80.90.179.158:9999/accounts/$accountId');
    final headers = {
      'accept': 'application/json',
    };

    final response = await http.delete(url, headers: headers,);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Обработка успешного ответа
      // print('Успешный ответ: ${response.headers}');
      // print('Успешный ответ: ${response.body}');
      print('Успешный ответ при удалении счёта: ${response.statusCode}');
    } else {
      // Обработка ошибки
      print('Ошибка при удалении счёта: ${response.statusCode}');
    }
    return response.statusCode;
  }
}