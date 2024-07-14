class UserEntity {
  final String id;
  final String name;
  final String password;
  final String login;
  final String role;
  final String createdAt;
  final String processedAt;
  final bool excluded;
  final String token;

  UserEntity({
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

  factory UserEntity.empty() {
    return UserEntity(
      id: '',
      name: '',
      password: '',
      login: '',
      role: '',
      createdAt: '',
      processedAt: '',
      excluded: false,
      token: '',
    );
  }

  UserEntity copyWith({
    String? id,
    String? name,
    String? password,
    String? login,
    String? role,
    String? createdAt,
    String? processedAt,
    bool? excluded,
    String? token,
  }) {
    return UserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      login: login ?? this.login,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      processedAt: processedAt ?? this.processedAt,
      excluded: excluded ?? this.excluded,
      token: token ?? this.token,
    );
  }

  @override
  toString() {
    return 'UserEntity(id: $id, name: $name, password: $password, login: $login, role: $role, createdAt: $createdAt, processedAt: $processedAt, excluded: $excluded, token: $token)';
  }
}
