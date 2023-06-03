import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/instrument/list_of_instruments/list_of_instruments.dart';


class button_get_list_by_account extends StatefulWidget {
  const button_get_list_by_account({Key? key, required this.toggleView, required this.AccountIdForDetails, required this.AccountNameForDetails, required this.BrokerNameForDetails}) : super(key: key);
  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;

  final Function toggleView;

  @override
  State<button_get_list_by_account> createState() => _button_get_list_by_accountState();
}

class _button_get_list_by_accountState extends State<button_get_list_by_account> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 60,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ListOfInstruments(toggleView: widget.toggleView, AccountIdForDetails: widget.AccountIdForDetails, AccountNameForDetails: widget.AccountNameForDetails, BrokerNameForDetails: widget.BrokerNameForDetails)
                  ),
                );
              },
              child: Text("Список инструментов"),
              style: ElevatedButton.styleFrom(
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
