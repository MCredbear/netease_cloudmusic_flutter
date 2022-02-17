// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:mobx/mobx.dart';

import 'linux_api.dart';

Future<String> songUrl(String id) async {
  String postdata =
      '{"method":"POST","url":"https://interface3.music.163.com/api/song/enhance/player/url","params":{"ids":"[$id]","br":999000}}';
  postdata = linuxAPI(postdata);
  Directory appDocDir = await getApplicationDocumentsDirectory();
  PersistCookieJar cookie = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(appDocDir.path + "/../cache/cookies"));
  Dio dio = Dio(BaseOptions(
      contentType: "application/x-www-form-urlencoded",
      responseType: ResponseType.json));
  dio.interceptors.add(CookieManager(cookie));
  dio.interceptors.add(
      DioCacheManager(CacheConfig(defaultMaxAge: const Duration(days: 114)))
          .interceptor);
  Response response;
  try {
    response = await dio.post("https://music.163.com/api/linux/forward",
        data: postdata,
        options:
            buildCacheOptions(const Duration(days: 114), forceRefresh: true));
    var json =
        jsonDecode(response.data); //不知道为啥，这个API设置了response type为json还是会返回text
    //String url = json['data'][0]['url'] ?? '';
    String url =
        "http://m10.music.126.net/20220217003242/6cf75998a64c6a0808b0e361a0a5d73b/ymusic/0252/0559/5358/58f7a986a723406025fdd209a55d1873.mp3";
    url = url.replaceFirst("http", "https");
    print(url);
    return url;
  } on DioError catch (e) {
    //error
    return '';
  }
}
