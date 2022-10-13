class User {
  final String username;
  final String password;
  final String email;
  final String phone;

  const User({required this.username, required this.password, required this.phone, required this.email});

  factory User.fromJSON(Map<String, dynamic> json){
    return User(
      username: json['username'],
      password: json['password'],
      email: json['email'],
      phone: json['phone'],
    );
  }

}