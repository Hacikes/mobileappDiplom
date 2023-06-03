import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_details_button/account_button_company.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_details_dashboard/account_companies_dashboard.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_details_percents/account_percents_details_company.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/button_get_list_by_account.dart';


class AccountDetailsCompany extends StatefulWidget {
  const AccountDetailsCompany({Key? key, required this.toggleView, required this.AccountIdForDetails, required this.AccountNameForDetails, required this.BrokerNameForDetails}) : super(key: key);
  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;

  final Function toggleView;

  @override
  State<AccountDetailsCompany> createState() => _AccountDetailsCompanyState();
}

class _AccountDetailsCompanyState extends State<AccountDetailsCompany> {

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
            account_details_button_company(toggleView: widget.toggleView, AccountIdForDetails: widget.AccountIdForDetails, AccountNameForDetails: widget.AccountNameForDetails, BrokerNameForDetails: widget.BrokerNameForDetails),
            const SizedBox(height: 10,),
            account_details_companies_dashboard(),
            // SizedBox(height: 0.0,),
            AccountDelailsCompaniesPercents(),
            const SizedBox(height: 10,),
            button_get_list_by_account(toggleView: widget.toggleView, AccountIdForDetails: widget.AccountIdForDetails, AccountNameForDetails: widget.AccountNameForDetails, BrokerNameForDetails: widget.BrokerNameForDetails),
          ],
        ),
        // drawer: DrawerFull(context: this.context,),
      ),
    );
  }
}





