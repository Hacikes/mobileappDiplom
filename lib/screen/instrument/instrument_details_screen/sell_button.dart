import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';
import 'package:mobile_app_diplom/screen/instrument/buy_sell_instrument_screen/buy_instrument_screen.dart';
import 'package:mobile_app_diplom/screen/instrument/buy_sell_instrument_screen/sell_instrument_screen.dart';


class button_sell_instrument extends StatefulWidget {
  const button_sell_instrument({Key? key, required this.toggleView,
    required this.InstrumentId,
    required this.InstrumentName,
    required this.TotalQuantity,
    required this.AvgPrice,
    required this.currencyId,
    required this.CurrencyName,
    required this.instrumentTypeId,
    required this.InstrumentTypeName,
    required this.AccountIdForDetails,
    required this.AccountNameForDetails,
    required this.BrokerNameForDetails, }) : super(key: key);

  final int InstrumentId;
  final String InstrumentName;
  final int TotalQuantity;
  final double AvgPrice;
  final int currencyId;
  final String CurrencyName;
  final int instrumentTypeId;
  final String InstrumentTypeName;

  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                SellInstrument(
                  toggleView: widget.toggleView,
                  AccountIdForDetails: widget.AccountIdForDetails,
                  AccountNameForDetails: widget.AccountNameForDetails,
                  BrokerNameForDetails: widget.BrokerNameForDetails,
                  InstrumentId: widget.InstrumentId,
                  InstrumentName: widget.InstrumentName,
                  TotalQuantity: widget.TotalQuantity,
                  AvgPrice: widget.AvgPrice,
                  CurrencyId: widget.currencyId,
                  CurrencyName: widget.CurrencyName,
                  instrumentTypeId: widget.instrumentTypeId,
                  InstrumentTypeName: widget.InstrumentTypeName,

                )
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsClass.getBackgroundForSellButton(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text("Уменьшить"),
      ),

    );
  }
}

