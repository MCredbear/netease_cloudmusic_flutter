import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:netease_cloudmusic_flutter/linuxapi/RecordRecentSongProfile.dart';

import 'CustomTestButton.dart';
import 'linuxapi/LinuxAPI.dart';
import 'linuxapi/Login.dart';
import 'linuxapi/LoginProfile.dart';
import 'linuxapi/RecordRecentSong.dart';
import 'LoginPage.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: 200,
        child: Drawer(
          elevation: 4,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Observer(
                    builder: (_) => loginprofile.logined
                        ? Image.network(loginprofile.backgroundUrl)
                        : SizedBox(
                            width: 200,
                            height: 200,
                            child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Colors.black54)),
                          ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new LoginPage()));
                        },
                        splashFactory: NoSplash.splashFactory,
                        highlightColor: Colors.transparent,
                        child: Card(
                          elevation: 5,
                          shape: CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          child: Observer(
                            builder: (_) => loginprofile.logined
                                ? Image.network(
                                    loginprofile.avatarUrl,
                                    width: 50,
                                    height: 50,
                                  )
                                : SizedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
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
                          loginprofile.nickname,
                          textScaleFactor: 1.8,
                        ),
                      ),
                      Row(
                        children: [
                          Observer(
                            builder: (_) => Expanded(
                                flex: 3,
                                child: loginprofile.logined
                                    ? Text(
                                        'VIP: ?',
                                        textAlign: TextAlign.right,
                                        textScaleFactor: 1.2,
                                      )
                                    : Container()),
                          ),
                          Observer(
                            builder: (_) => Expanded(
                              flex: 1,
                              child: loginprofile.logined
                                  ? UnconstrainedBox(
                                      child: SizedBox(
                                        width: 1.2,
                                        height: 20,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ),
                          Observer(
                            builder: (_) => Expanded(
                                flex: 3,
                                child: loginprofile.logined
                                    ? Text(
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
              ),
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
          SizedBox(
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
                        children: [
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
                        children: [
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
                        children: [
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
                        children: [
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
                      recordrecentsongprofile.clearRecentSong;
                      recordRecentSong(limit: "5");
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_right_sharp,
                      size: 24,
                      color: Colors.white70,
                    ),
                    label: Text(
                      ' 最近播放',
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  InkWell(
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
                              builder: (_) => Image.network(
                                recordrecentsongprofile.recentSongs[0].coverUrl,
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
                                      recordrecentsongprofile
                                          .recentSongs[0].name,
                                      textScaleFactor: 1.2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    child: Observer(
                                      builder: (_) => (recordrecentsongprofile
                                                  .recentSongs[0].alias.length >
                                              0)
                                          ? Text(
                                              "  (" +
                                                  recordrecentsongprofile
                                                      .recentSongs[0].alias[0] +
                                                  ")",
                                              textScaleFactor: 1.2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white54),
                                            )
                                          : Container(),
                                    ),
                                  ),
                                ],
                              ),
                              Observer(
                                  builder: (_) => Text(
                                        combineArtistsName(0),
                                        overflow: TextOverflow.ellipsis,
                                      )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
          ),
          Divider(
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
                      Text(
                        '   我的歌单',
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.white70),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.list),
                        splashRadius: 20,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                  Divider(
                    height: 0,
                    thickness: 1,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                          onTap: () {},
                          splashFactory: NoSplash.splashFactory,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Card(
                                  elevation: 0,
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '♥我喜欢的音乐',
                                          textScaleFactor: 1.5,
                                        ),
                                        Text('114514首'),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_vert),
                                      splashRadius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
                      Text(
                        '   收藏歌单',
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.white70),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.list),
                        splashRadius: 20,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                  Divider(
                    height: 0,
                    thickness: 1,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        InkWell(
                          onTap: () {},
                          splashFactory: NoSplash.splashFactory,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Card(
                                  elevation: 0,
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.network(
                                    'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                                    width: 60,
                                    height: 60,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '豪俊金曲',
                                          textScaleFactor: 1.5,
                                        ),
                                        Text('1919810首'),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_vert),
                                      splashRadius: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
