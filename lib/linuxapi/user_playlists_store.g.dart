// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_playlists_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserPlaylistsStore on UserPlaylistsStoreBase, Store {
  final _$myPlaylistsAtom = Atom(name: 'UserPlaylistsStoreBase.myPlaylists');

  @override
  ObservableList<Playlist> get myPlaylists {
    _$myPlaylistsAtom.reportRead();
    return super.myPlaylists;
  }

  @override
  set myPlaylists(ObservableList<Playlist> value) {
    _$myPlaylistsAtom.reportWrite(value, super.myPlaylists, () {
      super.myPlaylists = value;
    });
  }

  final _$subscribedPlaylistsAtom =
      Atom(name: 'UserPlaylistsStoreBase.subscribedPlaylists');

  @override
  ObservableList<Playlist> get subscribedPlaylists {
    _$subscribedPlaylistsAtom.reportRead();
    return super.subscribedPlaylists;
  }

  @override
  set subscribedPlaylists(ObservableList<Playlist> value) {
    _$subscribedPlaylistsAtom.reportWrite(value, super.subscribedPlaylists, () {
      super.subscribedPlaylists = value;
    });
  }

  final _$UserPlaylistsStoreBaseActionController =
      ActionController(name: 'UserPlaylistsStoreBase');

  @override
  void updataPlaylists(ObservableList<Playlist> myPlaylists,
      ObservableList<Playlist> subscribedPlaylists) {
    final _$actionInfo = _$UserPlaylistsStoreBaseActionController.startAction(
        name: 'UserPlaylistsStoreBase.updataPlaylists');
    try {
      return super.updataPlaylists(myPlaylists, subscribedPlaylists);
    } finally {
      _$UserPlaylistsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
myPlaylists: ${myPlaylists},
subscribedPlaylists: ${subscribedPlaylists}
    ''';
  }
}
