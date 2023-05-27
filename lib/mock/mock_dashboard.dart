import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MockDashboard {
  static List<PieChartSectionData> MockpieChartSectionDatas = [
    PieChartSectionData(
      color: Colors.grey,
      value: 100,
      showTitle: false,
      radius: 20,
    ),
  ];

  static List<PieChartSectionData> getMockDashboard() {
    return MockpieChartSectionDatas;
  }
  MockDashboard();
}