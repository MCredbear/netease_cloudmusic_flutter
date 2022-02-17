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
  void setLoginStatus(bool loginStatus) => loginStatus = loginStatus;
  @action
  setID(String id) => id = id;
  @action
  void setNickname(String nickname) => nickname = nickname;
  @action
  void setAvatarUrl(String avatarUrl) => avatarUrl = avatarUrl;
  @action
  void setBackgroundUrl(String backgroundUrl) => backgroundUrl = backgroundUrl;
}
