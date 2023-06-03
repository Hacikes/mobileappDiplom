import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts_list.dart';
import 'package:mobile_app_diplom/screen/account/accounts_screen/button_add_account.dart';
import 'package:mobile_app_diplom/screen/drawer/drawer.dart';
import 'package:mobile_app_diplom/screen/instrument/list_of_instruments/button_move_to_diagram_screen_by_account.dart';


class ListOfInstruments extends StatefulWidget {
  const ListOfInstruments({Key? key, required this.toggleView, required this.AccountIdForDetails, required this.AccountNameForDetails, required this.BrokerNameForDetails}) : super(key: key);
  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;

  final Function toggleView;

  @override
  State<ListOfInstruments> createState() => _ListOfInstrumentsState();
}

class _ListOfInstrumentsState extends State<ListOfInstruments> {

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
          automaticallyImplyLeading: true,
          actions: const <Widget>[],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 10.0, 12.0),
              child: Text(
                widget.AccountNameForDetails,
                style: TextStyle(
                  fontSize: 36.0,
                  color: ColorsClass.getFrontForHeaderText(),
                  // fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            button_move_to_diagram_screen_by_account(toggleView: widget.toggleView, AccountIdForDetails: widget.AccountIdForDetails, AccountNameForDetails: widget.AccountNameForDetails, BrokerNameForDetails: widget.BrokerNameForDetails),
            AccountsList(toggleView: widget.toggleView),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),

            ),
          ],
        ),
        // drawer: DrawerFull(context: this.context),
      ),
    );
  }

}
