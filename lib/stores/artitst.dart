import 'package:mobx/mobx.dart';

class Artist {
  String name;
  String id;
  ObservableList alias;
  Artist(
    this.name,
    this.id,
    this.alias,
  );
}