import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/services/services_for_operation/get_free_currency.dart';

class free_cash_panel_for_operation extends StatefulWidget {
   free_cash_panel_for_operation({Key? key, required this.toggleView, required this.currencyName});

  final String currencyName;
  final Function toggleView;

  @override
  State<free_cash_panel_for_operation> createState() => _free_cash_panel_for_operationState();
}

class _free_cash_panel_for_operationState extends State<free_cash_panel_for_operation> {
  int startValueFreeCash = 0;

  Map<String, String> currencySymbols = {
    'RUB': '\u20BD',
    'USD': '\u0024',
    'CHY': '\u00A5',
    'HKD': '\u0024',
    'EUR': '\u20AC',
  };

  String getCurrencySymbol(String currencyName) {
    return currencySymbols[currencyName] ?? '';
  }

  Future<void> setFreeCashForInstrument() async {
    FreeCurrencyOnAccount instance = FreeCurrencyOnAccount();
    await instance.getFreeCurrencyOnAccount(widget.currencyName);
    setState(() {
      startValueFreeCash = instance.totalQuantity;
      //print(instance.totalQuantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    String currencySymbol = getCurrencySymbol(widget.currencyName);

    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Container(
        color: ColorsClass.getBackgroundForHeaderDrawer(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Свободные деньги: ',
                style: TextStyle(
                  color: ColorsClass.getFrontForNotPressedButton(),
                  fontSize: 20,
                ),
              ),
              Text(
                '${startValueFreeCash} $currencySymbol',
                style: TextStyle(
                  color: ColorsClass.getFrontForNotPressedButton(),
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setFreeCashForInstrument();
  }
}
