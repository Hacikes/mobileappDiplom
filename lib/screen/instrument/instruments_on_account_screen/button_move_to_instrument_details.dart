import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';
import 'package:mobile_app_diplom/screen/instrument/add_instrument_screen/add_instruments_screen.dart';
import 'package:mobile_app_diplom/screen/instrument/instrument_details_screen/instrument_details_screen.dart';




class button_move_to_instrument_details_screen_by_account extends StatefulWidget {
  const button_move_to_instrument_details_screen_by_account({Key? key, required this.toggleView}) : super(key: key);


  final Function toggleView;

  @override
  State<button_move_to_instrument_details_screen_by_account> createState() => _button_move_to_instrument_details_screen_by_accountState();
}

class _button_move_to_instrument_details_screen_by_accountState extends State<button_move_to_instrument_details_screen_by_account> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addInstrumentScreen(toggleView: widget.toggleView)),
              );
            },
            child: Text("Добавить инструмент"),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsClass.getBackgroundForNotPressedButton(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ),
      ),
    );
  }
}

