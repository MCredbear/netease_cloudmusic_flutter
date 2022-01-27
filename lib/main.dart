import 'dart:ui';

import 'package:flutter/material.dart';

import 'CustomTestButton.dart';

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

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({Key? key}) : super(key: key);
  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 100,
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                              'https://p4.music.126.net/8B-aaaDhCw_WYD8u-h3Vfg==/109951163124857862.jpg'),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Card(
                                      shape: const StadiumBorder(
                                          side: BorderSide(
                                        style: BorderStyle.none,
                                      )),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          'VIP：无 剩余时间：0',
                                          textScaleFactor: 1.2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Card(
                                      shape: const StadiumBorder(
                                          side: BorderSide(
                                        style: BorderStyle.none,
                                      )),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          '等级：7',
                                          textScaleFactor: 1.2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                child: Text(
                                  "MCredbear",
                                  textAlign: TextAlign.left,
                                  textScaleFactor: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
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
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                      'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 5,
                        shape: CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          'https://p3.music.126.net/8B-aaaDhCw_WYD8u-h3Vfg==/109951163124857862.jpg',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Text(
                        'MCredbear',
                        textScaleFactor: 1.8,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 3,
                              child: Text(
                                'VIP: ',
                                textAlign: TextAlign.right,
                                textScaleFactor: 1.2,
                              )),
                          Expanded(
                            flex: 1,
                            child: UnconstrainedBox(
                              child: SizedBox(
                                width: 1.2,
                                height: 20,
                                child: DecoratedBox(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                'Lv: 7',
                                textAlign: TextAlign.left,
                                textScaleFactor: 1.2,
                              )),
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
                  //spacing: 24,
                  children: [
                    InkWell(
                      onTap: () {},
                      splashFactory: NoSplash.splashFactory,
                      //I don't know how to remove Boader's splash
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
                    onPressed: () {},
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
                            child: Image.network(
                              'https://p4.music.126.net/8B-aaaDhCw_WYD8u-h3Vfg==/109951163124857862.jpg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "一般男性脱粪系列",
                              textScaleFactor: 1.2,
                            ),
                            Text("铃木悠太"),
                          ],
                        )
                      ],
                    ),
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
                            child: Image.network(
                              'https://p4.music.126.net/8B-aaaDhCw_WYD8u-h3Vfg==/109951163124857862.jpg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "一般男性脱粪系列",
                              textScaleFactor: 1.2,
                            ),
                            Text("铃木悠太"),
                          ],
                        )
                      ],
                    ),
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
                            child: Image.network(
                              'https://p4.music.126.net/8B-aaaDhCw_WYD8u-h3Vfg==/109951163124857862.jpg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "一般男性脱粪系列",
                              textScaleFactor: 1.2,
                            ),
                            Text("铃木悠太"),
                          ],
                        )
                      ],
                    ),
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
                            child: Image.network(
                              'https://p4.music.126.net/8B-aaaDhCw_WYD8u-h3Vfg==/109951163124857862.jpg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "一般男性脱粪系列",
                              textScaleFactor: 1.2,
                            ),
                            Text("铃木悠太"),
                          ],
                        )
                      ],
                    ),
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
                            child: Image.network(
                              'https://p4.music.126.net/8B-aaaDhCw_WYD8u-h3Vfg==/109951163124857862.jpg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "一般男性脱粪系列",
                              textScaleFactor: 1.2,
                            ),
                            Text("铃木悠太"),
                          ],
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
