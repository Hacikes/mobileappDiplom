import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/instrument/instruments_on_account_screen/instruments_on_account_screen.dart';
import 'package:mobile_app_diplom/services/services_for_operation/buy_sell_instrument.dart';

class TopUpAccountScreen extends StatefulWidget {
  const TopUpAccountScreen({
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
  State<TopUpAccountScreen> createState() => _TopUpAccountScreenState();
}

class _TopUpAccountScreenState extends State<TopUpAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final FocusScopeNode _node = FocusScopeNode();
  double CountRUB = 0.0;

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Hide the keyboard when tapping outside of any text field
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: ColorsClass.getBackgroundForSrceen(),
        appBar: AppBar(
          title: const Text('Пополнение счёта'),
          backgroundColor: ColorsClass.getBackgroundForAppbar(),
          elevation: 0.0,
          automaticallyImplyLeading: true,
          actions: const <Widget>[],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 10.0),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      CountRUB = double.tryParse(value) ?? 0.0;
                    });
                  },
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
                    hintText: 'Введите сумму в рублях',
                    filled: true,
                    fillColor: ColorsClass.getFrontForHintOnField(),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Введите сумму';
                    } else if (!RegExp(r'^[0-9\.]+$').hasMatch(val)) {
                      return 'Спец. символы и буквыв сумме пополнения \nне допустимы';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _node.unfocus(); // Unfocus the text field
                      final topUpAccountService = BuySellInstrumentService();
                      final statusCode = await topUpAccountService.topUpAccount(
                        CountRUB.toInt(),
                      );
                      switch (statusCode) {
                        case 200:
                        // Создание счёта прошло успешно, возврат на список счетов
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListOfInstruments(
                                toggleView: widget.toggleView,
                                AccountIdForDetails:
                                widget.AccountIdForDetails,
                                AccountNameForDetails:
                                widget.AccountNameForDetails,
                                BrokerNameForDetails:
                                widget.BrokerNameForDetails,
                              ),
                            ),
                          );
                          break;
                        case 400:
                        // Ошибка 400, выводим сообщение об ошибке
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Необходимо ввести сумму'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          break;
                        default:
                        // Обработка других статусов ответа
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
                    backgroundColor:
                    ColorsClass.getBackgroundForNotPressedButton(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 40),
                  ),
                  child: Text(
                    'Пополнить счёт',
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
    );
  }
}
