import 'package:flutter/material.dart';
import 'package:netease_cloudmusic_flutter/api/record_recent_song.dart';
import 'package:netease_cloudmusic_flutter/stores/recent_songs_store.dart';
import 'package:netease_cloudmusic_flutter/widgets/recent_songs_list_view.dart';

class RecentSongPage extends StatefulWidget {
  const RecentSongPage({Key? key}) : super(key: key);

  @override
  State<RecentSongPage> createState() => _RecentSongPageState();
}

class _RecentSongPageState extends State<RecentSongPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    recordRecentSong();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('最近播放'),
        actions: <Widget>[
          IconButton(
              splashRadius: 24,
              onPressed: () {},
              icon: const Icon(Icons.search))
        ],
        bottom: TabBar(
            controller: _tabController,
            tabs: const [Tab(text: '歌曲'), Tab(text: '电台')]),
      ),
      body: TabBarView(controller: _tabController, children: [
        RecentSongsListView(
          count: storeRecentSongs.recentSongs.length,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: false,
        ),
        RecentSongsListView(
          count: storeRecentSongs.recentSongs.length,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: false,
        )
      ]),
    );
  }
}
