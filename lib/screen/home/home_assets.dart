import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/drawer/drawer.dart';
import 'package:mobile_app_diplom/screen/home/button_get_list.dart';
import 'package:mobile_app_diplom/screen/home/home_dashboard/home_assets_dashboard.dart';
import 'package:mobile_app_diplom/screen/home/home_button/home_button_assets.dart';
import 'package:mobile_app_diplom/screen/home/home_percents/home_percents_assets.dart';


class HomeAssets extends StatefulWidget {
  const HomeAssets({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<HomeAssets> createState() => _HomeAssetsState();
}

class _HomeAssetsState extends State<HomeAssets> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: ColorsClass.getBackgroundForSrceen(),
        appBar: AppBar(
          title: Text('Home'),
          backgroundColor: ColorsClass.background_for_appbar,
          elevation: 0.0,
          automaticallyImplyLeading: true, // Убираем кнопку "Назад"
          actions: <Widget>[
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
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
            SizedBox(height: 10.0,),
            home_button_assets(toggleView: widget.toggleView,),
            SizedBox(height: 10,),
            home_assets_dashboard(),
            // SizedBox(height: 0.0,),
            HomeAssetsPercents(),
            SizedBox(height: 10,),
            button_Get_list(),
          ],
        ),
        drawer: DrawerFull(context: this.context,),
      ),
    );
  }
}





