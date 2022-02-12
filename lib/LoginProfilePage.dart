import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'linuxapi/LinuxAPI.dart';
import 'linuxapi/Login.dart';
import 'linuxapi/UserProfileStore.dart';

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
