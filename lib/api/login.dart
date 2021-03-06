// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import 'package:netease_cloudmusic_flutter/api/record_recent_song.dart';
import 'package:netease_cloudmusic_flutter/api/user_playlist.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'linux_api.dart';
import 'user_account.dart';

Future<void> loginCellphonePassword(String cellphone, String password) async {
  String passwordMD5 = hex.encode(
    md5
        .convert(
          const Utf8Encoder().convert(password),
        )
        .bytes,
  );
  // CellPhone login method post form
  String postData = '''
  {
    "method":"POST",
    "url":"https://music.163.com/api/login/cellphone",
    "params":{
      "phone":"$cellphone",
      "countrycode":"86",
      "password":"$passwordMD5",
      "rememberLogin":"true"
      }
  }
      ''';
  postData = neLinuxAPI(postData);
  Directory appDocDir = await getApplicationDocumentsDirectory();
  PersistCookieJar cookie = PersistCookieJar(
    ignoreExpires: true,
    storage: FileStorage(appDocDir.path + "/cache/cookies"),
  );
  cookie.deleteAll();
  Dio dio = Dio(
    BaseOptions(
      headers: {"Cookie": "NMTID=; MUSIC_U=; __remember_me=true; os=pc"},
      contentType: "application/x-www-form-urlencoded",
    ),
  );
  dio.interceptors.add(CookieManager(cookie));
  Response response;
  try {
    response = await dio.post(
      "https://music.163.com/api/linux/forward",
      data: postData,
    );
    //用userAccount()而不是直接在这里给storeUserProfile赋值，这样就能缓存数据（总不可能每次获取用户信息都登录一次）
    userAccount().then((_) => recordRecentSong()).then((_) => userPlaylist());
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    //error
  }
}
