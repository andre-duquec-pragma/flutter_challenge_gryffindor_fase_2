import 'dart:convert';

/// A data model to represent all products categories.
final class CategoriesResponse {
  final List<String> data;

  const CategoriesResponse({
    required this.data,
  });

  CategoriesResponse copyWith({
    List<String>? data,
  }) {
    return CategoriesResponse(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory CategoriesResponse.fromMap(Map<String, dynamic> map) {
    return CategoriesResponse(
      data: List<String>.from((map['data'])),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesResponse.fromJson(String source) =>
      CategoriesResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoriesResponse(data: $data)';

  @override
  bool operator ==(covariant CategoriesResponse other) {
    return identical(this, other);
  }

  @override
  int get hashCode => data.hashCode;
}
