import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'linuxapi/login.dart';

class LoginPage extends StatelessWidget {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录'),
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
                          style: const TextStyle(fontSize: 24),
                          hint: const DropdownMenuItem(
                              child: Text(
                                '手机号&密码登录',
                              ),
                              value: 1),
                          items: const [
                            DropdownMenuItem(
                                child: Text(
                                  '手机号&密码登录',
                                ),
                                value: 1),
                          ],
                          onChanged: (value) {}),
                      TextField(
                        controller: phone,
                        decoration: const InputDecoration(
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
                        decoration: const InputDecoration(
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
                          child: const Text('登录'),
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
