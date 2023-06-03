import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/mock/mock_percents.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_account_details_screen/get_percent_companies_for_account.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_assets_screen/get_percent_assets.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_company_screen/get_percent_companies.dart';
//import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_company_screen/get_percent_instruments.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_instruments_screen/get_percent_instruments.dart';

class AccountDelailsCompaniesPercents extends StatefulWidget {
  AccountDelailsCompaniesPercents({Key? key}) : super(key: key);

  @override
  State<AccountDelailsCompaniesPercents> createState() => _AccountDelailsPercentsState();
}

class _AccountDelailsPercentsState extends State<AccountDelailsCompaniesPercents> {

  List<String> StartCompaniesName = ['XXX'];
  List<double> StartCompaniesPercent = [];
  List<Container> ContainerPercentsCompanies = MockPercents.MockContainerPercentsCurrency;


  Future<void> setupCompaniesNameAndAssentsPercentByAccount() async {
    TypeOfCompanyPercentByAccount instance = TypeOfCompanyPercentByAccount();
    await instance.getTypeOfCompanyPercentByAccount();
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
    setupCompaniesNameAndAssentsPercentByAccount();

  }
}
