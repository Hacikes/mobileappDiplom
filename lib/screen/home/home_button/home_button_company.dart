import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/home/home_assets.dart';
import 'package:mobile_app_diplom/screen/home/home_company.dart';
import 'package:mobile_app_diplom/screen/home/home_instruments.dart';
import 'package:mobile_app_diplom/screen/home/home_currency.dart';

class home_button_company extends StatefulWidget {
  const home_button_company({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<home_button_company> createState() => _home_button_companyState();
}

class _home_button_companyState extends State<home_button_company> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home(toggleView: widget.toggleView,)),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Валюты"),
          ),
          SizedBox(width: 10,),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeInstruments(toggleView: widget.toggleView,)),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Инструменты"),
          ),
          SizedBox(width: 10,),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeAssets(toggleView: widget.toggleView,)),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Активы"),
          ),
          SizedBox(width: 10,),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeCompany(toggleView: widget.toggleView,)),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text("Компании"),
          ),
        ],
      ),
    );
  }
}