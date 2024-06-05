import 'dart:convert';

/// A data model to encapsulate user name details.
final class NameResponse {
  String? firstName;
  String? lastName;

  NameResponse({
    this.firstName,
    this.lastName,
  });

  NameResponse copyWith({
    String? firstName,
    String? lastName,
  }) {
    return NameResponse(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstName,
      'lastname': lastName,
    };
  }

  factory NameResponse.fromMap(Map<String, dynamic> map) {
    return NameResponse(
      firstName: map['firstname'] != null ? map['firstname'] as String : null,
      lastName: map['lastname'] != null ? map['lastname'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NameResponse.fromJson(String source) => NameResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NameResponse(firstName: $firstName, lastName: $lastName)';

  @override
  bool operator ==(covariant NameResponse other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName && other.lastName == lastName;
  }

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode;
}
