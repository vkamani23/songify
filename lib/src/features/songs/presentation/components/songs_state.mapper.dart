// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'songs_state.dart';

class SongsStateMapper extends ClassMapperBase<SongsState> {
  SongsStateMapper._();

  static SongsStateMapper? _instance;
  static SongsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SongsStateMapper._());
      SongMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SongsState';

  static List<Song> _$songs(SongsState v) => v.songs;
  static const Field<SongsState, List<Song>> _f$songs = Field('songs', _$songs);

  @override
  final MappableFields<SongsState> fields = const {
    #songs: _f$songs,
  };

  static SongsState _instantiate(DecodingData data) {
    return SongsState(songs: data.dec(_f$songs));
  }

  @override
  final Function instantiate = _instantiate;

  static SongsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SongsState>(map);
  }

  static SongsState fromJson(String json) {
    return ensureInitialized().decodeJson<SongsState>(json);
  }
}

mixin SongsStateMappable {
  String toJson() {
    return SongsStateMapper.ensureInitialized()
        .encodeJson<SongsState>(this as SongsState);
  }

  Map<String, dynamic> toMap() {
    return SongsStateMapper.ensureInitialized()
        .encodeMap<SongsState>(this as SongsState);
  }

  SongsStateCopyWith<SongsState, SongsState, SongsState> get copyWith =>
      _SongsStateCopyWithImpl(this as SongsState, $identity, $identity);
  @override
  String toString() {
    return SongsStateMapper.ensureInitialized()
        .stringifyValue(this as SongsState);
  }

  @override
  bool operator ==(Object other) {
    return SongsStateMapper.ensureInitialized()
        .equalsValue(this as SongsState, other);
  }

  @override
  int get hashCode {
    return SongsStateMapper.ensureInitialized().hashValue(this as SongsState);
  }
}

extension SongsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SongsState, $Out> {
  SongsStateCopyWith<$R, SongsState, $Out> get $asSongsState =>
      $base.as((v, t, t2) => _SongsStateCopyWithImpl(v, t, t2));
}

abstract class SongsStateCopyWith<$R, $In extends SongsState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Song, SongCopyWith<$R, Song, Song>> get songs;
  $R call({List<Song>? songs});
  SongsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SongsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SongsState, $Out>
    implements SongsStateCopyWith<$R, SongsState, $Out> {
  _SongsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SongsState> $mapper =
      SongsStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Song, SongCopyWith<$R, Song, Song>> get songs =>
      ListCopyWith(
          $value.songs, (v, t) => v.copyWith.$chain(t), (v) => call(songs: v));
  @override
  $R call({List<Song>? songs}) =>
      $apply(FieldCopyWithData({if (songs != null) #songs: songs}));
  @override
  SongsState $make(CopyWithData data) =>
      SongsState(songs: data.get(#songs, or: $value.songs));

  @override
  SongsStateCopyWith<$R2, SongsState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _SongsStateCopyWithImpl($value, $cast, t);
}
