// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_songs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocalSongsStore on LocalSongsStoreBase, Store {
  final _$localSongsAtom = Atom(name: 'LocalSongsStoreBase.localSongs');

  @override
  ObservableList<FileSystemEntity> get localSongs {
    _$localSongsAtom.reportRead();
    return super.localSongs;
  }

  @override
  set localSongs(ObservableList<FileSystemEntity> value) {
    _$localSongsAtom.reportWrite(value, super.localSongs, () {
      super.localSongs = value;
    });
  }

  final _$refreshLocalSongsAsyncAction =
      AsyncAction('LocalSongsStoreBase.refreshLocalSongs');

  @override
  Future<void> refreshLocalSongs() {
    return _$refreshLocalSongsAsyncAction.run(() => super.refreshLocalSongs());
  }

  final _$LocalSongsStoreBaseActionController =
      ActionController(name: 'LocalSongsStoreBase');

  @override
  void removeLocalSong(int index) {
    final _$actionInfo = _$LocalSongsStoreBaseActionController.startAction(
        name: 'LocalSongsStoreBase.removeLocalSong');
    try {
      return super.removeLocalSong(index);
    } finally {
      _$LocalSongsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
localSongs: ${localSongs}
    ''';
  }
}
