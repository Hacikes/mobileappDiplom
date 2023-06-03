import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_details_button/account_button_instruments.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_details_dashboard/account_instruments_dashboard.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_details_percents/account_details_instruments.dart';
import 'package:mobile_app_diplom/screen/drawer/drawer.dart';
import 'package:mobile_app_diplom/screen/home/button_get_list.dart';
import 'package:mobile_app_diplom/screen/home/home_button/home_button_instruments.dart';
import 'package:mobile_app_diplom/screen/home/home_dashboard/home_instruments_dashboard.dart';
import 'package:mobile_app_diplom/screen/home/home_percents/home_percents_instruments.dart';



class AccountDetailsInstruments extends StatefulWidget {
  const AccountDetailsInstruments({Key? key, required this.toggleView, required this.AccountIdForDetails, required this.AccountNameForDetails, required this.BrokerNameForDetails}) : super(key: key);
  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;

  final Function toggleView;

  @override
  State<AccountDetailsInstruments> createState() => _AccountDetailsInstrumentsState();
}

class _AccountDetailsInstrumentsState extends State<AccountDetailsInstruments> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: ColorsClass.getBackgroundForSrceen(),
        appBar: AppBar(
          title: Text(widget.BrokerNameForDetails),
          backgroundColor: ColorsClass.getBackgroundForAppbar(),
          elevation: 0.0,
          automaticallyImplyLeading: true, // Убираем кнопку "Назад"
          actions: const <Widget>[
          ],
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
              child: Text(
                widget.AccountNameForDetails,
                style: TextStyle(
                  fontSize: 36.0,
                  color: ColorsClass.getFrontForHeaderText(),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10.0,),
            account_details_button_instruments(toggleView: widget.toggleView, AccountIdForDetails: widget.AccountIdForDetails, AccountNameForDetails: widget.AccountNameForDetails, BrokerNameForDetails: widget.BrokerNameForDetails),
            const SizedBox(height: 10,),
            account_details_instruments_dashboard(),
            // SizedBox(height: 0.0,),
            AccountDetailsInstrumentsPercents(),
            const SizedBox(height: 10,),
            const button_get_list(),
          ],
        ),
        // drawer: DrawerFull(context: this.context,),
      ),
    );
  }
}





