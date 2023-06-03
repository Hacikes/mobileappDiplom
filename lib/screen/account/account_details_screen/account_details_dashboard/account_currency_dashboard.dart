import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/mock/mock_dashboard.dart';
import 'package:mobile_app_diplom/mock/mock_total_value_in_rub.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_account_details_screen/get_percent_currency_on_all_instruments_for_account.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_account_details_screen/get_total_volume_currency_in_RUB_for_account.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_currency_screen/get_percent_currency_on_all_instruments.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_currency_screen/get_total_volume_currency_in_RUB.dart';
import 'package:mobile_app_diplom/color/colors.dart';

class account_details_currency_dashboard extends StatefulWidget {
  account_details_currency_dashboard({Key? key}) : super(key: key);

  @override
  State<account_details_currency_dashboard> createState() => _account_details_currency_dashboardState();
}

class _account_details_currency_dashboardState extends State<account_details_currency_dashboard> {


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

  Future<void> setupShareOfCurrencyInAllInstrumentsByAccount() async {
    ShareOfCurrencyInAllInstrumentsByAccount instance = ShareOfCurrencyInAllInstrumentsByAccount();
    await instance.getShareOfCurrencyInAllInstrumentsByAccount();
    //print(instance.values);
    // List<Color> colors = [
    //   Colors.green,
    //   Colors.amber,
    //   Colors.blue,
    //   Colors.yellow,
    //   Colors.red,
    //   Colors.deepPurple
    //   // Добавьте другие цвета, если необходимо
    // ];
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
    setupShareOfCurrencyInAllInstrumentsByAccount();
  }
}

// List<PieChartSectionData> pieChartSectionDatas = [
//   PieChartSectionData(
//     color: Colors.blue,
//     value: 15,
//     showTitle: false,
//     radius: 20,
//   ),
//   PieChartSectionData(
//     color: Colors.yellow,
//     value: 25,
//     showTitle: false,
//     radius: 20,
//   ),
//   PieChartSectionData(
//     color: Colors.green,
//     value: 40,
//     showTitle: false,
//     radius: 20,
//   ),
//   PieChartSectionData(
//     color: Colors.red,
//     value: 20,
//     showTitle: false,
//     radius: 20,
//   ),
// ];
