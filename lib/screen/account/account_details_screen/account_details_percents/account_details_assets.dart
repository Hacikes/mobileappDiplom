import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/mock/mock_percents.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_account_details_screen/get_percent_assets_for_account.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_assets_screen/get_percent_assets.dart';
import 'package:mobile_app_diplom/color/colors.dart';

class AccountDetailsAssetsPercents extends StatefulWidget {
  AccountDetailsAssetsPercents({Key? key}) : super(key: key);

  @override
  State<AccountDetailsAssetsPercents> createState() => _AccountDetailsAssetsPercentsState();
}

class _AccountDetailsAssetsPercentsState extends State<AccountDetailsAssetsPercents> {

  List<String> StartCurrencyName = ['XXX'];
  List<double> StartCurrencyPercent = [];
  List<Container> ContainerPercentsCurrency = MockPercents.MockContainerPercentsCurrency;


  Future<void> setupAssentsNameAndAssentsPercentByAccount() async {
    TypeOfCurrencyInstrumentsPercentByAccount instance = TypeOfCurrencyInstrumentsPercentByAccount();
    await instance.getTypeOfCurrencyInstrumentsPercentByAccount();
    ColorsClass;
    // print(instance.keys);
    // print(instance.values);
    setState(() {
      StartCurrencyName = instance.keys;
      StartCurrencyPercent = instance.values;
      ContainerPercentsCurrency = generateContainerPercentsCurrency(ColorsClass.getColors());
    });
  }


  List<Container> generateContainerPercentsCurrency(List<Color> colors) {
    List<Container> sectionDataList = [];
    for (int i = 0; i < StartCurrencyName.length; i++) {
      final children =
      Container(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                StartCurrencyName[i],
                style: TextStyle(
                  fontSize: 16.0,
                  color: ColorsClass.getFrontForGraphText(),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            //SizedBox(width: 20,),
            Container(
              width: 160.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: colors[i],
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            SizedBox(
              width: 60,
              child: Text(
                '${StartCurrencyPercent[i]} %',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16.0,
                  color: ColorsClass.getFrontForGraphText(),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      );
      sectionDataList.add(children);
    }
    return sectionDataList;
  }
  // Весь виджет для вывода процентов, валюты и палосочки
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      child: SingleChildScrollView(
        child: Column(
          children: ContainerPercentsCurrency,
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    setupAssentsNameAndAssentsPercentByAccount();

  }
}
