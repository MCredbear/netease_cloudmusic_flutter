// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:netease_cloudmusic_flutter/stores/album.dart';
import 'package:netease_cloudmusic_flutter/stores/recent_songs_store.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:mobx/mobx.dart';

import '../stores/artitst.dart';
import '../stores/song.dart';
import 'linux_api.dart';

Future<void> recordRecentSong({String limit = "300"}) async {
  String postData = '''
    {
    "method":"POST",
    "url":"https://music.163.com/api/play-record/song/list",
    "params":{
      "limit":"$limit"
      }
    }
  ''';
  postData = neLinuxAPI(postData);

  Directory appDocDir = await getApplicationDocumentsDirectory();

  PersistCookieJar cookie = PersistCookieJar(
    ignoreExpires: true,
    storage: FileStorage(appDocDir.path + "/../cache/cookies"),
  );
  Dio dio = Dio(
    BaseOptions(contentType: "application/x-www-form-urlencoded"),
  );
  dio.interceptors.add(
    CookieManager(cookie),
  );
  dio.interceptors.add(
    DioCacheManager(
      CacheConfig(defaultMaxAge: const Duration(days: 114)),
    ).interceptor,
  );
  Response response = await dio.post(
    "https://music.163.com/api/linux/forward",
    data: postData,
    options: buildCacheOptions(const Duration(days: 114), forceRefresh: true),
  );
  ObservableList<Song> _recentSongs = ObservableList();
  List songs = response.data['data']['list'];
  for (var song in songs) {
    //读取歌手
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
      artists_
          .add(Artist(artist['name'], artist['id'].toString(), artist_alias_));
    }
    //读取别称
    List alias = song['data']['alia'];
    ObservableList alias_ = ObservableList();
    for (var alia in alias) {
      alias_.add(alia);
    }
    Map data = song['data'];
    if (data.containsKey('tns')) {
      alias_.add(data['tns'][0]); //我就不信这还能有俩值
    }
    //读取专辑
    Map album = song['data']['al'];
    ObservableList albumAlias = ObservableList();
    for (var alia in album['tns']) {
      albumAlias.add(alia);
    }
    Album album_ = Album(album['name'], album['id'].toString(),
        album['picUrl'].replaceFirst("http", "https"), albumAlias);

    _recentSongs.add(Song(song['data']['name'], song['data']['id'].toString(),
        alias_, artists_, album_)); //这里的Url默认是http而不是https，申必，，，
  }
  storeRecentSongs.updateRecentSongs(_recentSongs);
}
