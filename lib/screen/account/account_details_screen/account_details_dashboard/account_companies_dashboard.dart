import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/mock/mock_dashboard.dart';
import 'package:mobile_app_diplom/mock/mock_total_value_in_rub.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_account_details_screen/get_percent_companies_for_account.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_account_details_screen/get_total_volume_currency_in_RUB_for_account.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_company_screen/get_percent_companies.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_currency_screen/get_total_volume_currency_in_RUB.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_instruments_screen/get_percent_instruments.dart';

class account_details_companies_dashboard extends StatefulWidget {
  account_details_companies_dashboard({Key? key}) : super(key: key);

  @override
  State<account_details_companies_dashboard> createState() => _account_details_companies_dashboardState();
}

class _account_details_companies_dashboardState extends State<account_details_companies_dashboard> {


  String StartSum = MockTotalValueInRub.MockStartSum;
  List<double> StartPie = [];
  List<PieChartSectionData> pieChartSectionDatas = MockDashboard.MockpieChartSectionDatas;

  Future<void> setupTotalVolumeByAccount() async {
    TotalVolumeCurrencyByAccountInRUB instance = TotalVolumeCurrencyByAccountInRUB();
    await instance.getTotalVolumeCurrencyByAccountInRUB();
    //print(instance.totalSum);
    setState(() {
      StartSum = instance.totalSum;
    });
  }

  Future<void> setupShareCompaniesByAccount() async {
    TypeOfCompanyPercentByAccount instance = TypeOfCompanyPercentByAccount();
    await instance.getTypeOfCompanyPercentByAccount();
    // print(instance.keys);
    //print(instance.values);
    setState(() {
      StartPie = instance.values;
      pieChartSectionDatas = generatePieChartSectionData(ColorsClass.getColors());
    });
  }

  List<PieChartSectionData> generatePieChartSectionData(List<Color> colors) {
    List<PieChartSectionData> sectionDataList = [];
    for (int i = 0; i < StartPie.length; i++) {
      final sectionData = PieChartSectionData(
        color: colors[i],
        value: StartPie[i],
        showTitle: false,
        radius: 20,
      );
      sectionDataList.add(sectionData);
    }
    return sectionDataList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 100,
              sections: pieChartSectionDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StartSum,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: ColorsClass.getFrontForGraphText(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    setupTotalVolumeByAccount();
    setupShareCompaniesByAccount();
  }

}
