import 'package:dart_mappable/dart_mappable.dart';

part 'user.mapper.dart';

@MappableClass()
class UserModel with UserModelMappable {
  final String id;
  final String email;

  UserModel({
    required this.id,
    required this.email,
  });
}
