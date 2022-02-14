import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'linux_api.dart';
import 'user_profile_store.dart';

Future<void> userPlaylist() async {
  String postdata =
      '{"method":"POST","url":"https://music.163.com/api/user/playlist","params":{"uid":"${userProfileStore.id}","limit":114,"offset":0,"includeVideo":true}}'; //应该没人歌单这么多罢，反正我没有（）
  postdata = linuxAPI(postdata);
  Directory appDocDir = await getApplicationDocumentsDirectory();
  PersistCookieJar cookie = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(appDocDir.path + "/../cache/cookies"));
  Dio dio = Dio(BaseOptions(contentType: "application/x-www-form-urlencoded"));
  dio.interceptors.add(CookieManager(cookie));
  dio.interceptors.add(
      DioCacheManager(CacheConfig(defaultMaxAge: Duration(days: 114)))
          .interceptor);
  Response response;
  try {
    response = await dio.post("https://music.163.com/api/linux/forward",
        data: postdata,
        options: buildCacheOptions(Duration(days: 114), forceRefresh: true));
    userProfileStore.setNickname(response.data['profile']['nickname']);
    userProfileStore.setAvatarUrl(response.data['profile']['avatarUrl']);
    userProfileStore
        .setBackgroundUrl(response.data['profile']['backgroundUrl']);
    userProfileStore.setLogined(true);
  } on DioError catch (e) {
    //error
  }
}
