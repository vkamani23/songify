// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_state.dart';

class AuthStateMapper extends ClassMapperBase<AuthState> {
  AuthStateMapper._();

  static AuthStateMapper? _instance;
  static AuthStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AuthState';

  static String _$email(AuthState v) => v.email;
  static const Field<AuthState, String> _f$email = Field('email', _$email);
  static String _$password(AuthState v) => v.password;
  static const Field<AuthState, String> _f$password =
      Field('password', _$password);
  static bool _$isLoading(AuthState v) => v.isLoading;
  static const Field<AuthState, bool> _f$isLoading =
      Field('isLoading', _$isLoading, opt: true, def: false);
  static bool _$isAuthenticated(AuthState v) => v.isAuthenticated;
  static const Field<AuthState, bool> _f$isAuthenticated =
      Field('isAuthenticated', _$isAuthenticated, opt: true, def: false);
  static String? _$error(AuthState v) => v.error;
  static const Field<AuthState, String> _f$error =
      Field('error', _$error, opt: true);

  @override
  final MappableFields<AuthState> fields = const {
    #email: _f$email,
    #password: _f$password,
    #isLoading: _f$isLoading,
    #isAuthenticated: _f$isAuthenticated,
    #error: _f$error,
  };

  static AuthState _instantiate(DecodingData data) {
    return AuthState(
        email: data.dec(_f$email),
        password: data.dec(_f$password),
        isLoading: data.dec(_f$isLoading),
        isAuthenticated: data.dec(_f$isAuthenticated),
        error: data.dec(_f$error));
  }

  @override
  final Function instantiate = _instantiate;

  static AuthState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthState>(map);
  }

  static AuthState fromJson(String json) {
    return ensureInitialized().decodeJson<AuthState>(json);
  }
}

mixin AuthStateMappable {
  String toJson() {
    return AuthStateMapper.ensureInitialized()
        .encodeJson<AuthState>(this as AuthState);
  }

  Map<String, dynamic> toMap() {
    return AuthStateMapper.ensureInitialized()
        .encodeMap<AuthState>(this as AuthState);
  }

  AuthStateCopyWith<AuthState, AuthState, AuthState> get copyWith =>
      _AuthStateCopyWithImpl(this as AuthState, $identity, $identity);
  @override
  String toString() {
    return AuthStateMapper.ensureInitialized()
        .stringifyValue(this as AuthState);
  }

  @override
  bool operator ==(Object other) {
    return AuthStateMapper.ensureInitialized()
        .equalsValue(this as AuthState, other);
  }

  @override
  int get hashCode {
    return AuthStateMapper.ensureInitialized().hashValue(this as AuthState);
  }
}

extension AuthStateValueCopy<$R, $Out> on ObjectCopyWith<$R, AuthState, $Out> {
  AuthStateCopyWith<$R, AuthState, $Out> get $asAuthState =>
      $base.as((v, t, t2) => _AuthStateCopyWithImpl(v, t, t2));
}

abstract class AuthStateCopyWith<$R, $In extends AuthState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? email,
      String? password,
      bool? isLoading,
      bool? isAuthenticated,
      String? error});
  AuthStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthState, $Out>
    implements AuthStateCopyWith<$R, AuthState, $Out> {
  _AuthStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthState> $mapper =
      AuthStateMapper.ensureInitialized();
  @override
  $R call(
          {String? email,
          String? password,
          bool? isLoading,
          bool? isAuthenticated,
          Object? error = $none}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (password != null) #password: password,
        if (isLoading != null) #isLoading: isLoading,
        if (isAuthenticated != null) #isAuthenticated: isAuthenticated,
        if (error != $none) #error: error
      }));
  @override
  AuthState $make(CopyWithData data) => AuthState(
      email: data.get(#email, or: $value.email),
      password: data.get(#password, or: $value.password),
      isLoading: data.get(#isLoading, or: $value.isLoading),
      isAuthenticated: data.get(#isAuthenticated, or: $value.isAuthenticated),
      error: data.get(#error, or: $value.error));

  @override
  AuthStateCopyWith<$R2, AuthState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AuthStateCopyWithImpl($value, $cast, t);
}
