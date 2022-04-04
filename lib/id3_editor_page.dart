// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'stores/local_songs_store.dart';

class ID3EditorPage extends StatefulWidget {
  ID3EditorPage({Key? key}) : super(key: key);
  List<FileSystemEntity> songNames = [];
  @override
  State<ID3EditorPage> createState() => _ID3EditorPageState();
}

class _ID3EditorPageState extends State<ID3EditorPage> {
  @override
  void initState() {
    super.initState();
    storeLocalSongs.refreshLocalSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('歌曲信息编辑器'),
          actions: <Widget>[
            IconButton(
                onPressed: (() {
                  storeLocalSongs.refreshLocalSongs();
                }),
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: ListView.builder(
            itemCount: storeLocalSongs.localSongs.length,
            itemBuilder: ((context, index) => ListTile(
                  title: Text(storeLocalSongs.localSongs[index].path.substring(
                      storeLocalSongs.localSongs[index].path.lastIndexOf('/') +
                          1)),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubID3EditorPage(
                              storeLocalSongs.localSongs[index].path))),
                ))));
  }
}

class SubID3EditorPage extends StatefulWidget {
  SubID3EditorPage(this.path, {Key? key}) : super(key: key);
  String path;

  @override
  State<SubID3EditorPage> createState() => _SubID3EditorPageState();
}

class _SubID3EditorPageState extends State<SubID3EditorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.path.substring(widget.path.lastIndexOf('/') + 1))),
    );
  }
}
