import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/mock/mock_percents.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_assets_screen/get_percent_assets.dart';
import 'package:mobile_app_diplom/color/colors_for_dashboard.dart';

class HomeAssetsPercents extends StatefulWidget {
  HomeAssetsPercents({Key? key}) : super(key: key);

  @override
  State<HomeAssetsPercents> createState() => _HomeAssetsPercentsState();
}

class _HomeAssetsPercentsState extends State<HomeAssetsPercents> {

  List<String> StartCurrencyName = ['XXX'];
  List<double> StartCurrencyPercent = [];
  List<Container> ContainerPercentsCurrency = MockPercents.MockContainerPercentsCurrency;


  Future<void> setupAssentsNameAndAssentsPercent() async {
    TypeOfCurrencyInstrumentsPercent instance = TypeOfCurrencyInstrumentsPercent();
    await instance.getTypeOfCurrencyInstrumentsPercent();
    ColorsForDashboard;
    // print(instance.keys);
    // print(instance.values);
    setState(() {
      StartCurrencyName = instance.keys;
      StartCurrencyPercent = instance.values;
      ContainerPercentsCurrency = generateContainerPercentsCurrency(ColorsForDashboard.getColors());
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
                '${StartCurrencyPercent[i]} %',
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
          children: ContainerPercentsCurrency,
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    setupAssentsNameAndAssentsPercent();

  }
}
