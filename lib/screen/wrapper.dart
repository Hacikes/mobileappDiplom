import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/auth/authenticate.dart';
import 'package:mobile_app_diplom/screen/home/home_screen_with_diagrams/home_currency.dart';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';

// class Wrapper extends StatelessWidget {
//   const Wrapper({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     // return auth or home screen
//
//
//
//       if (userid == null) {
//         return Authenticate();
//       }
//       else{
//         return Home(toggleView: widget.toggleView,);
//       }
//
//   }
// }

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    if (userid == null) {
        return Authenticate();
      }
      else{
        return Home(toggleView: widget.toggleView,);
      }
  }
}
