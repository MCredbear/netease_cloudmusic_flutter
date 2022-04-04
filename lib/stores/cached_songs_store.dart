// ignore_for_file: invalid_required_positional_param

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

part 'cached_songs_store.g.dart';

final CachedSongsStore storeCachedSongs = CachedSongsStore();

class CachedSongsStore = CachedSongsStoreBase with _$CachedSongsStore;

abstract class CachedSongsStoreBase with Store {
  @observable
  ObservableList<String> cachedSongs = ObservableList();

  @action
  Future<void> refreshCachedSongs() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Directory cachedMusicDir = Directory(appDocDir.path + "/cache/music");
    List<FileSystemEntity> _cachedSongs = cachedMusicDir.listSync();
    for (var song in _cachedSongs) {
      cachedSongs.add(song.path.substring(song.path.lastIndexOf('/') + 1));
    }
  }

  @action
  void addCachedSong(String id) => cachedSongs.add(id);

  Future<void> cacheSong(String url, String id) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    PersistCookieJar cookie = PersistCookieJar(
        ignoreExpires: true,
        storage: FileStorage(appDocDir.path + "/cache/cookies"));
    Dio dio = Dio(BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        responseType: ResponseType.bytes));
    dio.interceptors.add(CookieManager(cookie));
    Response response;
    try {
      response = await dio.get(url); //为防止意外关闭，不使用.download()，没下完不存进硬盘里
      File song = File(appDocDir.path + "/cache/music/" + id);
      Directory(appDocDir.path + "/cache/music/").createSync(recursive: true);
      song.writeAsBytesSync(response.data);
      addCachedSong(id);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
