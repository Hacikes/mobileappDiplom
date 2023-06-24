import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_assets.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_company.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_instruments.dart';
import 'package:mobile_app_diplom/screen/calculator/calculator_count_screen.dart';
import 'package:mobile_app_diplom/screen/calculator/calculator_volume_screen.dart';

class BottomBuyCalculatorCount extends StatefulWidget {
  const BottomBuyCalculatorCount({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<BottomBuyCalculatorCount> createState() => _BottomBuyCalculatorCountState();
}

class _BottomBuyCalculatorCountState extends State<BottomBuyCalculatorCount> {
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalculatorInputCountScreen(toggleView: widget.toggleView)),
              );
            },
            style: ElevatedButton.styleFrom(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Доли"),
          ),
          SizedBox(width: 10,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalculatorInputVolumeScreen(toggleView: widget.toggleView)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsClass.getBackgroundForPressedButton(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Количества"),
          ),
        ],
      );

  }
}
