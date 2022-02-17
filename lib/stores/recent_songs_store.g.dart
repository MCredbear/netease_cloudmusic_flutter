// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_songs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecentSongsStore on RecentSongsStoreBase, Store {
  final _$recentSongsAtom = Atom(name: 'RecentSongsStoreBase.recentSongs');

  @override
  ObservableList<Song> get recentSongs {
    _$recentSongsAtom.reportRead();
    return super.recentSongs;
  }

  @override
  set recentSongs(ObservableList<Song> value) {
    _$recentSongsAtom.reportWrite(value, super.recentSongs, () {
      super.recentSongs = value;
    });
  }

  final _$RecentSongsStoreBaseActionController =
      ActionController(name: 'RecentSongsStoreBase');

  @override
  void updateRecentSongs(ObservableList<Song> songs) {
    final _$actionInfo = _$RecentSongsStoreBaseActionController.startAction(
        name: 'RecentSongsStoreBase.updateRecentSongs');
    try {
      return super.updateRecentSongs(songs);
    } finally {
      _$RecentSongsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeRecentSong(int index) {
    final _$actionInfo = _$RecentSongsStoreBaseActionController.startAction(
        name: 'RecentSongsStoreBase.removeRecentSong');
    try {
      return super.removeRecentSong(index);
    } finally {
      _$RecentSongsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearRecentSongs() {
    final _$actionInfo = _$RecentSongsStoreBaseActionController.startAction(
        name: 'RecentSongsStoreBase.clearRecentSongs');
    try {
      return super.clearRecentSongs();
    } finally {
      _$RecentSongsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recentSongs: ${recentSongs}
    ''';
  }
}
