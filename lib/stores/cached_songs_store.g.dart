// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_songs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CachedSongsStore on CachedSongsStoreBase, Store {
  final _$cachedSongsAtom = Atom(name: 'CachedSongsStoreBase.cachedSongs');

  @override
  ObservableList<String> get cachedSongs {
    _$cachedSongsAtom.reportRead();
    return super.cachedSongs;
  }

  @override
  set cachedSongs(ObservableList<String> value) {
    _$cachedSongsAtom.reportWrite(value, super.cachedSongs, () {
      super.cachedSongs = value;
    });
  }

  final _$refreshCachedSongsAsyncAction =
      AsyncAction('CachedSongsStoreBase.refreshCachedSongs');

  @override
  Future<void> refreshCachedSongs() {
    return _$refreshCachedSongsAsyncAction
        .run(() => super.refreshCachedSongs());
  }

  final _$CachedSongsStoreBaseActionController =
      ActionController(name: 'CachedSongsStoreBase');

  @override
  void addCachedSong(String id) {
    final _$actionInfo = _$CachedSongsStoreBaseActionController.startAction(
        name: 'CachedSongsStoreBase.addCachedSong');
    try {
      return super.addCachedSong(id);
    } finally {
      _$CachedSongsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cachedSongs: ${cachedSongs}
    ''';
  }
}
