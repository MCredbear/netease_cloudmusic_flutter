import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:mobx/mobx.dart';

import 'LinuxAPI.dart';
import 'RecentSongsStore.dart';

Future<void> recordRecentSong({String limit = "300"}) async {
  String postdata =
      '{"method":"POST","url":"https://music.163.com/api/play-record/song/list","params":{"limit":"$limit"}}';
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
  ;
  response = await dio.post("https://music.163.com/api/linux/forward",
      data: postdata,
      options: buildCacheOptions(Duration(days: 114), forceRefresh: true));
  ObservableList<Song> _recentSongs = ObservableList();
  List songs = response.data['data']['list'];
  for (var song in songs) {
    List artists = song['data']['ar'];
    ObservableList<Artist> artists_ = ObservableList();
    for (var artist in artists) {
      List artist_alias = artist['alias'];
      ObservableList artist_alias_ = ObservableList();
      for (var alia in artist_alias) {
        //我就不信这还能有俩值
        artist_alias_.add(alia);
      }
      artist_alias = artist['tns'];
      for (var alia in artist_alias) {
        //我就不信这还能有俩值
        artist_alias_.add(alia);
      }
      artists_.add(Artist(artist['name'], artist['id'], artist_alias_));
    }
    List alias = song['data']['alia'];
    ObservableList alias_ = ObservableList();
    for (var alia in alias) {
      alias_.add(alia);
    }
    Map data = song['data'];
    if (data.containsKey('tns')) {
      alias_.add(data['tns'][0]); //我就不信这还能有俩值
    }
    _recentSongs.add(Song(song['data']['name'], song['data']['id'], alias_,
        artists_, song['data']['al']['picUrl']));
  }
  recentSongsStore.updateRecentSongs(_recentSongs);
}
