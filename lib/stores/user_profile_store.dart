import 'package:mobx/mobx.dart';

part 'user_profile_store.g.dart';

final UserProfileStore userProfileStore = UserProfileStore();

class UserProfileStore = UserProfileStoreBase with _$UserProfileStore;

abstract class UserProfileStoreBase with Store {
  @observable
  bool logined = false;
  @action
  void setLogined(bool logined) {
    this.logined = logined;
  }

  @observable
  String id = '';
  @action
  setID(String id) {
    this.id = id;
  }

  @observable
  String nickname = '';
  @action
  void setNickname(String nickname) {
    this.nickname = nickname;
  }

  @observable
  String avatarUrl = '';
  @action
  void setAvatarUrl(String avatarUrl) {
    this.avatarUrl = avatarUrl;
  }

  @observable
  String backgroundUrl = '';
  @action
  void setBackgroundUrl(String backgroundUrl) {
    this.backgroundUrl = backgroundUrl;
  }
}
