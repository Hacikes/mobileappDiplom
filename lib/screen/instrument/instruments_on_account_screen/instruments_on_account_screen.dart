import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/instrument/buy_sell_instrument_screen/buy_new_instrument_manual.dart';
import 'package:mobile_app_diplom/screen/instrument/instruments_on_account_screen/button_move_to_diagram_screen_by_account.dart';
import 'package:mobile_app_diplom/screen/instrument/instruments_on_account_screen/button_top_up_and_withdraw_from_account.dart';
import 'package:mobile_app_diplom/screen/instrument/instruments_on_account_screen/free_cash_by_account.dart';
import 'package:mobile_app_diplom/screen/instrument/instruments_on_account_screen/list_of_instruments.dart';
import 'package:mobile_app_diplom/screen/instrument/search_instrument/search_instrument_screen.dart';

class ListOfInstruments extends StatefulWidget {
  const ListOfInstruments({
    Key? key,
    required this.toggleView,
    required this.AccountIdForDetails,
    required this.AccountNameForDetails,
    required this.BrokerNameForDetails,
  }) : super(key: key);

  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;

  final Function toggleView;

  @override
  State<ListOfInstruments> createState() => _ListOfInstrumentsState();
}

class _ListOfInstrumentsState extends State<ListOfInstruments> {
  List<String> StartInstrumentNames = [];
  List<int> StartTotalQuantity = [];
  List<double> StartAvgPrice = [];
  List<String> StartCurrencyName = [];
  List<String> StartInstrumentTypeName = [];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: ColorsClass.getBackgroundForSrceen(),
        appBar: AppBar(
          title: Text(widget.BrokerNameForDetails),
          backgroundColor: ColorsClass.getBackgroundForSrceen(),
          elevation: 0.0,
          automaticallyImplyLeading: true,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuyNewInstrumentManual(
                      toggleView: widget.toggleView,
                      AccountIdForDetails: widget.AccountIdForDetails,
                      AccountNameForDetails: widget.AccountNameForDetails,
                      BrokerNameForDetails: widget.BrokerNameForDetails,
                    ),
                  ),
                );
              },
            ),
            SearchScreen(
              toggleView: widget.toggleView,
              AccountIdForDetails: widget.AccountIdForDetails,
              AccountNameForDetails: widget.AccountNameForDetails,
              BrokerNameForDetails: widget.BrokerNameForDetails,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              button_move_to_diagram_screen_by_account(
                toggleView: widget.toggleView,
                AccountIdForDetails: widget.AccountIdForDetails,
                AccountNameForDetails: widget.AccountNameForDetails,
                BrokerNameForDetails: widget.BrokerNameForDetails,
              ),
              ListInstruments(toggleView: widget.toggleView),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: ButtonTopUpAndWithdrawFromAccount(
                  toggleView: widget.toggleView,
                  AccountIdForDetails: widget.AccountIdForDetails,
                  AccountNameForDetails: widget.AccountNameForDetails,
                  BrokerNameForDetails: widget.BrokerNameForDetails,
                ),
              ),
              SizedBox(height: 20),
              free_cash_panel(toggleView: widget.toggleView),
            ],
          ),
        ),
      ),
    );
  }
}
