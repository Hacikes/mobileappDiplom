import 'package:flutter/material.dart';

class button_get_account extends StatelessWidget {
  const button_get_account({
    super.key,
  });

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
            onPressed: () {},
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