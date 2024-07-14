class UserModel {
  final String id;
  final String name;
  final String password;
  final String login;
  final String role;
  final String createdAt;
  final String processedAt;
  final bool excluded;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.password,
    required this.login,
    required this.role,
    required this.createdAt,
    required this.processedAt,
    required this.excluded,
    required this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['person']['name'],
      password: map['person']['password'],
      login: map['person']['login'],
      role: map['person']['role'],
      createdAt: map['person']['createdAt']['timeStamp'],
      processedAt: map['person']['processedAt']['timeStamp'],
      excluded: map['person']['excluded'],
      id: map['person']['id'],
      token: map['token'],
    );
  }
}
