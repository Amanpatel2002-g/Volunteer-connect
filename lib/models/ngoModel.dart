// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:core';

class NGOModel {
  String id;
  String name;
  String uniqueId;
  String ?profileUrl;
  String country;
  String state;
  String city;
  String token;
  NGOModel(
      {required this.id,
      required this.name,
      required this.uniqueId,
      this.profileUrl,
      this.country = '',
      this.state = '',
      this.city = '',
      this.token = ''});

  NGOModel copyWith({
    String? id,
    String? name,
    String? uniqueId,
    String? country,
    String? state,
    String? city,
    String? token,
  }) {
    return NGOModel(
      id: id ?? this.id,
      name: name ?? this.name,
      uniqueId: uniqueId ?? this.uniqueId,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'uniqueId': uniqueId,
      'country': country,
      'state': state,
      'city': city,
      'token': token,
    };
  }

  factory NGOModel.fromMap(Map<String, dynamic> map) {
    return NGOModel(
      id: map['_id'],
      name: map['name'],
      uniqueId: map['uniqueId'],
      country: map['country'] ?? '',
      state: map['state'] ?? '',
      city: map['city'] ?? '',
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NGOModel.fromJson(String source) =>
      NGOModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NGOModel(id: $id, name: $name, uniqueId: $uniqueId, country: $country, state: $state, city: $city, token: $token)';
  }

  @override
  bool operator ==(covariant NGOModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.uniqueId == uniqueId &&
        other.country == country &&
        other.state == state &&
        other.city == city &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        uniqueId.hashCode ^
        country.hashCode ^
        state.hashCode ^
        city.hashCode ^
        token.hashCode;
  }
}
