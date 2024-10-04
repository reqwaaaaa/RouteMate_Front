class User {
  final String id;
  final String username;
  final String email;
  final String? token;

  User({
    required this.id,
    required this.username,
    required this.email,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '', // 后端返回的用户ID
      username: json['username'] ?? '', // 后端返回的用户名
      email: json['email'] ?? '', // 后端返回的邮箱
      token: json['access_token'], // 后端返回的JWT token
    );
  }
}
