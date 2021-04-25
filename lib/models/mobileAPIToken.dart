import 'package:json_annotation/json_annotation.dart';

part 'mobileAPIToken.g.dart'; //generated JSON file

@JsonSerializable()

class MobileAPIToken {
  String accessToken;
  String refreshToken;
  DateTime expires;

  MobileAPIToken({
    this.accessToken, 
    this.refreshToken, 
    this.expires
  });

  factory MobileAPIToken.fromJson(Map<String, dynamic> json) => _$MobileAPITokenFromJson(json);

  Map<String, dynamic> toJson() => _$MobileAPITokenToJson(this);
}