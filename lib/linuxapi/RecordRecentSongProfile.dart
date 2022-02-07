import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

part 'RecordRecentSongProfile.g.dart';

final RecordRecentSongProfile recordrecentsongprofile =
    RecordRecentSongProfile();

class RecordRecentSongProfile = RecordRecentSongProfileBase
    with _$RecordRecentSongProfile;

abstract class RecordRecentSongProfileBase with Store {
  @observable
  ObservableList<Song> recentSongs = ObservableList();
  @action
  void addRecentSong(Song song) {
    recentSongs.add(song);
  }

  @action
  void removeRecentSong(int index) {
    recentSongs.removeAt(index);
  }

  //if this is an action,UI's refreshing will be ugly
  void clearRecentSong() {
    recentSongs.clear();
  }
}

String combineArtistsName(int index) {
  String text = recordrecentsongprofile.recentSongs[index].artists[0].name;
  for (int i = 1;
      i < recordrecentsongprofile.recentSongs[index].artists.length;
      i++)
    text += "/" + recordrecentsongprofile.recentSongs[index].artists[i].name;

  return text;
}

class Song {
  String name;
  int id;
  ObservableList alias;
  ObservableList<Artist> artists;
  String coverUrl;
  Song(
    @required this.name,
    @required this.id,
    @required this.alias,
    @required this.artists,
    @required this.coverUrl,
  ) {}
}

class Artist {
  String name;
  int id;
  ObservableList alias;
  Artist(@required this.name, @required this.id, @required this.alias) {}
}
