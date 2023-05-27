import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_app_diplom/screen/home/home_instruments.dart';

class DrawlerFull {
  Function toggleView = () {};
  final BuildContext context;

  DrawlerFull(this.context);

  Drawer getDrawer() {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200], // задаем общий фон
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[700]!,
              ),
              child: Text(
                'Меню',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Главная'),
              onTap: () {
                // Обработчик нажатия на пункт меню
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeInstruments(toggleView: toggleView,)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet_outlined),
              title: Text('Счета'),
              onTap: () {
                // Обработчик нажатия на пункт меню
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text('Калькулятор'),
              onTap: () {
                // Обработчик нажатия на пункт меню
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text('Настройки'),
              onTap: () {
                // Обработчик нажатия на пункт меню
                Navigator.pop(context);
              },
            ),
            // Добавляем кнопку в нижней части боковой панели
            Spacer(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Выйти'),
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
}