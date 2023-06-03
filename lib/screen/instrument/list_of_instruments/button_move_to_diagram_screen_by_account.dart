import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';


class button_move_to_diagram_screen_by_account extends StatefulWidget {
  const button_move_to_diagram_screen_by_account({Key? key, required this.toggleView, required this.AccountIdForDetails, required this.AccountNameForDetails, required this.BrokerNameForDetails}) : super(key: key);

  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;

  final Function toggleView;

  @override
  State<button_move_to_diagram_screen_by_account> createState() => _button_move_to_diagram_screen_by_accountState();
}

class _button_move_to_diagram_screen_by_accountState extends State<button_move_to_diagram_screen_by_account> {
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
                MaterialPageRoute(builder: (context) => AccountDetailsCurrency(toggleView: widget.toggleView, AccountIdForDetails: widget.AccountIdForDetails, AccountNameForDetails: widget.AccountNameForDetails, BrokerNameForDetails: widget.BrokerNameForDetails)),
              );
            },
            child: Text("Аналитика"),
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

