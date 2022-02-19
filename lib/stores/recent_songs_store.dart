// ignore_for_file: invalid_required_positional_param

import 'package:mobx/mobx.dart';

import 'song.dart';

part 'recent_songs_store.g.dart';

final RecentSongsStore storeRecentSongs = RecentSongsStore();

class RecentSongsStore = RecentSongsStoreBase with _$RecentSongsStore;

abstract class RecentSongsStoreBase with Store {
  @observable
  ObservableList<Song> recentSongs = ObservableList();

  @action
  void updateRecentSongs(ObservableList<Song> songs) => recentSongs = songs;

  @action
  void removeRecentSong(int index) => recentSongs.removeAt(index);

  @action
  void clearRecentSongs() => recentSongs.clear();
}