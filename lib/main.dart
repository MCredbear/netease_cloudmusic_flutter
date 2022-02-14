import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'CustomTestButton.dart';
import 'linuxapi/linux_api.dart';
import 'linuxapi/login.dart';
import 'linuxapi/user_account.dart';
import 'linuxapi/user_profile_store.dart';
import 'linuxapi/record_recent_song.dart';
import 'linuxapi/recent_songs_store.dart';
import 'linuxapi/user_playlist.dart';
import 'linuxapi/user_playlists_store.dart';

import 'login_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netease CloudMusic Flutter',
      theme: ThemeData.dark(),
      //themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    userAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: 200,
        child: Drawer(
          elevation: 4,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: const [
              UserProfileWidget(),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Netease CloudMusic"),
        actions: <Widget>[
          IconButton(
              splashRadius: 24,
              onPressed: () {},
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      splashFactory: NoSplash.splashFactory,
                      borderRadius: BorderRadius.circular(4),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.file_copy_rounded,
                            size: 40,
                            color: Colors.red,
                          ),
                          Text(
                            "本地音乐",
                            textScaleFactor: 1,
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      splashFactory: NoSplash.splashFactory,
                      borderRadius: BorderRadius.circular(4),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.cloud,
                            size: 40,
                            color: Colors.red,
                          ),
                          Text(
                            "云盘",
                            textScaleFactor: 1,
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      splashFactory: NoSplash.splashFactory,
                      borderRadius: BorderRadius.circular(4),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.file_download_outlined,
                            size: 40,
                            color: Colors.red,
                          ),
                          Text(
                            "下载",
                            textScaleFactor: 1,
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      splashFactory: NoSplash.splashFactory,
                      borderRadius: BorderRadius.circular(4),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.monetization_on,
                            size: 40,
                            color: Colors.red,
                          ),
                          Text(
                            "已购",
                            textScaleFactor: 1,
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextButton.icon(
                    onPressed: () {
                      recordRecentSong(limit: "300");
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right_sharp,
                      size: 24,
                      color: Colors.white70,
                    ),
                    label: const Text(
                      ' 最近播放',
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const Divider(
                    height: 0,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const RecentSongsListView(),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '   我的歌单',
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.white70),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.list),
                        splashRadius: 20,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                  const Divider(
                    height: 0,
                    thickness: 1,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MyPlaylistListView(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '   收藏歌单',
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.white70),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.list),
                        splashRadius: 20,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                  const Divider(
                    height: 0,
                    thickness: 1,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: SubscribedPlaylistListView(),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class MyPlaylistListView extends StatefulWidget {
  const MyPlaylistListView({
    Key? key,
  }) : super(key: key);

  @override
  State<MyPlaylistListView> createState() => _MyPlaylistListViewState();
}

class _MyPlaylistListViewState extends State<MyPlaylistListView> {
  @override
  void initState() {
    super.initState();
    userPlaylist();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: userPlaylistsStore.myPlaylists.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          splashFactory: NoSplash.splashFactory,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Card(
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  child: Observer(
                    builder: (_) => CachedNetworkImage(
                      imageUrl: userPlaylistsStore.myPlaylists[index].coverUrl,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Observer(
                            builder: (_) => Text(
                              userPlaylistsStore.myPlaylists[index].name,
                              textScaleFactor: 1.3,
                            ),
                          ),
                          Observer(
                            builder: (_) => Text(
                              userPlaylistsStore.myPlaylists[index].trackCount +
                                  "首",
                              textScaleFactor: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                      splashRadius: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubscribedPlaylistListView extends StatefulWidget {
  const SubscribedPlaylistListView({
    Key? key,
  }) : super(key: key);

  @override
  State<SubscribedPlaylistListView> createState() =>
      _SubscribedPlaylistListViewState();
}

class _SubscribedPlaylistListViewState
    extends State<SubscribedPlaylistListView> {
  @override
  void initState() {
    super.initState();
    //userPlaylist();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: userPlaylistsStore.myPlaylists.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          splashFactory: NoSplash.splashFactory,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Card(
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  child: Observer(
                    builder: (_) => CachedNetworkImage(
                      imageUrl: userPlaylistsStore
                          .subscribedPlaylists[index].coverUrl,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Observer(
                            builder: (_) => Text(
                              userPlaylistsStore
                                  .subscribedPlaylists[index].name,
                              overflow: TextOverflow.ellipsis,
                              textScaleFactor: 1.3,
                            ),
                          ),
                          Observer(
                            builder: (_) => Text(
                              userPlaylistsStore
                                      .subscribedPlaylists[index].trackCount +
                                  "首",
                              textScaleFactor: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                      splashRadius: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecentSongsListView extends StatefulWidget {
  const RecentSongsListView({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentSongsListView> createState() => _RecentSongsListViewState();
}

class _RecentSongsListViewState extends State<RecentSongsListView> {
  @override
  void initState() {
    super.initState();
    recordRecentSong(limit: "300");
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: (recentSongsStore.recentSongs.length > 5)
            ? 5
            : recentSongsStore.recentSongs.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          splashFactory: NoSplash.splashFactory,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Card(
                  elevation: 0,
                  clipBehavior: Clip.antiAlias,
                  child: Observer(
                    builder: (_) => CachedNetworkImage(
                      imageUrl: recentSongsStore.recentSongs[index].coverUrl,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Observer(
                          builder: (_) => Text(
                            recentSongsStore.recentSongs[index].name,
                            textScaleFactor: 1.2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Observer(
                            builder: (_) => (recentSongsStore
                                    .recentSongs[index].alias.isNotEmpty)
                                ? Text(
                                    "  (" +
                                        recentSongsStore
                                            .recentSongs[index].alias[0] +
                                        ")",
                                    textScaleFactor: 1.2,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        const TextStyle(color: Colors.white54),
                                  )
                                : Container(),
                          ),
                        ),
                      ],
                    ),
                    Observer(
                        builder: (_) => Text(
                              recentSongsStore.recentSongs[index]
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

class _UserProfileWidgetState extends State<UserProfileWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userAccount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Observer(
          builder: (_) => userProfileStore.logined
              ? CachedNetworkImage(imageUrl: userProfileStore.backgroundUrl)
              : const SizedBox(
                  width: 200,
                  height: 200,
                  child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black54)),
                ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              splashFactory: NoSplash.splashFactory,
              highlightColor: Colors.transparent,
              child: Card(
                elevation: 5,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: Observer(
                  builder: (_) => userProfileStore.logined
                      ? CachedNetworkImage(
                          imageUrl: userProfileStore.avatarUrl,
                          width: 50,
                          height: 50,
                        )
                      : SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '登录',
                                textScaleFactor: 1.3,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          width: 50,
                          height: 50,
                        ),
                ),
              ),
            ),
            Observer(
              builder: (_) => Text(
                userProfileStore.nickname,
                textScaleFactor: 1.8,
              ),
            ),
            Row(
              children: [
                Observer(
                  builder: (_) => Expanded(
                      flex: 3,
                      child: userProfileStore.logined
                          ? const Text(
                              'VIP: ?',
                              textAlign: TextAlign.right,
                              textScaleFactor: 1.2,
                            )
                          : Container()),
                ),
                Observer(
                  builder: (_) => Expanded(
                    flex: 1,
                    child: userProfileStore.logined
                        ? const UnconstrainedBox(
                            child: SizedBox(
                              width: 1.2,
                              height: 20,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ),
                Observer(
                  builder: (_) => Expanded(
                      flex: 3,
                      child: userProfileStore.logined
                          ? const Text(
                              'Lv: ?',
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.2,
                            )
                          : Container()),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserProfileWidgetState();
}
