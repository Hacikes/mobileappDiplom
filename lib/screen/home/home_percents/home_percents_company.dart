import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/mock/mock_percents.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_assets_screen/get_percent_assets.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_company_screen/get_percent_companies.dart';
//import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_company_screen/get_percent_instruments.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_instruments_screen/get_percent_instruments.dart';

class HomeCompaniesPercents extends StatefulWidget {
  HomeCompaniesPercents({Key? key}) : super(key: key);

  @override
  State<HomeCompaniesPercents> createState() => _HomeCompaniesPercentsState();
}

class _HomeCompaniesPercentsState extends State<HomeCompaniesPercents> {

  List<String> StartCompaniesName = ['XXX'];
  List<double> StartCompaniesPercent = [];
  List<Container> ContainerPercentsCompanies = MockPercents.MockContainerPercentsCurrency;


  Future<void> setupCompaniesNameAndAssentsPercent() async {
    TypeOfCompanyPercent instance = TypeOfCompanyPercent();
    await instance.getTypeOfCompanyPercent();
    ColorsClass;
    // print(instance.keys);
    // print(instance.values);
    setState(() {
      StartCompaniesName = instance.keys;
      StartCompaniesPercent = instance.values;
      ContainerPercentsCompanies = generateContainerPercentsCurrency(ColorsClass.getColors());
    });
  }


  List<Container> generateContainerPercentsCurrency(List<Color> colors) {
    List<Container> sectionDataList = [];
    for (int i = 0; i < StartCompaniesName.length; i++) {
      final children =
      Container(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                StartCompaniesName[i],
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
                '${StartCompaniesPercent[i]} %',
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
          children: ContainerPercentsCompanies,
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    setupCompaniesNameAndAssentsPercent();

  }
}
