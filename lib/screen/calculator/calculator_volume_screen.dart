import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/calculator/buttons_change_calculator_screen/botton_calculator_volume.dart';
import 'package:mobile_app_diplom/screen/calculator/free_cash_by_account_for_calculator.dart';
import 'package:mobile_app_diplom/screen/drawer/drawer.dart';
import 'package:mobile_app_diplom/screen/instrument/instruments_on_account_screen/instruments_on_account_screen.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_account_details_screen/get_total_volume_currency_in_RUB_for_account.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_accounts_srceen/get_accounts_for_accounts_screen.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_currency_screen/get_total_volume_currency_in_RUB.dart';

// Экран калькулятора Покупка количество
class CalculatorInputCountScreen extends StatefulWidget {
  CalculatorInputCountScreen({
    Key? key,
    required this.toggleView,
  }) : super(key: key);

  final Function toggleView;

  @override
  State<CalculatorInputCountScreen> createState() => _CalculatorInputCountScreenState();
}

class _CalculatorInputCountScreenState extends State<CalculatorInputCountScreen> {
  final _formKey = GlobalKey<FormState>();

  String formatValue(double value) {
    if (value == 0 || value >= 10) {
      return value.toStringAsFixed(2);
    } else {
      return value.toStringAsFixed(5);
    }
  }

  int TotalQuantity = 0;
  double AvgPrice = 0.0;
  double VolumeInstrument = 0.0;
  double startPercentForUser = 0.0;
  double startPercentForAccount = 0.0;

  List<String> accountNames = [];
  List<String> brokerNames = [];
  List<int> accountId = [];
  int accountIdIndex = 0;

  double totalVolumeForUser = 0;
  double totalVolumeForAccount = 0;

  Future<void> getAccountNameAndIdForCalculator() async {
    GetAccounts instance = GetAccounts();
    await instance.getAccounts();
    setState(() {
      accountNames = instance.accountNames;
      accountId = instance.accountId;
      brokerNames = instance.brokerNames;
      if (accountId.isNotEmpty) {
        accountIdIndex = accountId[0];
        // print(accountId);
        // print(accountIdIndex);
        // print(accountNames[accountId.indexOf(accountIdIndex)]);
        // print(brokerNames[accountId.indexOf(accountIdIndex)]);
      }
    });
  }

  Future<void> setupTotalVolumeByAccount() async {
    TotalVolumeCurrencyByAccountInRUB instance = TotalVolumeCurrencyByAccountInRUB();
    await instance.getTotalVolumeCurrencyByAccountInRUBParameterAccountId(accountIdIndex);
    // print(instance.totalSum);
    String totalSum = instance.totalSum.replaceAll(RegExp(r'[^0-9\.]'), '');
    double parsedTotalSum = double.tryParse(totalSum) ?? 0.0;
    setState(() {
      totalVolumeForAccount = parsedTotalSum;
      // print(totalVolumeForAccount);
    });
  }


  Future<void> setupTotalVolumeByUser() async {
    TotalVolumeCurrencyInRUB instance = TotalVolumeCurrencyInRUB();
    await instance.getTotalVolumeCurrencyInRUB();
    String totalSum = instance.totalSum; // "2342000.3 ₽"
    String numericValue = totalSum.replaceAll(RegExp(r'[^\d.]'), ''); // "2342000.3"
    double parsedValue = double.tryParse(numericValue) ?? 0.0; // 2342000.3
    setState(() {
      totalVolumeForUser = parsedValue;
      // print(totalVolumeForUser);
    });
  }


// Вводимые при регистрации поля
  double inputPrice = 1.0;
  int inputCount = 0;
  double getTotalCost() {
    return inputPrice * inputCount;
  }

  // int getTotalQuantity() {
  //   return TotalQuantity + inputCount;
  // }

  double getTotalPercentForAccount(){
    return ((inputPrice * inputCount)/totalVolumeForAccount) * 100;
  }

