// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerStore on PlayerStoreBase, Store {
  final _$playlistAtom = Atom(name: 'PlayerStoreBase.playlist');

  @override
  ObservableList<Song> get playlist {
    _$playlistAtom.reportRead();
    return super.playlist;
  }

  @override
  set playlist(ObservableList<Song> value) {
    _$playlistAtom.reportWrite(value, super.playlist, () {
      super.playlist = value;
    });
  }

  final _$PlayerStoreBaseActionController =
      ActionController(name: 'PlayerStoreBase');

  @override
  void updatePlaylist(ObservableList<Song> songs) {
    final _$actionInfo = _$PlayerStoreBaseActionController.startAction(
        name: 'PlayerStoreBase.updatePlaylist');
    try {
      return super.updatePlaylist(songs);
    } finally {
      _$PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playlist: ${playlist}
    ''';
  }
}
