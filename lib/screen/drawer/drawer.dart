import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/mock/mock_user_info_on_drawer.dart';
import 'package:mobile_app_diplom/screen/home/home_instruments.dart';
import 'package:mobile_app_diplom/services/services_for_drawer/get_username_and_email.dart';

class DrawerFull extends StatefulWidget {
  DrawerFull({required this.context});

  final BuildContext context;

  @override
  _DrawerFullState createState() => _DrawerFullState();
}

class _DrawerFullState extends State<DrawerFull> {
  Function toggleView = () {};

  String username_on_drawer = MockUsernameAndEmail.getMockUsername();
  String email_on_drawer = MockUsernameAndEmail.getMockEmail();

  Future<void> setupUserInfo() async {
    UserMe instance = UserMe();
    await instance.getUserMe();
    print(instance.username);
    //print(instance.email);
    setState(() {
      username_on_drawer = instance.username;
      email_on_drawer = instance.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: ColorsClass.getBackgroundForBodyDrawer(), // задаем общий фон
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: ColorsClass.getBackgroundForHeaderDrawer(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username_on_drawer,
                    style: TextStyle(
                      fontSize: 24,
                      color: ColorsClass.getFrontForNotPressedButton(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    email_on_drawer,
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorsClass.getFrontForNotPressedButton(),
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              ),

            ),
            ListTile(
              leading: Icon(
                Icons.home_outlined,
                color: ColorsClass.getPouringForIcon(),
              ),
              title: Text(
                'Главная',
                style: TextStyle(
                  color: ColorsClass.getFrontForNotPressedButton(),
                ),
              ),
              onTap: () {
                // Обработчик нажатия на пункт меню
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeInstruments(toggleView: toggleView,)),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_balance_wallet_outlined,
                color: ColorsClass.getPouringForIcon(),
              ),
              title: Text(
                'Счета',
                style: TextStyle(
                  color: ColorsClass.getFrontForNotPressedButton(),
                ),
              ),
              onTap: () {
                // Обработчик нажатия на пункт меню
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.calculate_outlined,
                color: ColorsClass.getPouringForIcon(),
              ),
              title: Text(
                'Калькулятор',
                style: TextStyle(
                  color: ColorsClass.getFrontForNotPressedButton(),
                ),
              ),
              onTap: () {
                // Обработчик нажатия на пункт меню
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings_outlined,
                color: ColorsClass.getPouringForIcon(),
              ),
              title: Text(
                'Настройки',
                style: TextStyle(
                  color: ColorsClass.getFrontForNotPressedButton(),
                ),
              ),
              onTap: () {
                // Обработчик нажатия на пункт меню
                Navigator.pop(context);
              },
            ),
            // Добавляем кнопку в нижней части боковой панели
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: ColorsClass.getPouringForIcon(),
              ),
              title: Text(
                'Выйти',
                style: TextStyle(
                  color: ColorsClass.getFrontForNotPressedButton(),
                ),
              ),
              onTap: () {
                // Обработчик нажатия на кнопку
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    setupUserInfo();

  }
}







// class DrawlerFull {
//   Function toggleView = () {};
//   final BuildContext context;
//
//   DrawlerFull(this.context);
//
//   Drawer getDrawer() {
//     return Drawer(
//       child: Container(
//         decoration: BoxDecoration(
//           color: ColorsClass.getBackgroundForBodyDrawer(), // задаем общий фон
//         ),
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: ColorsClass.getBackgroundForHeaderDrawer(),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Имя',
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: ColorsClass.getFrontForNotPressedButton(),
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   Text(
//                     'Почта',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: ColorsClass.getFrontForNotPressedButton(),
//                       fontWeight: FontWeight.w300
//                     ),
//                   ),
//                 ],
//               ),
//
//             ),
//             ListTile(
//               leading: Icon(
//                   Icons.home_outlined,
//                   color: ColorsClass.getPouringForIcon(),
//               ),
//               title: Text(
//                   'Главная',
//                 style: TextStyle(
//                   color: ColorsClass.getFrontForNotPressedButton(),
//                 ),
//               ),
//               onTap: () {
//                 // Обработчик нажатия на пункт меню
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => HomeInstruments(toggleView: toggleView,)),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                   Icons.account_balance_wallet_outlined,
//                   color: ColorsClass.getPouringForIcon(),
//               ),
//               title: Text(
//                 'Счета',
//                 style: TextStyle(
//                   color: ColorsClass.getFrontForNotPressedButton(),
//                 ),
//               ),
//               onTap: () {
//                 // Обработчик нажатия на пункт меню
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                   Icons.calculate_outlined,
//                   color: ColorsClass.getPouringForIcon(),
//               ),
//               title: Text(
//                   'Калькулятор',
//                 style: TextStyle(
//                   color: ColorsClass.getFrontForNotPressedButton(),
//                 ),
//               ),
//               onTap: () {
//                 // Обработчик нажатия на пункт меню
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(
//                   Icons.settings_outlined,
//                   color: ColorsClass.getPouringForIcon(),
//               ),
//               title: Text(
//                   'Настройки',
//                 style: TextStyle(
//                   color: ColorsClass.getFrontForNotPressedButton(),
//                 ),
//               ),
//               onTap: () {
//                 // Обработчик нажатия на пункт меню
//                 Navigator.pop(context);
//               },
//             ),
//             // Добавляем кнопку в нижней части боковой панели
//             Spacer(),
//             ListTile(
//               leading: Icon(
//                   Icons.logout,
//                 color: ColorsClass.getPouringForIcon(),
//               ),
//               title: Text(
//                   'Выйти',
//                 style: TextStyle(
//                   color: ColorsClass.getFrontForNotPressedButton(),
//                 ),
//               ),
//               onTap: () {
//                 // Обработчик нажатия на кнопку
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }