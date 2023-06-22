import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/instrument/instrument_details_screen/buy_button.dart';
import 'package:mobile_app_diplom/screen/instrument/instrument_details_screen/instrumnt_details.dart';
import 'package:mobile_app_diplom/screen/instrument/instrument_details_screen/sell_button.dart';
import 'package:mobile_app_diplom/services/services_for_instrument/get_instrument_percent_for_account_and_user/get_instrument_percent_for_account_and_user.dart';

class instrumentDetailsScreen extends StatefulWidget {
  const instrumentDetailsScreen({
    Key? key,
    required this.toggleView,
    required this.instrumentId,
    required this.instrumentNames,
    required this.totalQuantity,
    required this.avgPrice,
    required this.currencyId,
    required this.currencyName,
    required this.instrumentTypeId,
    required this.instrumentTypeName,
    required this.AccountIdForDetails,
    required this.AccountNameForDetails,
    required this.BrokerNameForDetails,
  }) : super(key: key);

  final int instrumentId;
  final String instrumentNames;
  final int totalQuantity;
  final double avgPrice;
  final int currencyId;
  final String currencyName;
  final int instrumentTypeId;
  final String instrumentTypeName;

  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;

  final Function toggleView;

  @override
  State<instrumentDetailsScreen> createState() => _instrumentDetailsScreenState();
}

class _instrumentDetailsScreenState extends State<instrumentDetailsScreen> {

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: ColorsClass.getBackgroundForSrceen(),
        appBar: AppBar(
          title: Text(widget.instrumentNames),
          backgroundColor: ColorsClass.getBackgroundForAppbar(),
          elevation: 0.0,
          automaticallyImplyLeading: true,
          actions: const <Widget>[],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InstrumentDetails(toggleView: widget.toggleView,
                  instrumentId: widget.instrumentId,
                  instrumentNames: widget.instrumentNames,
                  totalQuantity: widget.totalQuantity,
                  avgPrice: widget.avgPrice,
                  currencyName: widget.currencyName,
                  instrumentTypeName: widget.instrumentTypeName
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),

              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    button_buy_instrument(toggleView: widget.toggleView,
                        InstrumentId: widget.instrumentId,
                        InstrumentName: widget.instrumentNames,
                        TotalQuantity: widget.totalQuantity,
                        AvgPrice: widget.avgPrice,
                        currencyId: widget.currencyId,
                        CurrencyName: widget.currencyName,
                        instrumentTypeId: widget.instrumentTypeId,
                        InstrumentTypeName: widget.instrumentTypeName,
                        AccountIdForDetails: widget.AccountIdForDetails,
                        AccountNameForDetails: widget.AccountNameForDetails,
                        BrokerNameForDetails: widget.BrokerNameForDetails,
                    ),
                    button_sell_instrument(toggleView: widget.toggleView,
                        InstrumentId: widget.instrumentId,
                        InstrumentName: widget.instrumentNames,
                        TotalQuantity: widget.totalQuantity,
                        AvgPrice: widget.avgPrice,
                        currencyId: widget.currencyId,
                        CurrencyName: widget.currencyName,
                        instrumentTypeId: widget.instrumentTypeId,
                        InstrumentTypeName: widget.instrumentTypeName,
                      AccountIdForDetails: widget.AccountIdForDetails,
                      AccountNameForDetails: widget.AccountNameForDetails,
                      BrokerNameForDetails: widget.BrokerNameForDetails,
                    ),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
