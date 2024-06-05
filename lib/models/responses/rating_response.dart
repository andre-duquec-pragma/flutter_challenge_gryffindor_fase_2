import 'dart:convert';

/// A data model to represent product ratings details.
final class RatingResponse {
  final double? rate;
  final int? count;

  RatingResponse({
    this.rate,
    this.count,
  });

  RatingResponse copyWith({
    double? rate,
    int? count,
  }) {
    return RatingResponse(
      rate: rate ?? this.rate,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory RatingResponse.fromMap(Map<String, dynamic> map) {
    return RatingResponse(
      rate: map['rate'] != null ? map['rate'] as double : null,
      count: map['count'] != null ? map['count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RatingResponse.fromJson(String source) => RatingResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RatingResponse(rate: $rate, count: $count)';

  @override
  bool operator ==(covariant RatingResponse other) {
    if (identical(this, other)) return true;

    return other.rate == rate && other.count == count;
  }

  @override
  int get hashCode => rate.hashCode ^ count.hashCode;
}
