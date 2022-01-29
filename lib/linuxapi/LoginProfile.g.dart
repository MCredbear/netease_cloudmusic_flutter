// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginProfile.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginProfile on LoginProfileBase, Store {
  final _$loginedAtom = Atom(name: 'LoginProfileBase.logined');

  @override
  bool get logined {
    _$loginedAtom.reportRead();
    return super.logined;
  }

  @override
  set logined(bool value) {
    _$loginedAtom.reportWrite(value, super.logined, () {
      super.logined = value;
    });
  }

  final _$nicknameAtom = Atom(name: 'LoginProfileBase.nickname');

  @override
  String get nickname {
    _$nicknameAtom.reportRead();
    return super.nickname;
  }

  @override
  set nickname(String value) {
    _$nicknameAtom.reportWrite(value, super.nickname, () {
      super.nickname = value;
    });
  }

  final _$avatarUrlAtom = Atom(name: 'LoginProfileBase.avatarUrl');

  @override
  String get avatarUrl {
    _$avatarUrlAtom.reportRead();
    return super.avatarUrl;
  }

  @override
  set avatarUrl(String value) {
    _$avatarUrlAtom.reportWrite(value, super.avatarUrl, () {
      super.avatarUrl = value;
    });
  }

  final _$backgroundUrlAtom = Atom(name: 'LoginProfileBase.backgroundUrl');

  @override
  String get backgroundUrl {
    _$backgroundUrlAtom.reportRead();
    return super.backgroundUrl;
  }

  @override
  set backgroundUrl(String value) {
    _$backgroundUrlAtom.reportWrite(value, super.backgroundUrl, () {
      super.backgroundUrl = value;
    });
  }

  final _$LoginProfileBaseActionController =
      ActionController(name: 'LoginProfileBase');

  @override
  void setLogined(bool logined) {
    final _$actionInfo = _$LoginProfileBaseActionController.startAction(
        name: 'LoginProfileBase.setLogined');
    try {
      return super.setLogined(logined);
    } finally {
      _$LoginProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNickname(String nickname) {
    final _$actionInfo = _$LoginProfileBaseActionController.startAction(
        name: 'LoginProfileBase.setNickname');
    try {
      return super.setNickname(nickname);
    } finally {
      _$LoginProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAvatarUrl(String avatarUrl) {
    final _$actionInfo = _$LoginProfileBaseActionController.startAction(
        name: 'LoginProfileBase.setAvatarUrl');
    try {
      return super.setAvatarUrl(avatarUrl);
    } finally {
      _$LoginProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBackgroundUrl(String backgroundUrl) {
    final _$actionInfo = _$LoginProfileBaseActionController.startAction(
        name: 'LoginProfileBase.setBackgroundUrl');
    try {
      return super.setBackgroundUrl(backgroundUrl);
    } finally {
      _$LoginProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
logined: ${logined},
nickname: ${nickname},
avatarUrl: ${avatarUrl},
backgroundUrl: ${backgroundUrl}
    ''';
  }
}
