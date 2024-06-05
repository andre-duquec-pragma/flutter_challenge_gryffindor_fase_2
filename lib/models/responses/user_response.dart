import 'dart:convert';

import 'address_response.dart';
import 'name_response.dart';

/// A data model to represent specific user details.
final class UserResponse {
  AddressResponse? address;
  int? id;
  String? email;
  String? username;
  String? password;
  NameResponse? name;
  String? phone;
  int? iV;

  UserResponse({
    this.address,
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,
    this.iV,
  });

  UserResponse copyWith({
    AddressResponse? address,
    int? id,
    String? email,
    String? username,
    String? password,
    NameResponse? name,
    String? phone,
    int? iV,
  }) {
    return UserResponse(
      address: address ?? this.address,
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      iV: iV ?? this.iV,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address?.toMap(),
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name?.toMap(),
      'phone': phone,
      'iV': iV,
    };
  }

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      address: map['address'] != null ? AddressResponse.fromMap(map['address'] as Map<String, dynamic>) : null,
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      name: map['name'] != null ? NameResponse.fromMap(map['name'] as Map<String, dynamic>) : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      iV: map['iV'] != null ? map['iV'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) => UserResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserResponse(address: $address, id: $id, email: $email, username: $username, password: $password, name: $name, phone: $phone, iV: $iV)';
  }

  @override
  bool operator ==(covariant UserResponse other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.id == id &&
        other.email == email &&
        other.username == username &&
        other.password == password &&
        other.name == name &&
        other.phone == phone &&
        other.iV == iV;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        id.hashCode ^
        email.hashCode ^
        username.hashCode ^
        password.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        iV.hashCode;
  }
}
