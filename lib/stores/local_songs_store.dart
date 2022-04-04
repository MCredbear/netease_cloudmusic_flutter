// ignore_for_file: invalid_required_positional_param

import 'dart:io';

import 'package:mobx/mobx.dart';

part 'local_songs_store.g.dart';

final LocalSongsStore storeLocalSongs = LocalSongsStore();

class LocalSongsStore = LocalSongsStoreBase with _$LocalSongsStore;

abstract class LocalSongsStoreBase with Store {
  @observable
  ObservableList<FileSystemEntity> localSongs = ObservableList();

  @action
  Future<void> refreshLocalSongs() async {
    Directory musicDir = Directory("/sdcard/Music");
    List<FileSystemEntity> _localSongs = musicDir.listSync();
    localSongs.addAll(_localSongs);
  }

  @action
  void removeLocalSong(int index) => localSongs.removeAt(index);
}
