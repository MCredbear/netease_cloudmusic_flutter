import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:netease_cloudmusic_flutter/api/song_url.dart';

import 'stores/song.dart';
import 'stores/player_store.dart';

final Player player = Player();

class Player {
  final _player = AssetsAudioPlayer();
  void updatePlaylist(ObservableList<Song> songs) =>
      storePlayer.updatePlaylist(songs);
  Future<void> play(int index) async {
    await _player.pause();
    String _songUrl = await songUrl(storePlayer.playlist[index].id);
    if (_songUrl != '') {
      await _player.open(
        Audio.network(_songUrl,
            metas: Metas(
                title: storePlayer.playlist[index].name,
                artist: storePlayer.playlist[index].combinedArtistsName(),
                image: MetasImage.network(
                    storePlayer.playlist[index].album.coverUrl),
                album: storePlayer.playlist[index].album.name),
            cached: true),
        loopMode: LoopMode.single,
        showNotification: true,
        notificationSettings: NotificationSettings(
          customPrevAction: (player) => play(index - 1),
          customNextAction: (player) => play(index + 1),
        ),
      );
    } else {
      Fluttertoast.showToast(msg: "被网易云ban了");
    }
  }
}
