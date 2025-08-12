//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'dart:core';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/any_of.dart';

part 'detail.g.dart';

/// Detail
@BuiltValue()
abstract class Detail implements Built<Detail, DetailBuilder> {
  /// Any Of [BuiltMap<String, String>], [String]
  AnyOf get anyOf;

  Detail._();

  factory Detail([void updates(DetailBuilder b)]) = _$Detail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Detail> get serializer => _$DetailSerializer();
}

class _$DetailSerializer implements PrimitiveSerializer<Detail> {
  @override
  final Iterable<Type> types = const [Detail, _$Detail];

  @override
  final String wireName = r'Detail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Detail object) sync* {
  }

  @override
  Object serialize(
    Serializers serializers,
    Detail object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final anyOf = object.anyOf;
    return serializers.serialize(anyOf, specifiedType: FullType(AnyOf, anyOf.valueTypes.map((type) => FullType(type)).toList()))!;
  }

  @override
  Detail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DetailBuilder();
    Object? anyOfDataSrc;
    final targetType = const FullType(AnyOf, [FullType(String), FullType(BuiltMap, [FullType(String), FullType(String)]), ]);
    anyOfDataSrc = serialized;
    result.anyOf = serializers.deserialize(anyOfDataSrc, specifiedType: targetType) as AnyOf;
    return result.build();
  }
}

