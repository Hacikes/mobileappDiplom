import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';
import 'package:mobile_app_diplom/services/services_for_instrument/get_instrument_percent_for_account_and_user/get_instrument_percent_for_account_and_user.dart';

class instrumentDetailsScreen extends StatefulWidget {
  const instrumentDetailsScreen({
    Key? key,
    required this.toggleView,
    required this.instrumentId,
    required this.instrumentNames,
    required this.totalQuantity,
    required this.avgPrice,
    required this.currencyName,
    required this.instrumentTypeName,
  }) : super(key: key);

  final int instrumentId;
  final String instrumentNames;
  final int totalQuantity;
  final double avgPrice;
  final String currencyName;
  final String instrumentTypeName;

  final Function toggleView;

  @override
  State<instrumentDetailsScreen> createState() => _instrumentDetailsScreenState();
}

class _instrumentDetailsScreenState extends State<instrumentDetailsScreen> {
  double startPercentForUser = 0.0;
  double startPercentForAccount = 0.0;

  String utf8RUB = '\u20BD';
  String utf8USD = '\u0024';
  String utf8CHY = '\u00A5';
  String utf8HKD = '\u0024';
  String utf8EUR = '\u20AC';

  String getCurrencySymbol(String currencyName) {
    switch (currencyName) {
      case 'RUB':
        return utf8RUB;
      case 'USD':
        return utf8USD;
      case 'CHY':
        return utf8CHY;
      case 'HKD':
        return utf8HKD;
      case 'EUR':
        return utf8EUR;
      default:
        return '';
    }
  }

  String getCountryName(String currencyName) {
    switch (currencyName) {
      case 'RUB':
        return 'Россия';
      case 'USD':
        return 'США';
      case 'CHY':
        return 'Китай';
      case 'HKD':
        return 'Гонконг';
      case 'EUR':
        return 'Европа';
      default:
        return '';
    }
  }

  Future<void> getInstrumentPercentForUserAndAccount() async {
    InstrumentsPercentForUserAndAccount instance = InstrumentsPercentForUserAndAccount();
    await instance.getInstrumentsPercentForUser(widget.instrumentNames);
    await instance.getInstrumentsPercentForAccount(widget.instrumentNames);
    setState(() {
      startPercentForUser = instance.values[0];
      startPercentForAccount = instance.values1[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    String currencySymbol = getCurrencySymbol(widget.currencyName);
    String countryName = getCountryName(widget.currencyName);

    dynamic displayValue = widget.avgPrice;
    bool isCurrency = widget.instrumentTypeName == 'Валюта';

    if (isCurrency) {
      displayValue = widget.totalQuantity;
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: ColorsClass.getBackgroundForSrceen(),
        appBar: AppBar(
          title: Text(widget.instrumentNames),
          backgroundColor: ColorsClass.getBackgroundForAppbar(),
          elevation: 0.0,
          automaticallyImplyLeading: true,
          actions: const <Widget>[],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 10.0, 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$displayValue ${isCurrency ? '$currencySymbol' : '$currencySymbol'}',
                    style: TextStyle(
                      fontSize: 36.0,
                      color: ColorsClass.getFrontForHeaderText(),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  if (!isCurrency) Text(
                    'Средневзвешенное значение',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: ColorsClass.getFrontForHeaderText(),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1,
              child: Divider(
                color: ColorsClass.color_for_devider,
                thickness: 1,
                indent: 16,
                endIndent: 16,
              ),
            ),
            if (!isCurrency && widget.instrumentNames != 'RUB') ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Страна',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: ColorsClass.getFrontForHeaderText(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      countryName,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: ColorsClass.getFrontForHeaderText(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Количество',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: ColorsClass.getFrontForHeaderText(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '${widget.totalQuantity} шт',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: ColorsClass.getFrontForHeaderText(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
            if (isCurrency && widget.instrumentNames != 'RUB') ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Средневзвешенное\nзначение',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: ColorsClass.getFrontForHeaderText(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '${widget.avgPrice} ${utf8RUB}',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: ColorsClass.getFrontForHeaderText(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Процент от счёта',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: ColorsClass.getFrontForHeaderText(),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${startPercentForAccount} %',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: ColorsClass.getFrontForHeaderText(),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Процент от \n'
                        'всех счетов',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: ColorsClass.getFrontForHeaderText(),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${startPercentForUser} %',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: ColorsClass.getFrontForHeaderText(),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getInstrumentPercentForUserAndAccount();
  }
}
