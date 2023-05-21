import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:mobile_app_diplom/services/services_for_auth/sign_in.dart';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class RecoveryPassword {

  Future<int> recoveryPassword(String sender) async {
    final smtpServer = gmail('volna4753@gmail.com', 'Ilove1613!');
    final message = Message()
      ..from = Address(sender, 'Test')
      ..recipients.add('volna4753@gmail.com')
      ..subject = "Восстановление пароля"
      ..text = "Чувак забыл пароль, надо бы его восстановить";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      return 200; // Здесь возвращаем статус код ответа
    } on MailerException catch (e) {
      print('Message not sent. ${e.toString()}');
      return 500; // Здесь возвращаем статус код ошибки
    }
  }
}