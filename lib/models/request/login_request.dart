// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// A Data model to send when attempt to perform a login request
final class LoginRequest {
  final String username;
  final String password;

  const LoginRequest({
    required this.username,
    required this.password,
  });

  LoginRequest copyWith({
    String? username,
    String? password,
  }) {
    return LoginRequest(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory LoginRequest.fromMap(Map<String, dynamic> map) {
    return LoginRequest(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromJson(String source) => LoginRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginRequest(username: $username, password: $password)';

  @override
  bool operator ==(covariant LoginRequest other) {
    if (identical(this, other)) return true;

    return other.username == username && other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
