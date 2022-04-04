// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'linux_api.dart';

Future<String> songUrl(String id) async {
  String postdata = '''
    {
    "method":"POST",
    "url":"https://interface3.music.163.com/api/song/enhance/player/url",
    "params":{
      "ids":"[$id]",
      "br":999000
      }
    }
  ''';
  postdata = neLinuxAPI(postdata);

  Directory appDocDir = await getApplicationDocumentsDirectory();

  PersistCookieJar cookie = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(appDocDir.path + "/cache/cookies"));
  Dio dio = Dio(BaseOptions(
      contentType: "application/x-www-form-urlencoded",
      responseType: ResponseType.json));
  dio.interceptors.add(CookieManager(cookie));
  dio.interceptors.add(
    DioCacheManager(
      CacheConfig(defaultMaxAge: const Duration(minutes: 2)),
    ).interceptor,
  );
  Response response;
  try {
    response = await dio.post("https://music.163.com/api/linux/forward",
        data: postdata,
        options: buildCacheOptions(const Duration(minutes: 2),
            maxStale: const Duration(days: 114))); //这个得缓存，多次获取会被网易云ban
    var json =
        jsonDecode(response.data); //不知道为啥，这个API设置了response type为json还是会返回text
    if (json['code'] == 500) return ''; //被网易云ban了
    String url = json['data'][0]['url'] ?? '';
    url = url.replaceFirst("http", "https"); //这里的Url默认是http而不是https，申必，，，
    return url;
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return '';
    //error
  }
}
