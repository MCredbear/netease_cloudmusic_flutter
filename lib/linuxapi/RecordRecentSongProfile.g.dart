// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecordRecentSongProfile.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecordRecentSongProfile on RecordRecentSongProfileBase, Store {
  final _$recentSongsAtom =
      Atom(name: 'RecordRecentSongProfileBase.recentSongs');

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

  final _$RecordRecentSongProfileBaseActionController =
      ActionController(name: 'RecordRecentSongProfileBase');

  @override
  void addRecentSong(Song song) {
    final _$actionInfo = _$RecordRecentSongProfileBaseActionController
        .startAction(name: 'RecordRecentSongProfileBase.addRecentSong');
    try {
      return super.addRecentSong(song);
    } finally {
      _$RecordRecentSongProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeRecentSong(int index) {
    final _$actionInfo = _$RecordRecentSongProfileBaseActionController
        .startAction(name: 'RecordRecentSongProfileBase.removeRecentSong');
    try {
      return super.removeRecentSong(index);
    } finally {
      _$RecordRecentSongProfileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recentSongs: ${recentSongs}
    ''';
  }
}
