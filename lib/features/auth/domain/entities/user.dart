class User {
  final String name;
  final String password;
  final String login;
  final String role;
  final String createdAt;
  final String processedAt;
  final bool excluded;
  final String id;

  User({
    required this.name,
    required this.password,
    required this.login,
    required this.role,
    required this.createdAt,
    required this.processedAt,
    required this.excluded,
    required this.id,
  });

  factory User.empty() {
    return User(
      name: '',
      password: '',
      login: '',
      role: '',
      createdAt: '',
      processedAt: '',
      excluded: false,
      id: '',
    );
  }

  User copyWith({
    String? name,
    String? password,
    String? login,
    String? role,
    String? createdAt,
    String? processedAt,
    bool? excluded,
    String? id,
  }) {
    return User(
      name: name ?? this.name,
      password: password ?? this.password,
      login: login ?? this.login,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
      processedAt: processedAt ?? this.processedAt,
      excluded: excluded ?? this.excluded,
      id: id ?? this.id,
    );
  }

  @override
  toString() {
    return 'User(name: $name, password: $password, login: $login, role: $role, createdAt: $createdAt, processedAt: $processedAt, excluded: $excluded, id: $id)';
  }
}
