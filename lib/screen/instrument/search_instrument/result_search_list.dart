import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/instrument/buy_sell_instrument_screen/buy_new_instrument.dart';
import 'package:mobile_app_diplom/services/services_for_operation/buy_new_instrument.dart';

class ResultSearchList extends StatefulWidget {
  const ResultSearchList({Key? key,
    required this.toggleView,
    required this.SearchRequest,
    required this.AccountIdForDetails,
    required this.AccountNameForDetails,
    required this.BrokerNameForDetails}) : super(key: key);

  // Данные о счёте
  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;



  final String SearchRequest;
  final Function toggleView;

  @override
  State<ResultSearchList> createState() => _ResultSearchListState();
}

class _ResultSearchListState extends State<ResultSearchList> {

  // Для запроса добавления инструмента
  List<int> startInstrumentId = [];
  List<int> startTotalQuantity = [0];
  List<double> startAvgPrice = [0.0];
  List<int> startCurrencyid = [0];
  List<String> startCurrencyName = ['0'];
  List<int> startInstrumentTypeId = [0];
  List<String> startInstrumentTypeName = ['0'];

  // С Московской биржы
  List<String> startInstrumentNames = ['0'];
  List<String> startSecid = [];
  List<String> startEngine = [];
  List<String> startMarket = [''];
  List<String> startGroup = [];
  List<double> startLastPrice = [0.0];

  String utf8RUB = '\u20BD';
  String utf8USD = '\u0024';
  String utf8CHY = '\u00A5';
  String utf8HKD = '\u0024';
  String utf8EUR = '\u20AC';

  Future<void> getNewInstrumentsList() async {
    BuyNewInstrumentsFromSearch instance = BuyNewInstrumentsFromSearch();
    await instance.getNewInstrumentsListForSearch(widget.SearchRequest);
    setState(() {
      int endIndex = instance.shortname.length > 10 ? 10 : instance.shortname.length;
      startInstrumentNames = instance.shortname.sublist(0, endIndex);
      startSecid = instance.secid.sublist(0, endIndex);
      startEngine = instance.engine.sublist(0, endIndex);
      startMarket = instance.market.sublist(0, endIndex);
      startGroup = instance.group.sublist(0, endIndex);
      startLastPrice = instance.last_price.isNotEmpty ? instance.last_price.sublist(0, endIndex) : List.filled(endIndex, 0.0);
    });
  }

  String getCurrencySymbol(String currency) {
    switch (currency) {
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

  String formatAvgPrice(double avgPrice) {
    if (avgPrice.toStringAsFixed(2).startsWith('0.')) {
      return avgPrice.toStringAsFixed(5);
    } else {
      return avgPrice.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: startSecid.length,
          itemBuilder: (context, index) {
            if (startInstrumentNames[index] == 'RUB') {
              return SizedBox.shrink();
            }

            String currencySymbol = getCurrencySymbol(startGroup[index]);
            String formattedAvgPrice = formatAvgPrice(startLastPrice[index]);
            return Column(
              children: [
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        startInstrumentNames[index],
                        style: TextStyle(
                          color: ColorsClass.getFrontForNotPressedButton(),
                          fontSize: 20,
                        ),
                      ),
                      if (startMarket[index] == 'currency_selt')
                        Text(
                          '0 $currencySymbol',
                          style: TextStyle(
                            color: ColorsClass.getFrontForNotPressedButton(),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else
                        Text(
                          '$formattedAvgPrice $utf8RUB',
                          style: TextStyle(
                            color: ColorsClass.getFrontForNotPressedButton(),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                  subtitle: startMarket[index] == 'currency_selt'
                      ? null
                      : Text(
                    '',
                    style: TextStyle(
                      color: ColorsClass.getFrontForNotPressedButton(),
                    ),
                  ),
                  onTap: () {
                    //setGlobalInstrumentId(startInstrumentId[index]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyNewInstrument(
                          toggleView: widget.toggleView,
                          //instrumentId: startInstrumentId[index],
                          InstrumentName: startInstrumentNames[index],
                          //TotalQuantity: startTotalQuantity[index],
                          AvgPrice: startLastPrice[index],
                          // CurrencyId: startCurrencyid[index],
                          // CurrencyName: startCurrencyName[index],
                          // instrumentTypeId: startInstrumentTypeId[index],
                          // InstrumentTypeName: startInstrumentTypeName[index],

                          AccountIdForDetails: widget.AccountIdForDetails,
                          AccountNameForDetails: widget.AccountNameForDetails,
                          BrokerNameForDetails: widget.BrokerNameForDetails,
                        ),
                      ),
                    );
                  },
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
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getNewInstrumentsList();
    //print(getNewInstrumentsList());
    //print('Введённая бумага: ${widget.searchRequest}');
  }
}
