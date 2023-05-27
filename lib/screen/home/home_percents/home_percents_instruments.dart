import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/mock/mock_percents.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_assets_screen/get_percent_assets.dart';
import 'package:mobile_app_diplom/color/colors_for_dashboard.dart';
//import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_company_screen/get_percent_instruments.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_instruments_screen/get_percent_instruments.dart';

class HomeInstrumentsPercents extends StatefulWidget {
  HomeInstrumentsPercents({Key? key}) : super(key: key);

  @override
  State<HomeInstrumentsPercents> createState() => _HomeInstrumentsPercentsState();
}

class _HomeInstrumentsPercentsState extends State<HomeInstrumentsPercents> {

  List<String> StartCurrencyName = ['XXX'];
  List<double> StartInstrumentsPercent = [0.0];
  List<Container> ContainerPercentsInstruments = MockPercents.MockContainerPercentsCurrency;


  Future<void> setupInstrumentsNameAndAssentsPercent() async {
    TypeOfInstrumentsPercent instance = TypeOfInstrumentsPercent();
    await instance.getTypeOfInstrumentsPercent();
    ColorsForDashboard;
    // print(instance.keys);
    // print(instance.values);
    setState(() {
      StartCurrencyName = instance.keys;
      StartInstrumentsPercent = instance.values;
      ContainerPercentsInstruments = generateContainerPercentsCurrency(ColorsForDashboard.getColors());
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
                  color: Colors.white,
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
                '${StartInstrumentsPercent[i]} %',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
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
          children: ContainerPercentsInstruments,
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    setupInstrumentsNameAndAssentsPercent();

  }
}
