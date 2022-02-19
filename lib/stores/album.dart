import 'package:mobx/mobx.dart';

class Album {
  String name;
  String id;
  String coverUrl;
  ObservableList alias;
  Album(
    this.name,
    this.id,
    this.coverUrl,
    this.alias,
  );
}