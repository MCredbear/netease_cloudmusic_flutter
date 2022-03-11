import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:netease_cloudmusic_flutter/api/song_url.dart';
import 'package:netease_cloudmusic_flutter/stores/song.dart';

part 'player_store.g.dart';

final PlayerStore storePlayer = PlayerStore();

class PlayerStore = PlayerStoreBase with _$PlayerStore;

abstract class PlayerStoreBase with Store {
  @observable
  ObservableList<Song> viewPlaylist = ObservableList();
  Playlist playerPlaylist = Playlist();

  @action
  Future<void> updatePlaylist(ObservableList<Song> songs) async {
    viewPlaylist = songs;
    List<Audio> audios = [];
    for (var song in songs) {
      String _songUrl = await songUrl(song.id);
      if (_songUrl == '') Fluttertoast.showToast(msg: "被网易云ban了");
      audios.add(Audio.network(_songUrl,
          metas: Metas(
              title: song.name,
              artist: song.combinedArtistsName(),
              image: MetasImage.network(song.album.coverUrl),
              album: song.album.name),
          cached: true));
    }
    playerPlaylist = Playlist(audios: audios);
  }
}