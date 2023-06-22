import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/accounts_screen/accounts.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_accounts_srceen/add_account.dart';


class AddAccount extends StatefulWidget {
  const AddAccount({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {

  final _formKey = GlobalKey<FormState>();

  // Вводимые при регистрации поля
  String accountName = '';
  String brokerName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsClass.getBackgroundForSrceen(),
      appBar: AppBar(
        title: const Text('Создание счёта'),
        backgroundColor: ColorsClass.getBackgroundForAppbar(),
        elevation: 0.0,
        automaticallyImplyLeading: true,
        actions: const <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // SizedBox(height: 200.0,),

              SizedBox(height: 10.0,),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    accountName = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsClass.getBorderDecorationColor()),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsClass.getBorderDecorationColor()),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Наименование счёта',
                  filled: true,
                  fillColor: ColorsClass.getFrontForHintOnField(),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Введите наименование счёта';
                  } else if (!RegExp(r'^[a-zA-Z0-9а-яА-я\s]+$').hasMatch(val)) {
                    return 'Спец. символы в имени не допустимы';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    brokerName = value;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsClass.getBorderDecorationColor()),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsClass.getBorderDecorationColor()),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Наименование брокера',
                  filled: true,
                  fillColor: ColorsClass.getFrontForHintOnField(),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Введите наименование брокера';
                  } else if (!RegExp(r'^[a-zA-Z0-9а-яА-я\s]+$').hasMatch(val)) {
                    return 'Спец. символы в имени не допустимы';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    // print(accountName);
                    // print(brokerName);
                    final addAccountService = AddAccountService();

                    final statusCode =
                    await addAccountService.addAccount(accountName, brokerName);
                    switch (statusCode) {
                      case 200:
                      // Создание счёта прошел успешно, возврат на список счетов
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Accounts(toggleView: widget.toggleView,)),
                        );
                        break;
                      case 400:
                      // Ошибка 400, выводим сообщение об ошибке
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Необходимо заполнить все поля'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        break;
                      default:
                      // Обработка других статусов ответа
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Упс... Что-то пошло не так ...'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        break;
                    }
                  };
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsClass.getBackgroundForNotPressedButton(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(double.infinity, 40),
                ),
                child: Text(
                  'Создать счёт',
                  style: TextStyle(color:ColorsClass.getFrontForNotPressedButton()),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}



