import 'package:json_annotation/json_annotation.dart';

part 'menu_item.g.dart';

@JsonSerializable()
class MenuItem {
  Map<String, String>? item;
  String? price;

  MenuItem();

  factory MenuItem.fromJson(Map<String, dynamic> json) =>
      _$MenuItemFromJson(json);
  Map<String, dynamic> toJson() => _$MenuItemToJson(this);
}
