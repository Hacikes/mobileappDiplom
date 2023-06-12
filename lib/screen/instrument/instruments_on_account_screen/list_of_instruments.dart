import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';
import 'package:mobile_app_diplom/screen/account/edit_account_screen/edit_account_screen.dart';
import 'package:mobile_app_diplom/screen/instrument/add_instrument_screen/add_instruments_screen.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_accounts_srceen/delete_account.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_accounts_srceen/get_accounts_for_accounts_screen.dart';
import 'package:mobile_app_diplom/mock/mock_accounts_list.dart';
import 'package:mobile_app_diplom/services/services_for_instrument/get_instruments_on_account/get_list_of_instruments.dart';


// int? GlobalAccountId;

class ListInstruments extends StatefulWidget {
  const ListInstruments({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<ListInstruments> createState() => _ListInstrumentsState();
}

class _ListInstrumentsState extends State<ListInstruments> {
  List<String> startInstrumentNames = ['0'];
  List<int> startTotalQuantity = [0];
  List<double> startAvgPrice = [0.0];
  List<String> startCurrencyName = ['0'];
  List<String> startInstrumentTypeName = ['0'];
  // List<int> accountsId = [];
  String utf8RUB = '\u20BD';

  Future<void> getListInstruments() async {
    InstrumentsList instance = InstrumentsList();
    await instance.getInstrumentsList();
    // print(instance.instrumentNames);
    // print(instance.totalQuantity);
    // print(instance.avgPrice);
    // print(instance.currencyName);
    // print(instance.instrumentTypeName);
    setState(() {
      startInstrumentNames = instance.instrumentNames;
      startTotalQuantity = instance.totalQuantity;
      startAvgPrice = instance.avgPrice;
      startCurrencyName = instance.currencyName;
      startInstrumentTypeName = instance.instrumentTypeName;
      // accountsId = instance.accountId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: startInstrumentNames.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // GestureDetector(
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          startInstrumentNames[index],
                          style: TextStyle(
                            color: ColorsClass.getFrontForNotPressedButton(),
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          '${startAvgPrice[index]} $utf8RUB', // Стоимость
                          style: TextStyle(
                            color: ColorsClass.getFrontForNotPressedButton(),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      '${startTotalQuantity[index]} шт',
                      style: TextStyle(
                        color: ColorsClass.getFrontForNotPressedButton(),
                      ),
                    ),
                    onTap: () {
                      // GlobalAccountId(accountsId[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => addInstrumentScreen(toggleView: widget.toggleView)),
                      );
                    },
                  ),
                // ),
                SizedBox(
                  height: 1,
                  child: Divider(
                    color: ColorsClass.color_for_devider, // цвет черты
                    thickness: 1, // толщина черты
                    indent: 16, // отступ слева
                    endIndent: 16, // отступ справа
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getListInstruments();
  }
}
