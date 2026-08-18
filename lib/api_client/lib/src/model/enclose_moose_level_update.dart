//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'enclose_moose_level_update.g.dart';

/// EncloseMooseLevelUpdate
///
/// Properties:
/// * [releaseDate] 
/// * [dayIndex] 
/// * [nameSv] 
/// * [nameEn] 
/// * [encodedGrid] 
/// * [wallBudget] 
@BuiltValue()
abstract class EncloseMooseLevelUpdate implements Built<EncloseMooseLevelUpdate, EncloseMooseLevelUpdateBuilder> {
  @BuiltValueField(wireName: r'release_date')
  Date? get releaseDate;

  @BuiltValueField(wireName: r'day_index')
  int? get dayIndex;

  @BuiltValueField(wireName: r'name_sv')
  String? get nameSv;

  @BuiltValueField(wireName: r'name_en')
  String? get nameEn;

  @BuiltValueField(wireName: r'encoded_grid')
  String? get encodedGrid;

  @BuiltValueField(wireName: r'wall_budget')
  int? get wallBudget;

  EncloseMooseLevelUpdate._();

  factory EncloseMooseLevelUpdate([void updates(EncloseMooseLevelUpdateBuilder b)]) = _$EncloseMooseLevelUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EncloseMooseLevelUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EncloseMooseLevelUpdate> get serializer => _$EncloseMooseLevelUpdateSerializer();
}

class _$EncloseMooseLevelUpdateSerializer implements PrimitiveSerializer<EncloseMooseLevelUpdate> {
  @override
  final Iterable<Type> types = const [EncloseMooseLevelUpdate, _$EncloseMooseLevelUpdate];

  @override
  final String wireName = r'EncloseMooseLevelUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EncloseMooseLevelUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.releaseDate != null) {
      yield r'release_date';
      yield serializers.serialize(
        object.releaseDate,
        specifiedType: const FullType.nullable(Date),
      );
    }
    if (object.dayIndex != null) {
      yield r'day_index';
      yield serializers.serialize(
        object.dayIndex,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.nameSv != null) {
      yield r'name_sv';
      yield serializers.serialize(
        object.nameSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.nameEn != null) {
      yield r'name_en';
      yield serializers.serialize(
        object.nameEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.encodedGrid != null) {
      yield r'encoded_grid';
      yield serializers.serialize(
        object.encodedGrid,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.wallBudget != null) {
      yield r'wall_budget';
      yield serializers.serialize(
        object.wallBudget,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EncloseMooseLevelUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EncloseMooseLevelUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'release_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(Date),
          ) as Date?;
          if (valueDes == null) continue;
          result.releaseDate = valueDes;
          break;
        case r'day_index':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.dayIndex = valueDes;
          break;
        case r'name_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nameSv = valueDes;
          break;
        case r'name_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.nameEn = valueDes;
          break;
        case r'encoded_grid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.encodedGrid = valueDes;
          break;
        case r'wall_budget':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.wallBudget = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  EncloseMooseLevelUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EncloseMooseLevelUpdateBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

