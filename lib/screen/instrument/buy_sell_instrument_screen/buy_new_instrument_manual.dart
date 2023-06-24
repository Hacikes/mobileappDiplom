import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/instrument/buy_sell_instrument_screen/free_cash_in_currency.dart';
import 'package:mobile_app_diplom/screen/instrument/instrument_details_screen/instrument_details_screen.dart';
import 'package:mobile_app_diplom/screen/instrument/instruments_on_account_screen/instruments_on_account_screen.dart';
import 'package:mobile_app_diplom/services/services_for_operation/buy_new_instrument.dart';
import 'package:mobile_app_diplom/services/services_for_operation/buy_sell_instrument.dart';

class BuyNewInstrumentManual extends StatefulWidget {
  BuyNewInstrumentManual({
    Key? key,
    required this.toggleView,
    required this.AccountIdForDetails,
    required this.AccountNameForDetails,
    required this.BrokerNameForDetails,
  }) : super(key: key);

  // Данные о счёте
  final int AccountIdForDetails;
  final String AccountNameForDetails;
  final String BrokerNameForDetails;

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

  int getInstrumentTypeId(String instrumentTypeName) {
    switch (instrumentTypeName) {
      case 'Акции':
        return 1;
      case 'Облигации':
        return 2;
      case 'Валюта':
        return 3;
      case 'Металлы':
        return 4;
      case 'Фьючерсы':
        return 5;
      default:
        return 0;
    }
  }

  @override
  State<BuyNewInstrumentManual> createState() =>
      _BuyNewInstrumentManualState();
}

class _BuyNewInstrumentManualState extends State<BuyNewInstrumentManual> {
  final _formKey = GlobalKey<FormState>();

  String InstrumentName = '';
  String Tiker = '';
  double AvgPrice = 0.0;
  int CurrencyId = 0;
  String CurrencyName = '';
  int InstrumentTypeId = 0;
  String InstrumentTypeName = '';

  int TotalQuantity = 0;

  // Вводимые при регистрации поля
  double inputPrice = 1.0;
  int inputCount = 0;

  double getTotalCost() {
    return inputPrice * inputCount;
  }

  int getTotalQuantity() {
    return TotalQuantity + inputCount;
  }

