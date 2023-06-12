import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts_list.dart';

class InstrumentsList {
  List<String> instrumentNames = [];
  List<int> totalQuantity = [];
  List<double> avgPrice = [];
  List<String> currencyName = [];
  List<String> instrumentTypeName = [];

  InstrumentsList();

  Future<void> getInstrumentsList() async {
    final url = Uri.parse('http://80.90.179.158:9999/intruments/total_instruments_by_account_id/$GlobalAccountId');
    final headers = {
      'Accept': 'application/json',
      'Accept-Encoding': 'gzip, deflate',
      'Accept-Language': 'ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7'
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {

      print('Список инструментов счёта -- Успешный ответ при получении списка инструментов по счёту: ${response.statusCode}');

      Map<String, dynamic> decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      List<Map<String, dynamic>> instrumentsByAccount =
      List<Map<String, dynamic>>.from(decodedJson['instruments_by_account']);

      for (Map<String, dynamic> account in instrumentsByAccount) {
        account.forEach((key, value) {
          instrumentNames.add(key);
          totalQuantity.add(value['total_quantity']);
          avgPrice.add(value['avg_price'].toDouble());
          currencyName.add(value['currency_name']);
          instrumentTypeName.add(value['instrument_type_name']);
        });
      }
    } else {
      print('Список инструментов счёта -- Ошибка при получении списка инструментов по счёту: ${response.statusCode}');
    }
  }
}
