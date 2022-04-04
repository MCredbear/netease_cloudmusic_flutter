import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:netease_cloudmusic_flutter/api/song_url.dart';
import 'package:path_provider/path_provider.dart';

import 'stores/cached_songs_store.dart';
import 'stores/song.dart';
import 'stores/player_store.dart';

final Player player = Player();

class Player {
  final AssetsAudioPlayer _player = AssetsAudioPlayer();
  late int index;
  void updatePlaylist(ObservableList<Song> songs) =>
      storePlayer.updatePlaylist(songs);
  Future<void> play(int index) async {
    this.index = index;
    if (storeCachedSongs.cachedSongs
        .contains(storePlayer.playlist[this.index].id)) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      await _player.open(
        Audio.file(
          appDocDir.path +
              "/cache/music/" +
              storePlayer.playlist[this.index].id,
          metas: Metas(
              title: storePlayer.playlist[this.index].name,
              artist: storePlayer.playlist[this.index].combinedArtistsName(),
              image: MetasImage.network(
                  storePlayer.playlist[this.index].album.coverUrl),
              album: storePlayer.playlist[this.index].album.name),
        ),
        loopMode: LoopMode.single,
        showNotification: true,
        notificationSettings: NotificationSettings(
          customPrevAction: (player) async =>
              await play((this.index != 0) ? this.index - 1 : this.index),
          customNextAction: (player) async => await play(
              (this.index != storePlayer.playlist.length)
                  ? this.index + 1
                  : this.index),
        ),
      );
    } else {
      String _songUrl = await songUrl(storePlayer.playlist[this.index].id);
      if (_songUrl != '') {
        storeCachedSongs.cacheSong(
            _songUrl, storePlayer.playlist[this.index].id);
        await _player.open(
          Playlist(audios: [
            Audio.network(_songUrl,
                metas: Metas(
                    title: storePlayer.playlist[this.index].name,
                    artist:
                        storePlayer.playlist[this.index].combinedArtistsName(),
                    image: MetasImage.network(
                        storePlayer.playlist[this.index].album.coverUrl),
                    album: storePlayer.playlist[this.index].album.name),
                cached: false) //我自己实现了一个更加网易云的缓存（指用ID）
          ]),
          loopMode: LoopMode.single,
          showNotification: true,
          notificationSettings: NotificationSettings(
            customPrevAction: (player) async =>
                await play((this.index != 0) ? this.index - 1 : this.index),
            customNextAction: (player) async => await play(
                (this.index != storePlayer.playlist.length)
                    ? this.index + 1
                    : this.index),
          ),
        );
        await _player.playlistPlayAtIndex(0);
      } else {
        Fluttertoast.showToast(msg: "被网易云ban了");
      }
    }
  }
}
