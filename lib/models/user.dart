class User {
  final String username;
  final String password;
  final String role;

  const User(
      {required this.username, required this.password, required this.role});

  factory User.fromJSON(Map json) {
    print(json);
    return User(
      username: json['username'],
      password: json['password'],
      role: json['role'],
    );
  }
}
