import 'package:mobx/mobx.dart';
import 'package:netease_cloudmusic_flutter/stores/song.dart';

part 'player_store.g.dart';

final PlayerStore storePlayer = PlayerStore();

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  @observable
  ObservableList<Song> playlist = ObservableList();

  @action
  void updatePlaylist(ObservableList<Song> songs) => playlist = songs;
}
