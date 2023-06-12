import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';
import 'package:mobile_app_diplom/services/services_for_instrument/get_free_cash.dart';


class free_cash_panel extends StatefulWidget {
  const free_cash_panel({Key? key, required this.toggleView});

  final Function toggleView;

  @override
  State<free_cash_panel> createState() => _free_cash_panelState();
}

class _free_cash_panelState extends State<free_cash_panel> {

  double startValueFreeCash = 0.0;
  String utf8RUB = '\u20BD';

  Future<void> setFreeCash() async {
    FreeCashInRUB instance = FreeCashInRUB();
    await instance.getFreeCashInRUB();
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
  void initState() {
    super.initState();
    setFreeCash();
  }

}

