// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'audio_player_service_state.dart';

class AudioPlayerServiceStateMapper
    extends ClassMapperBase<AudioPlayerServiceState> {
  AudioPlayerServiceStateMapper._();

  static AudioPlayerServiceStateMapper? _instance;
  static AudioPlayerServiceStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = AudioPlayerServiceStateMapper._());
      SongMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AudioPlayerServiceState';

  static AudioPlayerState _$playerState(AudioPlayerServiceState v) =>
      v.playerState;
  static const Field<AudioPlayerServiceState, AudioPlayerState> _f$playerState =
      Field('playerState', _$playerState);
  static Duration _$position(AudioPlayerServiceState v) => v.position;
  static const Field<AudioPlayerServiceState, Duration> _f$position =
      Field('position', _$position);
  static Song? _$currentSong(AudioPlayerServiceState v) => v.currentSong;
  static const Field<AudioPlayerServiceState, Song> _f$currentSong =
      Field('currentSong', _$currentSong);

  @override
  final MappableFields<AudioPlayerServiceState> fields = const {
    #playerState: _f$playerState,
    #position: _f$position,
    #currentSong: _f$currentSong,
  };

  static AudioPlayerServiceState _instantiate(DecodingData data) {
    return AudioPlayerServiceState(
        playerState: data.dec(_f$playerState),
        position: data.dec(_f$position),
        currentSong: data.dec(_f$currentSong));
  }

  @override
  final Function instantiate = _instantiate;

  static AudioPlayerServiceState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AudioPlayerServiceState>(map);
  }

  static AudioPlayerServiceState fromJson(String json) {
    return ensureInitialized().decodeJson<AudioPlayerServiceState>(json);
  }
}

mixin AudioPlayerServiceStateMappable {
  String toJson() {
    return AudioPlayerServiceStateMapper.ensureInitialized()
        .encodeJson<AudioPlayerServiceState>(this as AudioPlayerServiceState);
  }

  Map<String, dynamic> toMap() {
    return AudioPlayerServiceStateMapper.ensureInitialized()
        .encodeMap<AudioPlayerServiceState>(this as AudioPlayerServiceState);
  }

  AudioPlayerServiceStateCopyWith<AudioPlayerServiceState,
          AudioPlayerServiceState, AudioPlayerServiceState>
      get copyWith => _AudioPlayerServiceStateCopyWithImpl(
          this as AudioPlayerServiceState, $identity, $identity);
  @override
  String toString() {
    return AudioPlayerServiceStateMapper.ensureInitialized()
        .stringifyValue(this as AudioPlayerServiceState);
  }

  @override
  bool operator ==(Object other) {
    return AudioPlayerServiceStateMapper.ensureInitialized()
        .equalsValue(this as AudioPlayerServiceState, other);
  }

  @override
  int get hashCode {
    return AudioPlayerServiceStateMapper.ensureInitialized()
        .hashValue(this as AudioPlayerServiceState);
  }
}

extension AudioPlayerServiceStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AudioPlayerServiceState, $Out> {
  AudioPlayerServiceStateCopyWith<$R, AudioPlayerServiceState, $Out>
      get $asAudioPlayerServiceState => $base
          .as((v, t, t2) => _AudioPlayerServiceStateCopyWithImpl(v, t, t2));
}

abstract class AudioPlayerServiceStateCopyWith<
    $R,
    $In extends AudioPlayerServiceState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  SongCopyWith<$R, Song, Song>? get currentSong;
  $R call(
      {AudioPlayerState? playerState, Duration? position, Song? currentSong});
  AudioPlayerServiceStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _AudioPlayerServiceStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AudioPlayerServiceState, $Out>
    implements
        AudioPlayerServiceStateCopyWith<$R, AudioPlayerServiceState, $Out> {
  _AudioPlayerServiceStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AudioPlayerServiceState> $mapper =
      AudioPlayerServiceStateMapper.ensureInitialized();
  @override
  SongCopyWith<$R, Song, Song>? get currentSong =>
      $value.currentSong?.copyWith.$chain((v) => call(currentSong: v));
  @override
  $R call(
          {AudioPlayerState? playerState,
          Duration? position,
          Object? currentSong = $none}) =>
      $apply(FieldCopyWithData({
        if (playerState != null) #playerState: playerState,
        if (position != null) #position: position,
        if (currentSong != $none) #currentSong: currentSong
      }));
  @override
  AudioPlayerServiceState $make(CopyWithData data) => AudioPlayerServiceState(
      playerState: data.get(#playerState, or: $value.playerState),
      position: data.get(#position, or: $value.position),
      currentSong: data.get(#currentSong, or: $value.currentSong));

  @override
  AudioPlayerServiceStateCopyWith<$R2, AudioPlayerServiceState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _AudioPlayerServiceStateCopyWithImpl($value, $cast, t);
}
