import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/home/button_get_list.dart';
// import 'package:pie_chart/pie_chart.dart';
import 'package:mobile_app_diplom/screen/home/home_dashboard/home_currency_dashboard.dart';
import 'package:mobile_app_diplom/screen/home/home_button/home_button_currency.dart';
import 'package:mobile_app_diplom/screen/home/home_percents/home_percents_currency.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: Colors.black54,
          elevation: 0.0,
          automaticallyImplyLeading: false, // Убираем кнопку "Назад"
          actions: <Widget>[
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'General Info',
                style: TextStyle(
                  fontSize: 36.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.0,),
            home_button_currency(),
            SizedBox(height: 10,),
            home_currency_dashboard(),
            // SizedBox(height: 0.0,),
            HomeCurrencyPercents(),
            SizedBox(height: 10,),
            button_Get_list(),
          ],
        ),
      ),
    );
  }
}





