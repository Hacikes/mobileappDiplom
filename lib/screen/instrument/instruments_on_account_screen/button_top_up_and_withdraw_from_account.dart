import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';
import 'package:mobile_app_diplom/screen/instrument/add_withdraw_RUB_screen/top_up_account_screen.dart';
import 'package:mobile_app_diplom/screen/instrument/add_withdraw_RUB_screen/withdraw_from_account_screen.dart';
import 'package:mobile_app_diplom/screen/instrument/instrument_details_screen/instrument_details_screen.dart';




class ButtonTopUpAndWithdrawFromAccount extends StatefulWidget {
  const ButtonTopUpAndWithdrawFromAccount({Key? key, required this.toggleView, required this.AccountIdForDetails, required this.AccountNameForDetails, required this.BrokerNameForDetails}) : super(key: key);

  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;
  final Function toggleView;

  @override
  State<ButtonTopUpAndWithdrawFromAccount> createState() => _ButtonTopUpAndWithdrawFromAccountState();
}

class _ButtonTopUpAndWithdrawFromAccountState extends State<ButtonTopUpAndWithdrawFromAccount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 170,
          height: 60,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 16.0, 10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TopUpAccountScreen(
                      toggleView: widget.toggleView,
                      AccountIdForDetails: widget.AccountIdForDetails,
                      AccountNameForDetails: widget.AccountNameForDetails,
                      BrokerNameForDetails: widget.BrokerNameForDetails,
                    )
                    ),
                  );
                },
                child: Text("Пополнить счёт"),
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
        ),
        SizedBox(
          width: 170,
          height: 60,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 10.0, 0.0, 10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WithdrawFromAccountScreen(
                      toggleView: widget.toggleView,
                      AccountIdForDetails: widget.AccountIdForDetails,
                      AccountNameForDetails: widget.AccountNameForDetails,
                      BrokerNameForDetails: widget.BrokerNameForDetails,
                    )
                    ),
                  );
                },
                child: Text("Вывод средств"),
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
        ),
      ],
    );
  }
}

