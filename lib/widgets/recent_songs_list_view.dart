import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:netease_cloudmusic_flutter/api/record_recent_song.dart';
import 'package:netease_cloudmusic_flutter/api/song_url.dart';
import 'package:netease_cloudmusic_flutter/main.dart';
import 'package:netease_cloudmusic_flutter/stores/recent_songs_store.dart';

class RecentSongsListView extends StatefulWidget {
  const RecentSongsListView({
    Key? key,
    required this.count,
    required this.physics,
    required this.shrinkWrap,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final count;
  final ScrollPhysics physics;
  final bool shrinkWrap;

  @override
  State<RecentSongsListView> createState() => _RecentSongsListViewState();
}

class _RecentSongsListViewState extends State<RecentSongsListView> {
  @override
  void initState() {
    super.initState();
    recordRecentSong();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView.builder(
        physics: widget.physics,
        shrinkWrap: widget.shrinkWrap,
        itemCount: widget.count,
        itemBuilder: (context, index) => InkWell(
          onTap: () async {
            player.pause();
            if (await songUrl(storeRecentSongs.recentSongs[index].id) != '') {
              try {
                await player.open(
                  Audio.network(
                      await songUrl(storeRecentSongs.recentSongs[index].id),
                      metas: Metas(
                          title: storeRecentSongs.recentSongs[index].name,
                          artist: storeRecentSongs.recentSongs[index]
                              .combinedArtistsName(),
                          image: MetasImage.network(
                              storeRecentSongs.recentSongs[index].coverUrl)),
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
                  ((storeRecentSongs.recentSongs.length > 5)
                      ? 4
                      : storeRecentSongs.recentSongs.length - 1))
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
                      imageUrl: storeRecentSongs.recentSongs[index].coverUrl,
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
                                text: storeRecentSongs.recentSongs[index].name),
                            TextSpan(
                              text: (storeRecentSongs
                                      .recentSongs[index].alias.isNotEmpty)
                                  ? "  (" +
                                      storeRecentSongs
                                          .recentSongs[index].alias[0] +
                                      ")"
                                  : "",
                              style: const TextStyle(color: Colors.white54),
                            )
                          ])),
                    ),
                    Observer(
                        builder: (_) => Text(
                              storeRecentSongs.recentSongs[index]
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
