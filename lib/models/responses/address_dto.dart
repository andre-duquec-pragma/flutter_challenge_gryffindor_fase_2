// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'geo_location_response.dart';

/// A data model to encapsulate user address and location details.
final class AddressResponse {
  GeoLocationResponse? geoLocation;
  String? city;
  String? street;
  int? number;
  String? zipCode;

  AddressResponse({
    this.geoLocation,
    this.city,
    this.street,
    this.number,
    this.zipCode,
  });

  AddressResponse copyWith({
    GeoLocationResponse? geoLocation,
    String? city,
    String? street,
    int? number,
    String? zipCode,
  }) {
    return AddressResponse(
      geoLocation: geoLocation ?? this.geoLocation,
      city: city ?? this.city,
      street: street ?? this.street,
      number: number ?? this.number,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'geolocation': geoLocation?.toMap(),
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipCode,
    };
  }

  factory AddressResponse.fromMap(Map<String, dynamic> map) {
    return AddressResponse(
      geoLocation:
          map['geolocation'] != null ? GeoLocationResponse.fromMap(map['geolocation'] as Map<String, dynamic>) : null,
      city: map['city'] != null ? map['city'] as String : null,
      street: map['street'] != null ? map['street'] as String : null,
      number: map['number'] != null ? map['number'] as int : null,
      zipCode: map['zipcode'] != null ? map['zipcode'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressResponse.fromJson(String source) =>
      AddressResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressResponse(geoLocation: $geoLocation, city: $city, street: $street, number: $number, zipCode: $zipCode)';
  }

  @override
  bool operator ==(covariant AddressResponse other) {
    if (identical(this, other)) return true;

    return other.geoLocation == geoLocation &&
        other.city == city &&
        other.street == street &&
        other.number == number &&
        other.zipCode == zipCode;
  }

  @override
  int get hashCode {
    return geoLocation.hashCode ^ city.hashCode ^ street.hashCode ^ number.hashCode ^ zipCode.hashCode;
  }
}
