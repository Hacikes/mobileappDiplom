import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/auth/sigh_in.dart';
import 'package:mobile_app_diplom/screen/home/home.dart';
import 'package:mobile_app_diplom/screen/loading/loading.dart';
import 'package:mobile_app_diplom/screen/wrapper.dart';

void main() => runApp(MaterialApp (
  home: Wrapper()
));


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/sign_in',
//       routes: {
//         '/': (context) => Loading(),
//         '/home': (context) => Home(),
//         '/sign_in': (context) => SignIn()
//       },
//     );
//   }
// }
