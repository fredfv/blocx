import '../../../domain/entities/user.dart';

abstract interface class Mapper<T> {
  T fromAPI(Map<String, dynamic> json);
}

class UserMapperV1 implements Mapper<User> {
  @override
  User fromAPI(Map<String, dynamic> json) {
    return User(
      name: json['person']['name'],
      password: json['person']['password'],
      login: json['person']['login'],
      role: json['person']['role'],
      createdAt: json['person']['createdAt']['timeStamp'],
      processedAt: json['person']['processedAt']['timeStamp'],
      excluded: json['person']['excluded'],
      id: json['person']['id'],
    );
  }
}
