import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';


class button_sell_instrument extends StatefulWidget {
  const button_sell_instrument({Key? key, required this.toggleView, required this.InstrumentId, required this.InstrumentName, required this.TotalQuantity, required this.AvgPrice, required this.CurrencyName, required this.InstrumentTypeName, }) : super(key: key);

  final int InstrumentId;
  final String InstrumentName;
  final int TotalQuantity;
  final double AvgPrice;
  final String CurrencyName;
  final String InstrumentTypeName;

  final Function toggleView;

  @override
  State<button_sell_instrument> createState() => _button_sell_instrumentState();
}

class _button_sell_instrumentState extends State<button_sell_instrument> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 120,
      child: ElevatedButton(
        onPressed: () {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => AccountDetailsCurrency(toggleView: widget.toggleView, AccountIdForDetails: widget.AccountIdForDetails, AccountNameForDetails: widget.AccountNameForDetails, BrokerNameForDetails: widget.BrokerNameForDetails),
          //   ),
          // );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsClass.getBackgroundForSellButton(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text("Продать"),
      ),
    );
  }
}

