import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'user_playlists_store.g.dart';

final UserPlaylistsStore userPlaylistsStore = UserPlaylistsStore();

class UserPlaylistsStore = UserPlaylistsStoreBase with _$UserPlaylistsStore;

abstract class UserPlaylistsStoreBase with Store {
  @observable
  ObservableList<Playlist> myPlaylists = ObservableList();

  @observable
  ObservableList<Playlist> subscribedPlaylists = ObservableList();

  @action
  void updataPlaylists(ObservableList<Playlist> myPlaylists,
      ObservableList<Playlist> subscribedPlaylists) {
    this.myPlaylists = myPlaylists;
    this.subscribedPlaylists = subscribedPlaylists;
  }
}

class Playlist {
  String name;
  String id;
  String coverUrl;
  String description;
  String trackCount;
  String playCount;
  Playlist(
      @required this.name,
      @required this.id,
      @required this.coverUrl,
      @required this.description,
      @required this.trackCount,
      @required this.playCount);
}
