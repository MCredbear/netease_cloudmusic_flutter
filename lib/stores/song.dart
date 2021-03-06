import 'package:mobx/mobx.dart';

import 'album.dart';
import 'artitst.dart';

class Song {
  String name;
  String id;
  ObservableList alias;
  ObservableList<Artist> artists;
  String combinedArtistsName() {
    String text = artists[0].name;
    for (int i = 1; i < artists.length; i++) {
      text += "/" + artists[i].name;
    }
    return text;
  }

  Album album;

  Song(
    this.name,
    this.id,
    this.alias,
    this.artists,
    this.album,
  );
}
