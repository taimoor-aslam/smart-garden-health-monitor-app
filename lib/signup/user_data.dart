class UserData {
  final String name;
  final String username;
  final String email;
  final String password;
  final String role;

  UserData({this.name, this.username, this.email, this.password, this.role});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        name: json['name'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        role: json['role']);
  }
}
