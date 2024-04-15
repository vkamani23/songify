import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:songify/src/core/user/user_info_state.dart';

final userInfoStateNotifier =
    StateNotifierProvider<UserInfoStateNotifier, UserInfoState>(
  (ref) => UserInfoStateNotifier(),
);

class UserInfoStateNotifier extends StateNotifier<UserInfoState> {
  UserInfoStateNotifier() : super(UserInfoState(userId: null));

  void setUserId(String userId) {
    state = state.copyWith(userId: userId);
  }

  void updateFavSongIds(List<String> songIds) {
    state = state.copyWith(favSongIds: songIds);
  }
}
