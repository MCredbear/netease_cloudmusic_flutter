import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

import 'LinuxAPI.dart';
import 'LoginProfile.dart';
import 'package:dio/dio.dart';

Future<void> loginCellphonePassword(String cellphone, String password) async {
  var password_md5 =
      hex.encode(md5.convert(Utf8Encoder().convert(password)).bytes);
  var postdata =
      '{"method":"POST","url":"https://music.163.com/api/login/cellphone","params":{"phone":"$cellphone","countrycode":"86","password":"$password_md5","rememberLogin":"true"}}';
  postdata = linuxAPI(postdata);
  Dio dio = Dio(BaseOptions(headers: {
    "Content-Type": "application/x-www-form-urlencoded",
    "Cookie": "NMTID=; MUSIC_U=; __remember_me=true; os=pc",
  }));
  Response response;
  response =
      await dio.post("https://music.163.com/api/linux/forward", data: postdata);
  loginprofile.setNickname(response.data['profile']['nickname']);
  loginprofile.setAvatarUrl(response.data['profile']['avatarUrl']);
  loginprofile.setBackgroundUrl(response.data['profile']['backgroundUrl']);
  loginprofile.setLogined(true);
}
