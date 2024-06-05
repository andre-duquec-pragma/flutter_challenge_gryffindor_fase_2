import 'dart:convert';

/// A data model to encapsulate user geo location details.
final class GeoLocationResponse {
  String? lat;
  String? long;

  GeoLocationResponse({
    this.lat,
    this.long,
  });

  GeoLocationResponse copyWith({
    String? lat,
    String? long,
  }) {
    return GeoLocationResponse(
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'long': long,
    };
  }

  factory GeoLocationResponse.fromMap(Map<String, dynamic> map) {
    return GeoLocationResponse(
      lat: map['lat'] != null ? map['lat'] as String : null,
      long: map['long'] != null ? map['long'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoLocationResponse.fromJson(String source) =>
      GeoLocationResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GeoLocationResponse(lat: $lat, long: $long)';

  @override
  bool operator ==(covariant GeoLocationResponse other) {
    if (identical(this, other)) return true;

    return other.lat == lat && other.long == long;
  }

  @override
  int get hashCode => lat.hashCode ^ long.hashCode;
}
