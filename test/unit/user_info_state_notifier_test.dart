import 'package:flutter_test/flutter_test.dart';
import 'package:songify/src/core/user/user_info_state.dart';
import 'package:songify/src/core/user/user_information_repository.dart';
import 'package:state_notifier_test/state_notifier_test.dart';

void main() {
  group('userInfoStateNotifier test', () {
    stateNotifierTest<UserInfoStateNotifier, UserInfoState>(
      'state is initial',
      actions: (notifier) {},
      build: () => UserInfoStateNotifier(),
      expectInitialState: true,
    );
    stateNotifierTest<UserInfoStateNotifier, UserInfoState>(
      'setUserId',
      actions: (notifier) {
        notifier.setUserId('abcd123');
      },
      build: () => UserInfoStateNotifier(),
      expect: () => [
        UserInfoState(userId: 'abcd123'),
      ],
    );
    stateNotifierTest<UserInfoStateNotifier, UserInfoState>(
      'setFavSongIds',
      actions: (notifier) {
        notifier.updateFavSongIds(['1', '2', '3']);
      },
      build: () => UserInfoStateNotifier(),
      expect: () => [
        UserInfoState(userId: null, favSongIds: ['1', '2', '3']),
      ],
    );
  });
}
