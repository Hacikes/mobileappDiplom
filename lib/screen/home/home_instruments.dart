import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/home/button_get_list.dart';
// import 'package:pie_chart/pie_chart.dart';
import 'package:mobile_app_diplom/screen/home/home_dashboard/home_currency_dashboard.dart';
import 'package:mobile_app_diplom/screen/home/home_button/home_button_currency.dart';
import 'package:mobile_app_diplom/screen/home/home_dashboard/home_instruments_dashboard.dart';
import 'package:mobile_app_diplom/screen/home/home_percents/home_percents_currency.dart';
import 'package:mobile_app_diplom/screen/home/home_percents/home_percents_instruments.dart';

import 'home_button/home_button_instruments.dart';


class HomeInstruments extends StatefulWidget {
  const HomeInstruments({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<HomeInstruments> createState() => _HomeInstrumentsState();
}

class _HomeInstrumentsState extends State<HomeInstruments> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.black54,
          elevation: 0.0,
          automaticallyImplyLeading: false, // Убираем кнопку "Назад"
          actions: const <Widget>[
          ],
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10.0,),
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
              child: Text(
                'По всем счетам',
                style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10.0,),
            home_button_instruments(toggleView: widget.toggleView,),
            const SizedBox(height: 10,),
            home_instruments_dashboard(),
            // SizedBox(height: 0.0,),
            HomeInstrumentsPercents(),
            const SizedBox(height: 10,),
            const button_Get_list(),
          ],
        ),
      ),
    );
  }
}





