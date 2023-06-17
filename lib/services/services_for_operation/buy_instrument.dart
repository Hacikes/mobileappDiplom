import 'package:http/http.dart' as http;
import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts_list.dart';
import 'dart:convert';

import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';


class BuySellInstrumentService {

  Future<int> buyInstrument(
      String instrument_name, double price, int currency_id, int quantity, int instrument_type_id) async {
    const String figi = 'XXX';
    const int buyOperation = 1;
    final int? account_id = GlobalAccountId;
    final url = Uri.parse('http://80.90.179.158:9999/intruments/$GlobalAccountId');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      'instrument_name': instrument_name,
      'price': price,
      'currency_id': currency_id,
      'quantity': quantity,
      'figi': figi,
      'instrument_type_id': instrument_type_id,
      'account_id': account_id,
      'operation_type_id': buyOperation,
    });
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Обработка успешного ответа
      // print('Успешный ответ: ${url}');
      // print('Успешный ответ: ${response.headers}');
      // print('Успешный ответ: ${response.body}');
      print('Успешный ответ при покупке инструмента: ${response.statusCode}');
    } else {
      // Обработка ошибки
      print('Ошибка при покупке инструмента: ${response.statusCode}');
      // print('Успешный ответ: ${url}');
      // print('Успешный ответ: ${headers}');
      // print('Успешный ответ: ${body}');
    }
    return response.statusCode;
  }

  Future<int> sellInstrument(
      String instrument_name, double price, int currency_id, int quantity, int instrument_type_id) async {
    const String figi = 'XXX';
    const int buyOperation = 2;
    final int? account_id = GlobalAccountId;
    final url = Uri.parse('http://80.90.179.158:9999/intruments/$GlobalAccountId');
    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      'instrument_name': instrument_name,
      'price': price,
      'currency_id': currency_id,
      'quantity': quantity,
      'figi': figi,
      'instrument_type_id': instrument_type_id,
      'account_id': account_id,
      'operation_type_id': buyOperation,
    });
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Обработка успешного ответа
      // print('Успешный ответ: ${url}');
      // print('Успешный ответ: ${response.headers}');
      // print('Успешный ответ: ${response.body}');
      print('Успешный ответ при продаже инструмента: ${response.statusCode}');
    } else {
      // Обработка ошибки
      print('Ошибка при продаже инструмента: ${response.statusCode}');
      // print('Успешный ответ: ${url}');
      // print('Успешный ответ: ${headers}');
      // print('Успешный ответ: ${body}');
    }
    return response.statusCode;
  }
}