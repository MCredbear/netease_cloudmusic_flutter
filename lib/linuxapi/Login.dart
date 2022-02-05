import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'LinuxAPI.dart';
import 'LoginProfile.dart';

Future<void> loginCellphonePassword(String cellphone, String password) async {
  cellphone = "13819254482";
  password = "!hr2000?";
  String passwordmd5 =
      hex.encode(md5.convert(Utf8Encoder().convert(password)).bytes);
  String postdata =
      '{"method":"POST","url":"https://music.163.com/api/login/cellphone","params":{"phone":"$cellphone","countrycode":"86","password":"$passwordmd5","rememberLogin":"true"}}';
  postdata = linuxAPI(postdata);
  Directory appDocDir = await getApplicationDocumentsDirectory();
  PersistCookieJar cookie = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(appDocDir.path + "/cache/cookies"));
  cookie.deleteAll();
  Dio dio = Dio(BaseOptions(headers: {
    "Cookie": "NMTID=; MUSIC_U=; __remember_me=true; os=pc",
  }, contentType: "application/x-www-form-urlencoded"));
  dio.interceptors.add(CookieManager(cookie));
  Response response;
  try {
    response = await dio.post("https://music.163.com/api/linux/forward",
        data: postdata);
    loginprofile.setNickname(response.data['profile']['nickname']);
    loginprofile.setAvatarUrl(response.data['profile']['avatarUrl']);
    loginprofile.setBackgroundUrl(response.data['profile']['backgroundUrl']);
    loginprofile.setLogined(true);
  } on DioError catch (e) {
    //error
  }
}
