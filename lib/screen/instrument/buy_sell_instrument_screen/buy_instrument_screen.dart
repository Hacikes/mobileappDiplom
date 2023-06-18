import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/instrument/buy_sell_instrument_screen/free_cash_in_currency.dart';
import 'package:mobile_app_diplom/screen/instrument/instrument_details_screen/instrument_details_screen.dart';
import 'package:mobile_app_diplom/services/services_for_operation/buy_sell_instrument.dart';

class BuyInstrument extends StatefulWidget {
  BuyInstrument({
    Key? key,
    required this.toggleView,
    required this.InstrumentId,
    required this.InstrumentName,
    required this.TotalQuantity,
    required this.AvgPrice,
    required this.CurrencyId,
    required this.CurrencyName,
    required this.instrumentTypeId,
    required this.InstrumentTypeName,
  }) : super(key: key);

  final int InstrumentId;
  final String InstrumentName;
  final int TotalQuantity;
  final double AvgPrice;
  final int CurrencyId;
  final String CurrencyName;
  final int instrumentTypeId;
  final String InstrumentTypeName;

  final Function toggleView;

  String utf8RUB = '\u20BD';

  String getCurrencySymbol(String currencyName) {
    switch (currencyName) {
      case 'RUB':
        return utf8RUB;
      case 'USD':
        return '\u0024';
      case 'CHY':
        return '\u00A5';
      case 'HKD':
        return '\u0024';
      case 'EUR':
        return '\u20AC';
      default:
        return '';
    }
  }

  @override
  State<BuyInstrument> createState() => _BuyInstrumentState();
}

class _BuyInstrumentState extends State<BuyInstrument> {
  final _formKey = GlobalKey<FormState>();

  // Вводимые при регистрации поля
  double inputPrice = 1.0;
  int inputCount = 0;
  double getTotalCost() {
    return inputPrice * inputCount;
  }

  int getTotalQuantity() {
    return widget.TotalQuantity + inputCount;
  }

  @override
  Widget build(BuildContext context) {
    String avgPriceText;
    if (widget.AvgPrice.toStringAsFixed(0) == '0') {
      avgPriceText = widget.AvgPrice.toStringAsFixed(5);
    } else {
      avgPriceText = widget.AvgPrice.toStringAsFixed(2);
    }

    return Scaffold(
      backgroundColor: ColorsClass.getBackgroundForSrceen(),
      appBar: AppBar(
        title: Text(widget.InstrumentName),
        backgroundColor: ColorsClass.getBackgroundForAppbar(),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        actions: const <Widget>[],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          avgPriceText,
                          style: TextStyle(
                            fontSize: 36.0,
                            color: ColorsClass.getFrontForHeaderText(),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        if (widget.InstrumentTypeName == 'Валюта')
                          Text(
                            ' ${widget.utf8RUB}',
                            style: TextStyle(
                              fontSize: 36.0,
                              color: ColorsClass.getFrontForHeaderText(),
                            ),
                            textAlign: TextAlign.left,
                          )
                        else
                          Text(
                            ' ${widget.getCurrencySymbol(widget.CurrencyName)}',
                            style: TextStyle(
                              fontSize: 36.0,
                              color: ColorsClass.getFrontForHeaderText(),
                            ),
                            textAlign: TextAlign.left,
                          ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          inputPrice = double.tryParse(value) ?? 0.0;
                        });
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^[\d.]+$')),
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsClass.getBorderDecorationColor()),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsClass.getBorderDecorationColor()),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: '${widget.AvgPrice}',
                        filled: true,
                        fillColor: ColorsClass.getFrontForHintOnField(),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Введите цену покупки';
                        } else if (!RegExp(r'^\d+$').hasMatch(val)) {
                          if (!RegExp(r'^[0-9]+\.[0-9]+$').hasMatch(val)) {
                            return 'Для ввода доступны цифры и точка';
                          }
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          inputCount = int.tryParse(value) ?? 0;
                        });
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+$')),
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsClass.getBorderDecorationColor()),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorsClass.getBorderDecorationColor()),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Количество',
                        filled: true,
                        fillColor: ColorsClass.getFrontForHintOnField(),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Введите количество';
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(val)) {
                          return 'Для ввода доступны цифры';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Стоимость: ${getTotalCost()} ${widget.getCurrencySymbol(widget.CurrencyName)}',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: ColorsClass.getFrontForHeaderText(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Количество: ${getTotalQuantity()} шт',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: ColorsClass.getFrontForHeaderText(),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final addInstrumentService = BuySellInstrumentService();
                          final statusCode = await addInstrumentService.buyInstrument(
                            widget.InstrumentName,
                            inputPrice,
                            widget.CurrencyId,
                            inputCount,
                            widget.instrumentTypeId,
                          );
                          switch (statusCode) {
                            case 200:
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => instrumentDetailsScreen(
                                    toggleView: widget.toggleView,
                                    instrumentId: widget.InstrumentId,
                                    instrumentNames: widget.InstrumentName,
                                    totalQuantity: widget.TotalQuantity + inputCount,
                                    avgPrice: (widget.AvgPrice * widget.TotalQuantity + inputPrice * inputCount) /
                                        (widget.TotalQuantity + inputCount),
                                    currencyId: widget.CurrencyId,
                                    currencyName: widget.CurrencyName,
                                    instrumentTypeId: widget.instrumentTypeId,
                                    instrumentTypeName: widget.InstrumentTypeName,
                                  ),
                                ),
                              );
                              break;
                            case 400:
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Необходимо заполнить все поля'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                              break;
                            default:
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Упс... Что-то пошло не так ...'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                              break;
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsClass.getBackgroundForBuyButton(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(double.infinity, 40),
                      ),
                      child: Text(
                        'Купить',
                        style: TextStyle(
                          color: ColorsClass.getFrontForNotPressedButton(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          free_cash_panel_for_operation(
            toggleView: widget.toggleView,
            currencyName: widget.CurrencyName,
            //currencySymbol: widget.InstrumentTypeName == 'Валюта' ? widget.utf8RUB : widget.getCurrencySymbol(widget.CurrencyName),
          ),
        ],
      ),
    );
  }
}
