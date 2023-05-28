import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MockUsernameAndEmail {

  MockUsernameAndEmail();

  static String username = 'XXXXX XXXXX XXXXX';
  static String email = 'XXXXXX@XXXXX.XX';


  static String getMockUsername() {
    return username;
  }

  static String getMockEmail() {
    return email;
  }

}