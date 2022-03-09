// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_songs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaylistSongsStore on PlaylistSongsStoreBase, Store {
  final _$playlistSongsAtom =
      Atom(name: 'PlaylistSongsStoreBase.playlistSongs');

  @override
  ObservableList<Song> get playlistSongs {
    _$playlistSongsAtom.reportRead();
    return super.playlistSongs;
  }

  @override
  set playlistSongs(ObservableList<Song> value) {
    _$playlistSongsAtom.reportWrite(value, super.playlistSongs, () {
      super.playlistSongs = value;
    });
  }

  final _$PlaylistSongsStoreBaseActionController =
      ActionController(name: 'PlaylistSongsStoreBase');

  @override
  void updatePlaylistSongs(ObservableList<Song> songs) {
    final _$actionInfo = _$PlaylistSongsStoreBaseActionController.startAction(
        name: 'PlaylistSongsStoreBase.updatePlaylistSongs');
    try {
      return super.updatePlaylistSongs(songs);
    } finally {
      _$PlaylistSongsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePlaylistSong(int index) {
    final _$actionInfo = _$PlaylistSongsStoreBaseActionController.startAction(
        name: 'PlaylistSongsStoreBase.removePlaylistSong');
    try {
      return super.removePlaylistSong(index);
    } finally {
      _$PlaylistSongsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearPlaylistSongs() {
    final _$actionInfo = _$PlaylistSongsStoreBaseActionController.startAction(
        name: 'PlaylistSongsStoreBase.clearPlaylistSongs');
    try {
      return super.clearPlaylistSongs();
    } finally {
      _$PlaylistSongsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playlistSongs: ${playlistSongs}
    ''';
  }
}
