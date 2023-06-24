import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/services/services_for_instrument/get_free_cash.dart';


class free_cash_panel_for_calculator extends StatefulWidget {
  const free_cash_panel_for_calculator({Key? key, required this.toggleView, required this.AccountIdForCalculator});

  final int AccountIdForCalculator;
  final Function toggleView;

  @override
  State<free_cash_panel_for_calculator> createState() => _free_cash_panel_for_calculatorState();
}

class _free_cash_panel_for_calculatorState extends State<free_cash_panel_for_calculator> {

  double startValueFreeCash = 0.0;
  String utf8RUB = '\u20BD';

  Future<void> setFreeCash() async {
    FreeCashInRUB instance = FreeCashInRUB();
    await instance.getFreeCashInRUBForCalculator(widget.AccountIdForCalculator);
    // print(instance.accountId);
    setState(() {
      startValueFreeCash = instance.freeCash;
      // print(instance.freeCash);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                '${startValueFreeCash} $utf8RUB',
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
  void didUpdateWidget(free_cash_panel_for_calculator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.AccountIdForCalculator != oldWidget.AccountIdForCalculator) {
      setFreeCash();
    }
  }

}

