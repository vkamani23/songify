import 'package:dart_mappable/dart_mappable.dart';

part 'user_info_state.mapper.dart';

@MappableClass()
class UserInfoState with UserInfoStateMappable {
  final String? userId;
  final List<String> favSongIds;

  UserInfoState({
    required this.userId,
    this.favSongIds = const [],
  });
}
