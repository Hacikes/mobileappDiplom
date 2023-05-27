import 'package:flutter/material.dart';

class MockPercents {
  static List<Container> MockContainerPercentsCurrency = [
    Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              "XXXXXX",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            width: 160.0,
            height: 16.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              "XXX %",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              "XXXXXX",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            width: 160.0,
            height: 16.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              "XXX %",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              "XXXXXX",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            width: 160.0,
            height: 16.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              "XXX %",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              "XXXXXX",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            width: 160.0,
            height: 16.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              "XXX %",
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    ),
  ];

  static List<Container> getMockDashboard() {
    return MockContainerPercentsCurrency;
  }
  MockPercents();
}