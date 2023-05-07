import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class home_currency_dashboard extends StatelessWidget {
  const home_currency_dashboard({
    super.key,
  });

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
                  "XXX XXX XXX XXX X",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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