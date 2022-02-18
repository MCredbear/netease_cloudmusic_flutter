import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';
import 'package:netease_cloudmusic_flutter/stores/user_playlists_store.dart';
import 'package:netease_cloudmusic_flutter/stores/user_profile_store.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:mobx/mobx.dart';

import 'linux_api.dart';

Future<void> userPlaylist() async {
  String postData = '''
  {
    "method":"POST",
    "url":"https://music.163.com/api/user/playlist",
    "params":{
      "uid":"${storeUserProfile.id}",
      "limit":114,
      "offset":0,
      "includeVideo":true
      }
  }
  ''';

  postData = neLinuxAPI(postData);
  Directory appDocDir = await getApplicationDocumentsDirectory();
  PersistCookieJar cookie = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage(appDocDir.path + "/../cache/cookies"));
  Dio dio = Dio(
    BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        responseType: ResponseType.json),
  );
  dio.interceptors.add(CookieManager(cookie));
  dio.interceptors.add(
      DioCacheManager(CacheConfig(defaultMaxAge: const Duration(days: 114)))
          .interceptor);
  Response response;
  try {
    response = await dio.post(
      "https://music.163.com/api/linux/forward",
      data: postData,
      options: buildCacheOptions(const Duration(days: 114), forceRefresh: true),
    );
    //不知道为啥，这个API设置了response type为json还是会返回text
    var json = jsonDecode(response.data);
    List playlists = json['playlist'];
    ObservableList<Playlist> myPlaylists = ObservableList();
    ObservableList<Playlist> subscribedPlaylists = ObservableList();
    for (var playlist in playlists) {
      if (playlist['subscribed']) {
        if (kDebugMode) {
          print("YES");
        }
        subscribedPlaylists.add(Playlist(
            playlist['name'],
            playlist['id'].toString(),
            playlist['coverImgUrl'],
            playlist['description'] ?? '',
            playlist['trackCount'].toString(),
            playlist['playCount'].toString(),
            playlist['creator']['nickname'],
            playlist['creator']['id'].toString(),
            playlist['creator']['avatarUrl']));
      } else {
        if (kDebugMode) {
          print("NO");
        }
        myPlaylists.add(Playlist(
            playlist['name'],
            playlist['id'].toString(),
            playlist['coverImgUrl'],
            playlist['description'] ?? '',
            playlist['trackCount'].toString(),
            playlist['playCount'].toString(),
            playlist['creator']['nickname'],
            playlist['creator']['id'].toString(),
            playlist['creator']['avatarUrl']));
      }
    }
    storeUserPlaylists.updatePlaylists(myPlaylists, subscribedPlaylists);
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e);
    }
    //error
  }
}
