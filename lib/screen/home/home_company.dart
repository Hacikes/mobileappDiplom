import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/drawer/drawer.dart';
import 'package:mobile_app_diplom/screen/home/button_get_list.dart';
import 'package:mobile_app_diplom/screen/home/home_button/home_button_company.dart';
import 'package:mobile_app_diplom/screen/home/home_dashboard/home_companies_dashboard.dart';
import 'package:mobile_app_diplom/screen/home/home_percents/home_percents_company.dart';


class HomeCompany extends StatefulWidget {
  const HomeCompany({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<HomeCompany> createState() => _HomeCompanyState();
}

class _HomeCompanyState extends State<HomeCompany> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: ColorsClass.getBackgroundForSrceen(),
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: ColorsClass.getBackgroundForAppbar(),
          elevation: 0.0,
          automaticallyImplyLeading: true, // Убираем кнопку "Назад"
          actions: const <Widget>[
          ],
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10.0,),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
              child: Text(
                'По всем счетам',
                style: TextStyle(
                  fontSize: 36.0,
                  color: ColorsClass.getFrontForHeaderText(),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10.0,),
            home_button_company(toggleView: widget.toggleView,),
            const SizedBox(height: 10,),
            home_companies_dashboard(),
            // SizedBox(height: 0.0,),
            HomeCompaniesPercents(),
            const SizedBox(height: 10,),
            const button_Get_list(),
          ],
        ),
        drawer: DrawlerFull(context).getDrawer(),
      ),
    );
  }
}





