import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/home/home_currency.dart';
import 'package:mobile_app_diplom/screen/auth/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    // return auth or home screen

      return Authenticate();

  }
}
