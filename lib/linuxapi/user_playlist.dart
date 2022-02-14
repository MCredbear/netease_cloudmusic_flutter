import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:mobx/mobx.dart';

import 'linux_api.dart';
import 'user_profile_store.dart';
import 'user_playlists_store.dart';

Future<void> userPlaylist() async {
  String postdata =
      '{"method":"POST","url":"https://music.163.com/api/user/playlist","params":{"uid":"${userProfileStore.id}","limit":114,"offset":0,"includeVideo":true}}';
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
    List playlists = json['playlist'];
    ObservableList<Playlist> myPlaylists = ObservableList();
    ObservableList<Playlist> subscribedPlaylists = ObservableList();
    for (var playlist in playlists) {
      if (playlist['subscribed']) {
        print("YES");
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
        print("NO");
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
    userPlaylistsStore.updataPlaylists(myPlaylists, subscribedPlaylists);
  } on DioError catch (e) {
    //error
  }
}
