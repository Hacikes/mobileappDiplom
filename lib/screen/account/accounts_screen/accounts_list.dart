import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_accounts_srceen/get_accounts_for_accounts_screen.dart';

class accounts_list extends StatefulWidget {
  const accounts_list({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<accounts_list> createState() => _accounts_listState();
}

class _accounts_listState extends State<accounts_list> {
  List<String> startAccountNames = [];
  List<String> startBrokerNames = [];
  List<double> startSumForAccount = [];
  String utf8RUB = '\u20BD';

  Future<void> getListAccounts() async {
    GetAccounts instance = GetAccounts();
    await instance.getAccounts();
    setState(() {
      startAccountNames = instance.accountNames;
      startBrokerNames = instance.brokerNames;
      startSumForAccount = instance.totalSumForAccount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: startAccountNames.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      startAccountNames[index],
                      style: TextStyle(
                        color: ColorsClass.getFrontForNotPressedButton(),
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      '${startSumForAccount[index]} $utf8RUB', // Стоимость
                      style: TextStyle(
                        color: ColorsClass.getFrontForNotPressedButton(),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                  startBrokerNames[index],
                  style: TextStyle(
                    color: ColorsClass.getFrontForNotPressedButton(),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 1,
                child: Divider(
                  color: ColorsClass.color_for_devider, // цвет черты
                  thickness: 1, // толщина черты
                  indent: 16, // отступ слева
                  endIndent: 16, // отступ справа
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getListAccounts();
  }
}
