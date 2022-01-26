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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            width: double.infinity,
            height: 100,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /*CustomTextButton.icon( //too ugly
                    style: const ButtonStyle(
                        splashFactory: NoSplash.splashFactory),
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_right_sharp),
                    label: Text(
                      " 用户信息",
                      textScaleFactor: 1.2,
                    ),
                  ),*/
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
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
          const Divider(
            thickness: 1,
          ),
          CustomTextButton.icon(
            //style: ButtonStyle(splashFactory: NoSplash.splashFactory),
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_right_sharp,
              size: 30,
            ),
            label: Text(
              " 本地音乐",
              textScaleFactor: 2,
            ),
          ),
          /*Card(
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),*/
          const Divider(
            thickness: 1,
          ),
          CustomTextButton.icon(
            //style: ButtonStyle(splashFactory: NoSplash.splashFactory),
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_right_sharp,
              size: 30,
            ),
            label: Text(
              " 历史记录",
              textScaleFactor: 2,
            ),
          ),
          Card(
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                //mainAxisSize: MainAxisSize.min,
                //width: double.infinity,
                //height: 100,
                children: [
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            //width: 50,
                            //height: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          CustomTextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_arrow_right_sharp,
              size: 30,
            ),
            label: Text(
              ' 我的歌单',
              textScaleFactor: 2,
            ),
          ),
          Card(
            child: SizedBox(
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
                        Card(
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            'https://p3.music.126.net/hTceeVgvD7zBgy5kLeMr6w==/109951163124863182.jpg',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '我喜欢的音乐',
                              textScaleFactor: 1.5,
                            ),
                            Text('114514首'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
