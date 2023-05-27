import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/mock/mock_dashboard.dart';
import 'package:mobile_app_diplom/mock/mock_total_value_in_rub.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_assets_screen/get_percent_assets.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_currency_screen/get_total_volume_currency_in_RUB.dart';
import 'package:mobile_app_diplom/color/colors.dart';

class home_assets_dashboard extends StatefulWidget {
  home_assets_dashboard({Key? key}) : super(key: key);

  @override
  State<home_assets_dashboard> createState() => _home_assets_dashboardState();
}

class _home_assets_dashboardState extends State<home_assets_dashboard> {


  String StartSum = MockTotalValueInRub.MockStartSum;
  List<double> StartPie = [];
  List<PieChartSectionData> pieChartSectionDatas = MockDashboard.MockpieChartSectionDatas;

  Future<void> setupTotalVolume() async {
    TotalVolumeCurrencyInRUB instance = TotalVolumeCurrencyInRUB();
    await instance.getTotalVolumeCurrencyInRUB();
    //print(instance.totalSum);
    setState(() {
      StartSum = instance.totalSum;
    });
  }

  Future<void> setupShareAssets() async {
    TypeOfCurrencyInstrumentsPercent instance = TypeOfCurrencyInstrumentsPercent();
    await instance.getTypeOfCurrencyInstrumentsPercent();
    // print(instance.keys);
    // print(instance.values);
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
    setupTotalVolume();
    setupShareAssets();
  }

}
