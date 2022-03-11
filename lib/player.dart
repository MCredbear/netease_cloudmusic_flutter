import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:mobx/mobx.dart';

import 'stores/song.dart';
import 'stores/player_store.dart';

final player = AssetsAudioPlayer();

Future<void> play(ObservableList<Song> songs, int index) async {
  await player.pause();
  await storePlayer.updatePlaylist(songs);
  await player.open(storePlayer.playerPlaylist,
      loopMode: LoopMode.single, showNotification: true);
  player.playlistPlayAtIndex(index);
}
