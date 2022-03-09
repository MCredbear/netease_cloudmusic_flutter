// ignore_for_file: invalid_required_positional_param

import 'package:mobx/mobx.dart';

import 'song.dart';

part 'playlist_songs_store.g.dart';

final PlaylistSongsStore storePlaylistSongs = PlaylistSongsStore();

class PlaylistSongsStore = PlaylistSongsStoreBase with _$PlaylistSongsStore;

abstract class PlaylistSongsStoreBase with Store {
  String id = "";

  @observable
  ObservableList<Song> playlistSongs = ObservableList();

  @action
  void updatePlaylistSongs(ObservableList<Song> songs) => playlistSongs = songs;

  @action
  void removePlaylistSong(int index) => playlistSongs.removeAt(index);

  @action
  void clearPlaylistSongs() => playlistSongs.clear();
}
