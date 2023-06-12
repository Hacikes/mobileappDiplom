import 'package:flutter/material.dart';
import 'package:mobile_app_diplom/color/colors.dart';
import 'package:mobile_app_diplom/screen/account/account_details_screen/account_screen_with_diagrams/account_datails_currency.dart';
import 'package:mobile_app_diplom/screen/account/edit_account_screen/edit_account_screen.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_accounts_srceen/delete_account.dart';
import 'package:mobile_app_diplom/services/services_for_account/services_for_accounts_srceen/get_accounts_for_accounts_screen.dart';
import 'package:mobile_app_diplom/mock/mock_accounts_list.dart';


int? GlobalAccountId;

class AccountsList extends StatefulWidget {
  const AccountsList({Key? key, required this.toggleView}) : super(key: key);

  final Function toggleView;

  @override
  State<AccountsList> createState() => _AccountsListState();
}

class _AccountsListState extends State<AccountsList> {
  List<String> startAccountNames = MockAccountsList.accountName;
  List<String> startBrokerNames = MockAccountsList.accountBroker;
  List<double> startSumForAccount = MockAccountsList.accountPrice;
  List<int> accountsId = [];
  String utf8RUB = '\u20BD';

  Future<void> getListAccounts() async {
    GetAccounts instance = GetAccounts();
    await instance.getAccounts();
    // print(instance.accountId);
    setState(() {
      startAccountNames = instance.accountNames;
      startBrokerNames = instance.brokerNames;
      startSumForAccount = instance.totalSumForAccount;
      accountsId = instance.accountId;
    });
  }

  // Функция записывающая account_id в глобальную переменную
  void setGlobalAccountId(int value) {
    GlobalAccountId = value;
    //print(GlobalAccountId);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: accountsId.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: ColorsClass.getBackgroundForBodyDrawer(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 100,
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  startAccountNames[index],
                                  style: TextStyle(
                                    color: ColorsClass.getFrontForNotPressedButton(),
                                    fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => EditAccount(toggleView: widget.toggleView, AccountName: startAccountNames[index], brokerName: startBrokerNames[index])),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorsClass.getBackgroundForNotPressedButton(),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          minimumSize: Size(double.infinity, 40),
                                        ),
                                        child: Text('Редактировать'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          final statusCode = await DeleteAccountService().deleteAccount(accountsId[index]);
                                          switch (statusCode) {
                                          case 200:
                                          // Удаление счёта прошло успешно, возврат списока счетов
                                            getListAccounts();
                                            Navigator.pop(context);
                                            break;
                                          default:
                                          // Обработка других статусов ответа
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Упс... Что-то пошло не так ...'),
                                                duration: Duration(seconds: 3),
                                              ),
                                            );
                                            Navigator.pop(context);
                                            break;
                                        }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorsClass.getBackgroundForNotPressedButton(),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          minimumSize: Size(double.infinity, 40),
                                        ),
                                        child: Text('Удалить'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: ListTile(
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
                      setGlobalAccountId(accountsId[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountDetailsCurrency(toggleView: widget.toggleView, AccountIdForDetails: accountsId[index], AccountNameForDetails: startAccountNames[index], BrokerNameForDetails: startBrokerNames[index])),
                      );
                    },
                  ),
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
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getListAccounts();
  }
}
