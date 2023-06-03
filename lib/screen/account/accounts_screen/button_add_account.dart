import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/screen/account/add_account_screen/add_account.dart';


class button_get_account extends StatefulWidget {
  const button_get_account({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<button_get_account> createState() => _button_get_accountState();
}

class _button_get_accountState extends State<button_get_account> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAccount(toggleView: widget.toggleView,)),
              );
            },
            child: Text("Добавить счёт"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ),
      ),
    );
  }
}

