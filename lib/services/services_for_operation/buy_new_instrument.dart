import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts_list.dart';

class BuyNewInstrumentsFromSearch {
  List<String> secid = [];
  List<String> shortname = [];
  List<String> group = [];
  List<String> engine = [];
  List<String> market = [];
  List<double> last_price = [];
  List<String> CURRENCYID = [];

  BuyNewInstrumentsFromSearch();

  Future<void> getNewInstrumentsListForSearch(String instrumentName) async {
    final url = Uri.parse(
        'https://iss.moex.com/iss/securities.json?group_by=type&securities.columns=secid,shortname,group&q=$instrumentName&iss.meta=off');
    final headers = {
      'Accept': 'application/json',
      'Accept-Encoding': 'gzip, deflate',
      'Cookie': 'MPTrack=4e53d78a.5fe64a8cbdb58; MicexTrackID=7794c8c1.5fe06209d64af'
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      print('Список инструментов счёта -- Успешный ответ при получении списка инструментов по счёту из поиска: ${response.statusCode}');

      Map<dynamic, dynamic> decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      Map<dynamic, dynamic> securities = decodedJson['securities'];
      List<String> columns = List<String>.from(securities['columns']);
      List<List<dynamic>> data = List<List<dynamic>>.from(securities['data']);

      for (List<dynamic> item in data) {
        String itemSecid = item[columns.indexOf('secid')];
        String itemShortname = item[columns.indexOf('shortname')];
        String itemGroup = item[columns.indexOf('group')];

        secid.add(itemSecid);
        shortname.add(itemShortname);
        group.add(itemGroup);

        List<String> groupParts = itemGroup.split('_');
        engine.add(groupParts.first);
        market.add(groupParts.last);

        await getNewInstrumentsPriceListForSearch(engine.last, market.last, secid.last);
      }

      print("secid: $secid");
      print('shortname: $shortname');
      print('engine: $engine');
      print('market: $market');
      print('last_price: $last_price');
      print('CURRENCYID: $CURRENCYID');
    } else {
      print('Список инструментов счёта -- Ошибка при получении списка инструментов по счёту из поиска: ${response.statusCode}');
    }
  }

  Future<void> getNewInstrumentsPriceListForSearch(String engine, String market, String secid) async {
    final url = Uri.parse(
        'https://iss.moex.com/iss/engines/$engine/markets/$market/securities/$secid/.json?iss.meta=off');
    final headers = {
      'Accept': 'application/json',
      'Accept-Encoding': 'gzip, deflate',
      'Cookie': 'MPTrack=4e53d78a.5fe64a8cbdb58; MicexTrackID=7794c8c1.5fe06209d64af'
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      print('Список инструментов счёта -- Успешный ответ при получении списка последней цены инструментов по счёту из поиска: ${response.statusCode}');

      Map<dynamic, dynamic> decodedJson = jsonDecode(utf8.decode(response.bodyBytes));
      Map<dynamic, dynamic> marketdata = decodedJson['marketdata'];
      List<String> columns = List<String>.from(marketdata['columns']);
      List<List<dynamic>> data = List<List<dynamic>>.from(marketdata['data']);

      for (List<dynamic> item in data) {
        int lastValueIndex = columns.indexOf('LASTVALUE');
        int lastIndex = columns.indexOf('LAST');

        dynamic itemLastPrice;
        if (lastValueIndex != -1) {
          itemLastPrice = item[lastValueIndex];
        } else if (lastIndex != -1) {
          itemLastPrice = item[lastIndex];
        } else {
          itemLastPrice = 0.0;
        }


        double itemLastPriceDouble = itemLastPrice != null ? itemLastPrice.toDouble() : 0.0;
        last_price.add(itemLastPriceDouble);
      }


      Map<dynamic, dynamic> securities = decodedJson['marketdata'];
      List<String> columnsSecurities = List<String>.from(securities['columns']);
      List<List<dynamic>> dataSecurities = List<List<dynamic>>.from(securities['data']);
      for (List<dynamic> item in dataSecurities) {

        int lastCurrencyIndex = columnsSecurities.indexOf('CURRENCYID');
        String itemCurrencyId = ''; // Изменение #2: Установить значение по умолчанию

        if (lastCurrencyIndex != -1) {
          dynamic lastCurrencyValue = item[lastCurrencyIndex];
          if (lastCurrencyValue is String) {
            itemCurrencyId = lastCurrencyValue;
          }
        }
        CURRENCYID.add(itemCurrencyId);
      }
    } else {
      print('Список инструментов счёта -- Ошибка при получении списка последней цены инструментов по счёту из поиска: ${response.statusCode}');
    }
  }

  // Метод покупки нового инструмента
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
