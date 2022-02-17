// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserProfileStore on UserProfileStoreBase, Store {
  final _$loginedAtom = Atom(name: 'UserProfileStoreBase.logined');

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

  final _$idAtom = Atom(name: 'UserProfileStoreBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$nicknameAtom = Atom(name: 'UserProfileStoreBase.nickname');

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

  final _$avatarUrlAtom = Atom(name: 'UserProfileStoreBase.avatarUrl');

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

  final _$backgroundUrlAtom = Atom(name: 'UserProfileStoreBase.backgroundUrl');

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

  final _$UserProfileStoreBaseActionController =
      ActionController(name: 'UserProfileStoreBase');

  @override
  void setLoginStatus(bool logined) {
    final _$actionInfo = _$UserProfileStoreBaseActionController.startAction(
        name: 'UserProfileStoreBase.setLoginStatus');
    try {
      return super.setLoginStatus(logined);
    } finally {
      _$UserProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setID(String id) {
    final _$actionInfo = _$UserProfileStoreBaseActionController.startAction(
        name: 'UserProfileStoreBase.setID');
    try {
      return super.setID(id);
    } finally {
      _$UserProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNickname(String nickname) {
    final _$actionInfo = _$UserProfileStoreBaseActionController.startAction(
        name: 'UserProfileStoreBase.setNickname');
    try {
      return super.setNickname(nickname);
    } finally {
      _$UserProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAvatarUrl(String avatarUrl) {
    final _$actionInfo = _$UserProfileStoreBaseActionController.startAction(
        name: 'UserProfileStoreBase.setAvatarUrl');
    try {
      return super.setAvatarUrl(avatarUrl);
    } finally {
      _$UserProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBackgroundUrl(String backgroundUrl) {
    final _$actionInfo = _$UserProfileStoreBaseActionController.startAction(
        name: 'UserProfileStoreBase.setBackgroundUrl');
    try {
      return super.setBackgroundUrl(backgroundUrl);
    } finally {
      _$UserProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
logined: ${logined},
id: ${id},
nickname: ${nickname},
avatarUrl: ${avatarUrl},
backgroundUrl: ${backgroundUrl}
    ''';
  }
}
