// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerStore on PlayerStoreBase, Store {
  final _$viewPlaylistAtom = Atom(name: 'PlayerStoreBase.viewPlaylist');

  @override
  ObservableList<Song> get viewPlaylist {
    _$viewPlaylistAtom.reportRead();
    return super.viewPlaylist;
  }

  @override
  set viewPlaylist(ObservableList<Song> value) {
    _$viewPlaylistAtom.reportWrite(value, super.viewPlaylist, () {
      super.viewPlaylist = value;
    });
  }

  final _$updatePlaylistAsyncAction =
      AsyncAction('PlayerStoreBase.updatePlaylist');

  @override
  Future<void> updatePlaylist(ObservableList<Song> songs) {
    return _$updatePlaylistAsyncAction.run(() => super.updatePlaylist(songs));
  }

  @override
  String toString() {
    return '''
viewPlaylist: ${viewPlaylist}
    ''';
  }
}
