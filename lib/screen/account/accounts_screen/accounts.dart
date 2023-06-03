import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts_list.dart';
import 'package:mobile_app_diplom/screen/account/accounts_screen/button_add_account.dart';
import 'package:mobile_app_diplom/screen/drawer/drawer.dart';


class Accounts extends StatefulWidget {
  const Accounts({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        backgroundColor: ColorsClass.getBackgroundForSrceen(),
        appBar: AppBar(
          title: const Text('Счета'),
          backgroundColor: ColorsClass.getBackgroundForAppbar(),
          elevation: 0.0,
          automaticallyImplyLeading: true, // Убираем кнопку "Назад"
          actions: const <Widget>[],
        ),
        body: Column(
          children: [
            AccountsList(toggleView: widget.toggleView),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: button_get_account(toggleView: widget.toggleView,),
            ),
          ],
        ),
        drawer: DrawerFull(context: this.context),
      ),
    );
  }

}
