import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';


class addInstrumentScreen extends StatefulWidget {
  const addInstrumentScreen({Key? key, required this.toggleView}) : super(key: key);


  final Function toggleView;

  @override
  State<addInstrumentScreen> createState() => _addInstrumentScreenState();
}

class _addInstrumentScreenState extends State<addInstrumentScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 60,
        child: Text('Экран добавления бумаги')
    );
  }
}

