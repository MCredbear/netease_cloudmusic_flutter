import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'linuxapi/linux_api.dart';
import 'linuxapi/login.dart';
import '../stores/user_profile_store.dart';

class LoginProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户信息'),
      ),
    );
  }
}
