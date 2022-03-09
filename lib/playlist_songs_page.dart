import 'package:flutter/material.dart';
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
          title: const Text('歌单'),
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
