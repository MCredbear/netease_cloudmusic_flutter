import 'package:mobx/mobx.dart';

part 'user_profile_store.g.dart';

final UserProfileStore storeUserProfile = UserProfileStore();

class UserProfileStore = UserProfileStoreBase with _$UserProfileStore;

abstract class UserProfileStoreBase with Store {
  @observable
  bool loginStatus = false;

  @observable
  String id = '';
  @observable
  String nickname = '';
  @observable
  String avatarUrl = '';
  @observable
  String backgroundUrl = '';

  @action
  void setLoginStatus(bool loginStatus) => this.loginStatus = loginStatus;
  @action
  void setID(String id) => this.id = id;
  @action
  void setNickname(String nickname) => this.nickname = nickname;
  @action
  void setAvatarUrl(String avatarUrl) => this.avatarUrl = avatarUrl;
  @action
  void setBackgroundUrl(String backgroundUrl) => this.backgroundUrl = backgroundUrl;
}
