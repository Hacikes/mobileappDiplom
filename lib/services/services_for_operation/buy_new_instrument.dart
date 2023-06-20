import 'package:http/http.dart' as http;
import 'dart:convert';

class BuyNewInstrumentsFromSearch {
  List<String> secid = [];
  List<String> shortname = [];
  List<String> group = [];
  List<String> engine = [];
  List<String> market = [];
  List<double> last_price = [];

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
      Map<dynamic, dynamic> securities = decodedJson['marketdata'];
      List<String> columns = List<String>.from(securities['columns']);
      List<List<dynamic>> data = List<List<dynamic>>.from(securities['data']);

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
    } else {
      print('Список инструментов счёта -- Ошибка при получении списка последней цены инструментов по счёту из поиска: ${response.statusCode}');
    }
  }

}
