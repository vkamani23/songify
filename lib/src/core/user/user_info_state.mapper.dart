// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_info_state.dart';

class UserInfoStateMapper extends ClassMapperBase<UserInfoState> {
  UserInfoStateMapper._();

  static UserInfoStateMapper? _instance;
  static UserInfoStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserInfoStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserInfoState';

  static String? _$userId(UserInfoState v) => v.userId;
  static const Field<UserInfoState, String> _f$userId =
      Field('userId', _$userId);
  static List<String> _$favSongIds(UserInfoState v) => v.favSongIds;
  static const Field<UserInfoState, List<String>> _f$favSongIds =
      Field('favSongIds', _$favSongIds, opt: true, def: const []);

  @override
  final MappableFields<UserInfoState> fields = const {
    #userId: _f$userId,
    #favSongIds: _f$favSongIds,
  };

  static UserInfoState _instantiate(DecodingData data) {
    return UserInfoState(
        userId: data.dec(_f$userId), favSongIds: data.dec(_f$favSongIds));
  }

  @override
  final Function instantiate = _instantiate;

  static UserInfoState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserInfoState>(map);
  }

  static UserInfoState fromJson(String json) {
    return ensureInitialized().decodeJson<UserInfoState>(json);
  }
}

mixin UserInfoStateMappable {
  String toJson() {
    return UserInfoStateMapper.ensureInitialized()
        .encodeJson<UserInfoState>(this as UserInfoState);
  }

  Map<String, dynamic> toMap() {
    return UserInfoStateMapper.ensureInitialized()
        .encodeMap<UserInfoState>(this as UserInfoState);
  }

  UserInfoStateCopyWith<UserInfoState, UserInfoState, UserInfoState>
      get copyWith => _UserInfoStateCopyWithImpl(
          this as UserInfoState, $identity, $identity);
  @override
  String toString() {
    return UserInfoStateMapper.ensureInitialized()
        .stringifyValue(this as UserInfoState);
  }

  @override
  bool operator ==(Object other) {
    return UserInfoStateMapper.ensureInitialized()
        .equalsValue(this as UserInfoState, other);
  }

  @override
  int get hashCode {
    return UserInfoStateMapper.ensureInitialized()
        .hashValue(this as UserInfoState);
  }
}

extension UserInfoStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserInfoState, $Out> {
  UserInfoStateCopyWith<$R, UserInfoState, $Out> get $asUserInfoState =>
      $base.as((v, t, t2) => _UserInfoStateCopyWithImpl(v, t, t2));
}

abstract class UserInfoStateCopyWith<$R, $In extends UserInfoState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get favSongIds;
  $R call({String? userId, List<String>? favSongIds});
  UserInfoStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserInfoStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserInfoState, $Out>
    implements UserInfoStateCopyWith<$R, UserInfoState, $Out> {
  _UserInfoStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserInfoState> $mapper =
      UserInfoStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get favSongIds =>
      ListCopyWith($value.favSongIds, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(favSongIds: v));
  @override
  $R call({Object? userId = $none, List<String>? favSongIds}) =>
      $apply(FieldCopyWithData({
        if (userId != $none) #userId: userId,
        if (favSongIds != null) #favSongIds: favSongIds
      }));
  @override
  UserInfoState $make(CopyWithData data) => UserInfoState(
      userId: data.get(#userId, or: $value.userId),
      favSongIds: data.get(#favSongIds, or: $value.favSongIds));

  @override
  UserInfoStateCopyWith<$R2, UserInfoState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserInfoStateCopyWithImpl($value, $cast, t);
}
