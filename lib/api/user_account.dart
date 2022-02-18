// ignore_for_file: unused_catch_clause

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:netease_cloudmusic_flutter/stores/user_profile_store.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'linux_api.dart';

Future<void> userAccount() async {
  String postData = '''
  {
    "method":"POST",
    "url":"https://music.163.com/api/nuser/account/get",
    "params":{}
  }
  ''';
  postData = neLinuxAPI(postData);
  Directory appDocDir = await getApplicationDocumentsDirectory();
  PersistCookieJar cookie = PersistCookieJar(
    ignoreExpires: true,
    storage: FileStorage(appDocDir.path + "/../cache/cookies"),
  );
  Dio dio = Dio(BaseOptions(contentType: "application/x-www-form-urlencoded"));
  dio.interceptors.add(CookieManager(cookie));
  dio.interceptors.add(
    DioCacheManager(
      CacheConfig(
        defaultMaxAge: const Duration(days: 114),
      ),
    ).interceptor,
  );
  Response response;
  try {
    response = await dio.post(
      "https://music.163.com/api/linux/forward",
      data: postData,
      options: buildCacheOptions(const Duration(days: 114), forceRefresh: true),
    );

    if (response.statusCode != 200) {
      return;
    }

    storeUserProfile.setID(response.data['profile']['userId'].toString());
    storeUserProfile.setNickname(response.data['profile']['nickname']);
    storeUserProfile.setAvatarUrl(response.data['profile']['avatarUrl']);
    storeUserProfile.setBackgroundUrl(
      response.data['profile']['backgroundUrl'],
    );
    storeUserProfile.setLoginStatus(true);

  } on DioError catch (e) {
    //error
  }
}
