import 'package:json_annotation/json_annotation.dart';

part 'devise_token.g.dart'; //generated JSON file

@JsonSerializable()

class DeviseToken {
  String? accessToken;
  DateTime? expires;
  String? error;

  DeviseToken({
    this.accessToken, 
    this.expires,
    this.error
  });

  factory DeviseToken.fromJson(Map<String, dynamic> json) => _$DeviseTokenFromJson(json);

  Map<String, dynamic> toJson() => _$DeviseTokenToJson(this);
}