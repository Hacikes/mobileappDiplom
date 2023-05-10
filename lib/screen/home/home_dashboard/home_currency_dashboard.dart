import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/services/get_total_volume_currency_in_RUB.dart';
import 'package:mobile_app_diplom/services/sign_in.dart';


class home_currency_dashboard extends StatefulWidget {
  const home_currency_dashboard({Key? key}) : super(key: key);

  @override
  State<home_currency_dashboard> createState() => _home_currency_dashboardState();
}

class _home_currency_dashboardState extends State<home_currency_dashboard> {

  // int? userId = userid;
  String StartSum = "XXX XXX XXX XXX";

  Future<void> setupTotalVolume() async {
    TotalVolumeCurrencyInRUB instance = TotalVolumeCurrencyInRUB();
    await instance.getTotalVolumeCurrencyInRUB();
    //print(instance.totalSum);
    setState(() {
      StartSum = instance.totalSum;
    });
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
                    color: Colors.white,
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
  }

}


List<PieChartSectionData> pieChartSectionDatas = [
  PieChartSectionData(
    color: Colors.blue,
    value: 15,
    showTitle: false,
    radius: 20,
  ),
  PieChartSectionData(
    color: Colors.yellow,
    value: 25,
    showTitle: false,
    radius: 20,
  ),
  PieChartSectionData(
    color: Colors.green,
    value: 40,
    showTitle: false,
    radius: 20,
  ),
  PieChartSectionData(
    color: Colors.red,
    value: 20,
    showTitle: false,
    radius: 20,
  ),
];