  double getTotalPercentForUser(){
    return ((inputPrice * inputCount)/totalVolumeForUser) * 100;
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await getAccountNameAndIdForCalculator();
    await setupTotalVolumeByAccount();
    await setupTotalVolumeByUser();
  }

  @override
  Widget build(BuildContext context) {
    String avgPriceText;
    if (AvgPrice.toStringAsFixed(0) == '0') {
      avgPriceText = AvgPrice.toStringAsFixed(5);
    } else {
      avgPriceText = AvgPrice.toStringAsFixed(2);
    }
    return Scaffold(
      backgroundColor: ColorsClass.getBackgroundForSrceen(),
      appBar: AppBar(
        title: Text("Калькулятор"),
        backgroundColor: ColorsClass.getBackgroundForAppbar(),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        actions: const <Widget>[],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  BottomBuyCalculatorVolume(toggleView: widget.toggleView,),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField<int>(
                    value: accountIdIndex,
                    items: List<DropdownMenuItem<int>>.generate(
                      accountNames.length,
                          (index) => DropdownMenuItem<int>(
                        value: accountId[index],
                        child: Text(accountNames[index]),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        accountIdIndex = value ?? 0;
                        setupTotalVolumeByAccount();
                        // print(accountNames[accountId.indexOf(accountIdIndex)]);
                        // print(brokerNames[accountId.indexOf(accountIdIndex)]);
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorsClass.getBorderDecorationColor()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorsClass.getBorderDecorationColor()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: ColorsClass.getFrontForHintOnField(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        inputPrice = double.tryParse(value) ?? 0.0;
                      });
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[\d.]+$')),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorsClass.getBorderDecorationColor()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorsClass.getBorderDecorationColor()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Стоимость за штуку',
                      filled: true,
                      fillColor: ColorsClass.getFrontForHintOnField(),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Введите стоимость за штуку';
                      } else if (!RegExp(r'^\d+$').hasMatch(val)) {
                        if (!RegExp(r'^[0-9]+\.[0-9]+$').hasMatch(val)) {
                          return 'Для ввода доступны цифры и точка';
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        inputCount = int.tryParse(value) ?? 0;
                      });
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d+$')),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorsClass.getBorderDecorationColor()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorsClass.getBorderDecorationColor()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Количество',
                      filled: true,
                      fillColor: ColorsClass.getFrontForHintOnField(),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Введите количество';
                      } else if (!RegExp(r'^[0-9]+$').hasMatch(val)) {
                        return 'Для ввода доступны цифры';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Стоимость: ',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: ColorsClass.getFrontForHeaderText(),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '${getTotalCost().toStringAsFixed(2)} у.е.',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: ColorsClass.getFrontForHeaderText(),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  // Text(
                  //   'Количество: ${getTotalQuantity()} шт',
                  //   style: TextStyle(
                  //     fontSize: 24.0,
                  //     color: ColorsClass.getFrontForHeaderText(),
                  //   ),
                  //   textAlign: TextAlign.left,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Процент от счёта',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: ColorsClass.getFrontForHeaderText(),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '${formatValue(getTotalPercentForAccount())} %',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: ColorsClass.getFrontForHeaderText(),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Процент от \n'
                            'всех счетов',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: ColorsClass.getFrontForHeaderText(),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        '${formatValue(getTotalPercentForUser())} %',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: ColorsClass.getFrontForHeaderText(),
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListOfInstruments(
                            toggleView: widget.toggleView,
                            AccountIdForDetails: accountIdIndex,
                            AccountNameForDetails: accountNames[accountId.indexOf(accountIdIndex)],
                            BrokerNameForDetails: brokerNames[accountId.indexOf(accountIdIndex)],
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsClass
                          .getBackgroundForBuyButton(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(double.infinity, 40),
                    ),
                    child: Text(
                      'Добавить',
                      style: TextStyle(
                        color: ColorsClass.getFrontForNotPressedButton(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          free_cash_panel_for_calculator(toggleView: widget.toggleView, AccountIdForCalculator: accountIdIndex,)
        ],
      ),
      drawer: DrawerFull(context: this.context),
    );
  }}