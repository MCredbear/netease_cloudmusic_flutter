import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:mobx/mobx.dart';

import 'stores/song.dart';
import 'stores/player_store.dart';

final Player player = Player();

class Player {
  final _player = AssetsAudioPlayer();
  Future<void> play(ObservableList<Song> songs, int index) async {
    await _player.pause();
    await storePlayer.updatePlaylist(songs);
    await _player.open(storePlayer.playerPlaylist,
        loopMode: LoopMode.single, showNotification: true);
    _player.playlistPlayAtIndex(index);
  }
}
