import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:netease_cloudmusic_flutter/stores/playlist_songs_store.dart';
import 'package:netease_cloudmusic_flutter/widgets/playlist_songs_list_view.dart';

class PlaylistSongPage extends StatefulWidget {
  const PlaylistSongPage({Key? key}) : super(key: key);

  @override
  State<PlaylistSongPage> createState() => _PlaylistSongPageState();
}

class _PlaylistSongPageState extends State<PlaylistSongPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Observer(
              builder: ((_) => Text(storePlaylistSongs.name,
                  overflow: TextOverflow.ellipsis))),
          actions: <Widget>[
            IconButton(
                splashRadius: 24,
                onPressed: () {},
                icon: const Icon(Icons.search))
          ],
        ),
        body: const PlaylistSongsListView(
          shrinkWrap: false,
          physics: AlwaysScrollableScrollPhysics(),
        ));
  }
}
