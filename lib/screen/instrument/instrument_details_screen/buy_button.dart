import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';
import 'package:mobile_app_diplom/screen/instrument/buy_sell_instrument_screen/buy_instrument_screen.dart';


class button_buy_instrument extends StatefulWidget {
  const button_buy_instrument({Key? key, required this.toggleView,
    required this.InstrumentId,
    required this.InstrumentName,
    required this.TotalQuantity,
    required this.AvgPrice,
    required this.currencyId,
    required this.CurrencyName,
    required this.instrumentTypeId,
    required this.InstrumentTypeName, }) : super(key: key);

  final int InstrumentId;
  final String InstrumentName;
  final int TotalQuantity;
  final double AvgPrice;
  final int currencyId;
  final String CurrencyName;
  final int instrumentTypeId;
  final String InstrumentTypeName;

  final Function toggleView;

  @override
  State<button_buy_instrument> createState() => _button_buy_instrumentState();
}

class _button_buy_instrumentState extends State<button_buy_instrument> {
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
                BuyInstrument(toggleView: widget.toggleView,
                InstrumentId: widget.InstrumentId,
                InstrumentName: widget.InstrumentName,
                TotalQuantity: widget.TotalQuantity,
                AvgPrice: widget.AvgPrice,
                CurrencyId: widget.currencyId,
                CurrencyName: widget.CurrencyName,
                instrumentTypeId: widget.instrumentTypeId,
                InstrumentTypeName: widget.InstrumentTypeName
              )
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsClass.getBackgroundForBuyButton(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text("Купить"),
      ),

    );
  }
}

