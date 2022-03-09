import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:netease_cloudmusic_flutter/api/playlist_detail.dart';
import 'package:netease_cloudmusic_flutter/api/song_url.dart';
import 'package:netease_cloudmusic_flutter/main.dart';
import 'package:netease_cloudmusic_flutter/stores/playlist_songs_store.dart';

class PlaylistSongsListView extends StatefulWidget {
  const PlaylistSongsListView({
    Key? key,
    required this.physics,
    required this.shrinkWrap,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final ScrollPhysics physics;
  final bool shrinkWrap;

  @override
  State<PlaylistSongsListView> createState() => _PlaylistSongsListViewState();
}

class _PlaylistSongsListViewState extends State<PlaylistSongsListView> {
  @override
  void initState() {
    super.initState();
    storePlaylistSongs.clearPlaylistSongs();
    platlistDetail(storePlaylistSongs.id);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView.builder(
        physics: widget.physics,
        shrinkWrap: widget.shrinkWrap,
        itemCount: storePlaylistSongs.playlistSongs.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () async {
            player.pause();
            if (await songUrl(storePlaylistSongs.playlistSongs[index].id) !=
                '') {
              try {
                await player.open(
                  Audio.network(
                      await songUrl(storePlaylistSongs.playlistSongs[index].id),
                      metas: Metas(
                          title: storePlaylistSongs.playlistSongs[index].name,
                          artist: storePlaylistSongs.playlistSongs[index]
                              .combinedArtistsName(),
                          image: MetasImage.network(storePlaylistSongs
                              .playlistSongs[index].album.coverUrl)),
                      cached: true),
                  showNotification: true,
                );
              } catch (t) {}
            } else {
              print("被网易云ban了");
            }
          },
          splashFactory: NoSplash.splashFactory,
          borderRadius: (index ==
                  ((storePlaylistSongs.playlistSongs.length > 5)
                      ? 4
                      : storePlaylistSongs.playlistSongs.length - 1))
              ? const BorderRadius.vertical(bottom: Radius.circular(4))
              : const BorderRadius.all(Radius.zero),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Card(
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  child: Observer(
                    builder: (_) => CachedNetworkImage(
                      imageUrl: storePlaylistSongs
                          .playlistSongs[index].album.coverUrl,
                      fit: BoxFit.fill,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Observer(
                      builder: (_) => RichText(
                          textScaleFactor: 1.2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(children: [
                            TextSpan(
                                text: storePlaylistSongs
                                    .playlistSongs[index].name),
                            TextSpan(
                              text: (storePlaylistSongs
                                      .playlistSongs[index].alias.isNotEmpty)
                                  ? "  (" +
                                      storePlaylistSongs
                                          .playlistSongs[index].alias[0] +
                                      ")"
                                  : "",
                              style: const TextStyle(color: Colors.white54),
                            )
                          ])),
                    ),
                    Observer(
                        builder: (_) => Text(
                              storePlaylistSongs.playlistSongs[index]
                                  .combinedArtistsName(),
                              overflow: TextOverflow.ellipsis,
                            )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
