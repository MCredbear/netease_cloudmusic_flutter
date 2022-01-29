import 'dart:ffi';

import 'package:mobx/mobx.dart';

part 'LoginProfile.g.dart';

final LoginProfile loginprofile = LoginProfile();

class LoginProfile = LoginProfileBase with _$LoginProfile;

abstract class LoginProfileBase with Store {
  @observable
  bool logined = false;
  @action
  void setLogined(bool logined) {
    this.logined = logined;
  }

  @observable
  String nickname = '';
  @action
  void setNickname(String nickname) {
    this.nickname = nickname;
  }

  @observable
  String avatarUrl = '';
  @action
  void setAvatarUrl(String avatarUrl) {
    this.avatarUrl = avatarUrl;
  }

  @observable
  String backgroundUrl = '';
  @action
  void setBackgroundUrl(String backgroundUrl) {
    this.backgroundUrl = backgroundUrl;
  }
}
