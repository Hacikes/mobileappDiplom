import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/instrument/add_withdraw_RUB_screen/top_up_account_screen.dart';
import 'package:mobile_app_diplom/screen/instrument/instrument_details_screen/instrument_details_screen.dart';
import 'package:mobile_app_diplom/services/services_for_instrument/get_instruments_on_account/get_list_of_instruments.dart';

int? GlobalInstrumentId;

class ListInstruments extends StatefulWidget {
  const ListInstruments({Key? key, required this.toggleView,
    required this.AccountIdForDetails,
    required this.AccountNameForDetails,
    required this.BrokerNameForDetails}) : super(key: key);

  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;

  final Function toggleView;

  @override
  State<ListInstruments> createState() => _ListInstrumentsState();
}

class _ListInstrumentsState extends State<ListInstruments> {
  List<int> startInstrumentId = [0];
  List<String> startInstrumentNames = ['0'];
  List<int> startTotalQuantity = [0];
  List<double> startAvgPrice = [0.0];
  List<int> startCurrencyid = [0];
  List<String> startCurrencyName = ['0'];
  List<int> startInstrumentTypeId = [0];
  List<String> startInstrumentTypeName = ['0'];



  String utf8RUB = '\u20BD';
  String utf8USD = '\u0024';
  String utf8CHY = '\u00A5';
  String utf8HKD = '\u0024';
  String utf8EUR = '\u20AC';

  Future<void> getListInstruments() async {
    InstrumentsList instance = InstrumentsList();
    await instance.getInstrumentsList();
    setState(() {
      startInstrumentId = instance.instrumentId;
      startInstrumentNames = instance.instrumentNames;
      startTotalQuantity = instance.totalQuantity;
      startAvgPrice = instance.avgPrice;
      startCurrencyid = instance.currencyId;
      startInstrumentTypeId = instance.instrumentTypeId;
      startCurrencyName = instance.currencyName;

      startInstrumentTypeName = instance.instrumentTypeName;
    });
  }

  // Функция записывающая instrument_id в глобальную переменную
  void setGlobalInstrumentId(int value) {
    GlobalInstrumentId = value;
    // print(GlobalInstrumentId);
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
          itemCount: startInstrumentId.length,
          itemBuilder: (context, index) {
            if (startInstrumentNames[index] == 'RUB') {
              return SizedBox.shrink();
            }

            String currencySymbol = getCurrencySymbol(startCurrencyName[index]);
            String formattedAvgPrice = formatAvgPrice(startAvgPrice[index]);
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
                      if (startInstrumentTypeName[index] == 'Валюта')
                        Text(
                          '${startTotalQuantity[index]} $currencySymbol',
                          style: TextStyle(
                            color: ColorsClass.getFrontForNotPressedButton(),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else
                        Text(
                          '$formattedAvgPrice $currencySymbol',
                          style: TextStyle(
                            color: ColorsClass.getFrontForNotPressedButton(),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                  subtitle: startInstrumentTypeName[index] == 'Валюта'
                      ? null
                      : Text(
                    '${startTotalQuantity[index]} шт',
                    style: TextStyle(
                      color: ColorsClass.getFrontForNotPressedButton(),
                    ),
                  ),
                  onTap: () {
                    setGlobalInstrumentId(startInstrumentId[index]);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => instrumentDetailsScreen(
                          toggleView: widget.toggleView,
                          instrumentId: startInstrumentId[index],
                          instrumentNames: startInstrumentNames[index],
                          totalQuantity: startTotalQuantity[index],
                          avgPrice: startAvgPrice[index],
                          currencyId: startCurrencyid[index],
                          currencyName: startCurrencyName[index],
                          instrumentTypeId: startInstrumentTypeId[index],
                          instrumentTypeName: startInstrumentTypeName[index],
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
    getListInstruments();
  }
}
