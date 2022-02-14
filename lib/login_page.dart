import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'linuxapi/linux_api.dart';
import 'linuxapi/login.dart';
import 'linuxapi/user_profile_store.dart';

class LoginPage extends StatelessWidget {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Row(
        children: [
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton(
                          style: TextStyle(fontSize: 24),
                          hint: DropdownMenuItem(
                              child: Text(
                                '手机号&密码登录',
                              ),
                              value: 1),
                          items: [
                            DropdownMenuItem(
                                child: Text(
                                  '手机号&密码登录',
                                ),
                                value: 1),
                          ],
                          onChanged: (value) {}),
                      TextField(
                        controller: phone,
                        decoration: InputDecoration(
                          hintText: "手机号",
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                          hintText: "密码",
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.grey.shade800)),
                          onPressed: () {
                            loginCellphonePassword(phone.text, password.text);
                            Navigator.pop(context);
                          },
                          child: Text('登录'),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(flex: 2, child: Container()),
              ],
            ),
          ),
          Expanded(flex: 1, child: Container()),
        ],
      ),
    );
  }
}
