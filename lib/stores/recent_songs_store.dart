import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

part 'recent_songs_store.g.dart';

final RecentSongsStore recentSongsStore = RecentSongsStore();

class RecentSongsStore = RecentSongsStoreBase with _$RecentSongsStore;

abstract class RecentSongsStoreBase with Store {
  @observable
  ObservableList<Song> recentSongs = ObservableList();
  @action
  void updateRecentSongs(ObservableList<Song> songs) {
    recentSongs = songs;
  }

  @action
  void removeRecentSong(int index) {
    recentSongs.removeAt(index);
  }

  @action
  void clearRecentSongs() {
    recentSongs.clear();
  }
}

class Song {
  String name;
  String id;
  ObservableList alias;
  ObservableList<Artist> artists;
  String combinedArtistsName() {
    String text = artists[0].name;
    for (int i = 1; i < artists.length; i++) {
      text += "/" + artists[i].name;
    }
    return text;
  }

  String coverUrl;
  Song(
    @required this.name,
    @required this.id,
    @required this.alias,
    @required this.artists,
    @required this.coverUrl,
  );
}

class Artist {
  String name;
  String id;
  ObservableList alias;
  Artist(@required this.name, @required this.id, @required this.alias);
}
