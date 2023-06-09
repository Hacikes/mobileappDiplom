import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/mock/mock_percents.dart';
import 'package:mobile_app_diplom/services/services_for_home_screen/services_for_home_currency_screen/get_percent_currency_on_all_instruments.dart';
import 'package:mobile_app_diplom/color/colors.dart';

class HomeCurrencyPercents extends StatefulWidget {
  HomeCurrencyPercents({Key? key}) : super(key: key);

  @override
  State<HomeCurrencyPercents> createState() => _HomeCurrencyPercentsState();
}

class _HomeCurrencyPercentsState extends State<HomeCurrencyPercents> {

  List<String> StartCurrencyName = ['XXX'];
  List<double> StartCurrencyPercent = [];
  List<Container> ContainerPercentsCurrency = MockPercents.MockContainerPercentsCurrency;


  Future<void> setupCurrencyNameAndCurrencyPercent() async {
    ShareOfCurrencyInAllInstruments instance = ShareOfCurrencyInAllInstruments();
    await instance.getShareOfCurrencyInAllInstruments();
    ColorsClass;

    setState(() {
      StartCurrencyName = instance.keys;
      StartCurrencyPercent = instance.values;
      ContainerPercentsCurrency = generateContainerPercentsCurrency(ColorsClass.getColors());
    });
  }


  List<Container> generateContainerPercentsCurrency(List<Color> colors) {
    List<Container> sectionDataList = [];
    for (int i = 0; i < StartCurrencyName.length; i++) {
      final children =
      Container(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                StartCurrencyName[i],
                style: TextStyle(
                  fontSize: 16.0,
                  color: ColorsClass.getFrontForGraphText(),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            //SizedBox(width: 20,),
            Container(
              width: 160.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: colors[i],
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            SizedBox(
              width: 60,
              child: Text(
                '${StartCurrencyPercent[i]} %',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 16.0,
                  color: ColorsClass.getFrontForGraphText(),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      );
      sectionDataList.add(children);
    }
    return sectionDataList;
  }
  // Весь виджет для вывода процентов, валюты и палосочки
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      child: SingleChildScrollView(
        child: Column(
          children: ContainerPercentsCurrency,
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    setupCurrencyNameAndCurrencyPercent();

  }
}

// Раньше это было в виджете
// -------------------------


// Container(
//   padding: EdgeInsets.all(12),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         "CR1",
//         style: TextStyle(
//           fontSize: 16.0,
//           color: Colors.white,
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//       Container(
//         width: 200.0,
//         height: 16.0,
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//       ),
//       Text(
//         "40 %",
//         style: TextStyle(
//           fontSize: 16.0,
//           color: Colors.white,
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//     ],
//   ),
// ),
// Container(
//   padding: EdgeInsets.all(12),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         "CR1",
//         style: TextStyle(
//           fontSize: 16.0,
//           color: Colors.white,
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//       Container(
//         width: 200.0,
//         height: 16.0,
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//       ),
//       Text(
//         "40 %",
//         style: TextStyle(
//           fontSize: 16.0,
//           color: Colors.white,
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//     ],
//   ),
// ),
// Container(
//   padding: EdgeInsets.all(12),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         "CR1",
//         style: TextStyle(
//           fontSize: 16.0,
//           color: Colors.white,
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//       Container(
//         width: 200.0,
//         height: 16.0,
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//       ),
//       Text(
//         "40 %",
//         style: TextStyle(
//           fontSize: 16.0,
//           color: Colors.white,
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//     ],
//   ),
// ),
// Container(
//   padding: EdgeInsets.all(12),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         "CR1",
//         style: TextStyle(
//           fontSize: 16.0,
//           color: Colors.white,
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//       Container(
//         width: 200.0,
//         height: 16.0,
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//       ),
//       Text(
//         "40 %",
//         style: TextStyle(
//           fontSize: 16.0,
//           color: Colors.white,
//           fontWeight: FontWeight.normal,
//         ),
//       ),
//     ],
//   ),
// ),
// ------------------