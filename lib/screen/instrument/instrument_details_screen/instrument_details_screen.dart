import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';


class instrumentDetailsScreen extends StatefulWidget {
  const instrumentDetailsScreen({Key? key, required this.toggleView}) : super(key: key);


  final Function toggleView;

  @override
  State<instrumentDetailsScreen> createState() => _instrumentDetailsScreenState();
}

class _instrumentDetailsScreenState extends State<instrumentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Text('Экран инфы о бумаге')
    );
  }
}

