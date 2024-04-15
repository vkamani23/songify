// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'now_playing_state.dart';

class NowPlayingStateMapper extends ClassMapperBase<NowPlayingState> {
  NowPlayingStateMapper._();

  static NowPlayingStateMapper? _instance;
  static NowPlayingStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NowPlayingStateMapper._());
      SongMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'NowPlayingState';

  static List<Song> _$playlist(NowPlayingState v) => v.playlist;
  static const Field<NowPlayingState, List<Song>> _f$playlist =
      Field('playlist', _$playlist);
  static Song? _$currentSong(NowPlayingState v) => v.currentSong;
  static const Field<NowPlayingState, Song> _f$currentSong =
      Field('currentSong', _$currentSong, opt: true);
  static bool _$hasNext(NowPlayingState v) => v.hasNext;
  static const Field<NowPlayingState, bool> _f$hasNext =
      Field('hasNext', _$hasNext, opt: true, def: false);
  static bool _$hasPrevious(NowPlayingState v) => v.hasPrevious;
  static const Field<NowPlayingState, bool> _f$hasPrevious =
      Field('hasPrevious', _$hasPrevious, opt: true, def: false);

  @override
  final MappableFields<NowPlayingState> fields = const {
    #playlist: _f$playlist,
    #currentSong: _f$currentSong,
    #hasNext: _f$hasNext,
    #hasPrevious: _f$hasPrevious,
  };

  static NowPlayingState _instantiate(DecodingData data) {
    return NowPlayingState(
        playlist: data.dec(_f$playlist),
        currentSong: data.dec(_f$currentSong),
        hasNext: data.dec(_f$hasNext),
        hasPrevious: data.dec(_f$hasPrevious));
  }

  @override
  final Function instantiate = _instantiate;

  static NowPlayingState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NowPlayingState>(map);
  }

  static NowPlayingState fromJson(String json) {
    return ensureInitialized().decodeJson<NowPlayingState>(json);
  }
}

mixin NowPlayingStateMappable {
  String toJson() {
    return NowPlayingStateMapper.ensureInitialized()
        .encodeJson<NowPlayingState>(this as NowPlayingState);
  }

  Map<String, dynamic> toMap() {
    return NowPlayingStateMapper.ensureInitialized()
        .encodeMap<NowPlayingState>(this as NowPlayingState);
  }

  NowPlayingStateCopyWith<NowPlayingState, NowPlayingState, NowPlayingState>
      get copyWith => _NowPlayingStateCopyWithImpl(
          this as NowPlayingState, $identity, $identity);
  @override
  String toString() {
    return NowPlayingStateMapper.ensureInitialized()
        .stringifyValue(this as NowPlayingState);
  }

  @override
  bool operator ==(Object other) {
    return NowPlayingStateMapper.ensureInitialized()
        .equalsValue(this as NowPlayingState, other);
  }

  @override
  int get hashCode {
    return NowPlayingStateMapper.ensureInitialized()
        .hashValue(this as NowPlayingState);
  }
}

extension NowPlayingStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NowPlayingState, $Out> {
  NowPlayingStateCopyWith<$R, NowPlayingState, $Out> get $asNowPlayingState =>
      $base.as((v, t, t2) => _NowPlayingStateCopyWithImpl(v, t, t2));
}

abstract class NowPlayingStateCopyWith<$R, $In extends NowPlayingState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Song, SongCopyWith<$R, Song, Song>> get playlist;
  SongCopyWith<$R, Song, Song>? get currentSong;
  $R call(
      {List<Song>? playlist,
      Song? currentSong,
      bool? hasNext,
      bool? hasPrevious});
  NowPlayingStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NowPlayingStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NowPlayingState, $Out>
    implements NowPlayingStateCopyWith<$R, NowPlayingState, $Out> {
  _NowPlayingStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NowPlayingState> $mapper =
      NowPlayingStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Song, SongCopyWith<$R, Song, Song>> get playlist =>
      ListCopyWith($value.playlist, (v, t) => v.copyWith.$chain(t),
          (v) => call(playlist: v));
  @override
  SongCopyWith<$R, Song, Song>? get currentSong =>
      $value.currentSong?.copyWith.$chain((v) => call(currentSong: v));
  @override
  $R call(
          {List<Song>? playlist,
          Object? currentSong = $none,
          bool? hasNext,
          bool? hasPrevious}) =>
      $apply(FieldCopyWithData({
        if (playlist != null) #playlist: playlist,
        if (currentSong != $none) #currentSong: currentSong,
        if (hasNext != null) #hasNext: hasNext,
        if (hasPrevious != null) #hasPrevious: hasPrevious
      }));
  @override
  NowPlayingState $make(CopyWithData data) => NowPlayingState(
      playlist: data.get(#playlist, or: $value.playlist),
      currentSong: data.get(#currentSong, or: $value.currentSong),
      hasNext: data.get(#hasNext, or: $value.hasNext),
      hasPrevious: data.get(#hasPrevious, or: $value.hasPrevious));

  @override
  NowPlayingStateCopyWith<$R2, NowPlayingState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NowPlayingStateCopyWithImpl($value, $cast, t);
}