  @override
  Widget build(BuildContext context) {
    String avgPriceText;
    if (AvgPrice.toStringAsFixed(0) == '0') {
      avgPriceText = AvgPrice.toStringAsFixed(5);
    } else {
      avgPriceText = AvgPrice.toStringAsFixed(2);
    }

    return Scaffold(
      backgroundColor: ColorsClass.getBackgroundForSrceen(),
      appBar: AppBar(
        title: Text(widget.AccountNameForDetails),
        backgroundColor: ColorsClass.getBackgroundForAppbar(),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        actions: const <Widget>[],
      ),
      body: Column(
          children: [
      Expanded(
      child: Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Название инструмента',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.getFrontForNotPressedButton(),
                ),
              ),
              TextFormField(
                style: TextStyle(color: ColorsClass.getFrontForNotPressedButton()),
                decoration: InputDecoration(
                  hintText: 'Введите название инструмента',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (val) =>
                val!.isEmpty ? 'Введите название инструмента' : null,
                onChanged: (val) {
                  setState(() => InstrumentName = val);
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Тикер',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.getFrontForNotPressedButton(),
                ),
              ),
              TextFormField(
                style: TextStyle(color: ColorsClass.getFrontForNotPressedButton()),
                decoration: InputDecoration(
                  hintText: 'Введите тикер инструмента',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (val) =>
                val!.isEmpty ? 'Введите тикер инструмента' : null,
                onChanged: (val) {
                  setState(() => Tiker = val);
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Цена',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.getFrontForNotPressedButton(),
                ),
              ),
              TextFormField(
                style: TextStyle(color: ColorsClass.getFrontForNotPressedButton()),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d+\.?\d{0,5}'),
                  ),
                ],
                decoration: InputDecoration(
                  hintText: 'Введите цену одной штуки',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (val) =>
                val!.isEmpty ? 'Введите цену' : null,
                onChanged: (val) {
                  setState(() => AvgPrice = double.parse(val));
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Количество',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.getFrontForNotPressedButton(),
                ),
              ),
              TextFormField(
                style: TextStyle(color: ColorsClass.getFrontForNotPressedButton()),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^[\d]*'),
                  ),
                ],
                decoration: InputDecoration(
                  hintText: 'Введите количество',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                validator: (val) =>
                val!.isEmpty ? 'Введите количество' : null,
                onChanged: (val) {
                  setState(() => TotalQuantity = int.parse(val));
                },
              ),

              SizedBox(height: 20.0),
              Text(
                'Валюта',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.getFrontForNotPressedButton(),
                ),
              ),
              DropdownButtonFormField(
                style: TextStyle(color: ColorsClass.getFrontForNotPressedButton()),
                decoration: InputDecoration(
                  hintText: 'Выберите валюту',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text('Рубль'),
                    value: 5,
                  ),
                  DropdownMenuItem(
                    child: Text('Доллар'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text('Евро'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('Юань'),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text('Гонконгский доллар'),
                    value: 4,
                  ),
                ],
                validator: (val) =>
                val == null ? 'Выберите валюту' : null,
                onChanged: (val) {
                  setState(() {
                    CurrencyId = val as int;
                    switch (CurrencyId) {
                      case 1:
                        CurrencyName = 'RUB';
                        break;
                      case 2:
                        CurrencyName = 'USD';
                        break;
                      case 3:
                        CurrencyName = 'EUR';
                        break;
                      case 4:
                        CurrencyName = 'CHY';
                        break;
                      case 5:
                        CurrencyName = 'HKD';
                        break;
                      default:
                        CurrencyName = '';
                        break;
                    }
                  });
                },
                dropdownColor: Colors.grey[900],
                icon: Icon(Icons.arrow_drop_down),
              ),

              SizedBox(height: 20.0),
              Text(
                'Тип инструмента',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.getFrontForNotPressedButton(),
                ),
              ),
              DropdownButtonFormField(
                style: TextStyle(color: ColorsClass.getFrontForNotPressedButton()),
                decoration: InputDecoration(
                  hintText: 'Выберите тип инструмента',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text('Акции'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('Облигации'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text('Валюты'),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text('Металлы'),
                    value: 4,
                  ),
                  DropdownMenuItem(
                    child: Text('Фьючерсы'),
                    value: 5,
                  ),
                ],
                validator: (val) =>
                val == null ? 'Выберите тип инструмента' : null,
                onChanged: (val) {
                  setState(() {
                    InstrumentTypeId = val as int;
                    switch (InstrumentTypeId) {
                      case 1:
                        InstrumentTypeName = 'Акции';
                        break;
                      case 2:
                        InstrumentTypeName = 'Облигации';
                        break;
                      case 3:
                        InstrumentTypeName = 'Валюта';
                        break;
                      case 4:
                        InstrumentTypeName = 'Металлы';
                        break;
                      case 5:
                        InstrumentTypeName = 'Фьючерсы';
                        break;
                      default:
                        InstrumentTypeName = '';
                        break;
                    }
                  });

                },
                dropdownColor: Colors.grey[900],
                icon: Icon(Icons.arrow_drop_down),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //primary: ColorsClass.getFrontForNotPressedButton(),
                  onPrimary: ColorsClass.getFrontForNotPressedButton(),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Добавить код для сохранения данных инструмента

                    final statusCode =
                        await BuyNewInstrumentsFromSearch().buyInstrumentManual(
                        InstrumentName,
                        Tiker,
                        AvgPrice,
                        CurrencyId,
                        TotalQuantity,
                        InstrumentTypeId
                    );
                    switch (statusCode) {
                      case 200:
                      // Создание счёта прошел успешно, возврат на список счетов
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ListOfInstruments(
                            toggleView: widget.toggleView,
                            AccountIdForDetails: widget.AccountIdForDetails,
                            AccountNameForDetails: widget.AccountNameForDetails,
                            BrokerNameForDetails: widget.BrokerNameForDetails,
                          )
                          ),
                        );
                        break;
                      case 400:
                      // Ошибка 400, выводим сообщение об ошибке
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Необходимо заполнить все поля'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        break;
                      default:
                      // Обработка других статусов ответа
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Упс... Что-то пошло не так ...\nВозможно вам не хватает средств'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        break;
                    }
                    // print('Название инструмента: ${InstrumentName}');
                    // print('Тикер: $Tiker');
                    // print('Цена: $AvgPrice');
                    // print('Количество: $TotalQuantity');
                    // print('CurrencyId: $CurrencyId');
                    // print('Валюта: $CurrencyName');
                    // print('InstrumentTypeId: $InstrumentTypeId');
                    // print('Тип инструмента: $InstrumentTypeName');
                  }
                },
                child: Text(
                  'Добавить',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
      ),
    ],
      ),
    );
  }
}