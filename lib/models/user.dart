class User {
  final String id;
  final String username;
  final String role;

  const User({required this.username, required this.role, required this.id});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['_id'],
      username: json['username'],
      role: json['role'],
    );
  }
}
