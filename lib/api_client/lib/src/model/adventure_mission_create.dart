//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'adventure_mission_create.g.dart';

/// AdventureMissionCreate
///
/// Properties:
/// * [titleSv] 
/// * [titleEn] 
/// * [descriptionSv] 
/// * [descriptionEn] 
/// * [maxPoints] 
/// * [minPoints] 
/// * [nollningWeek] 
@BuiltValue()
abstract class AdventureMissionCreate implements Built<AdventureMissionCreate, AdventureMissionCreateBuilder> {
  @BuiltValueField(wireName: r'title_sv')
  String get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String get titleEn;

  @BuiltValueField(wireName: r'description_sv')
  String get descriptionSv;

  @BuiltValueField(wireName: r'description_en')
  String get descriptionEn;

  @BuiltValueField(wireName: r'max_points')
  int get maxPoints;

  @BuiltValueField(wireName: r'min_points')
  int get minPoints;

  @BuiltValueField(wireName: r'nollning_week')
  int get nollningWeek;

  AdventureMissionCreate._();

  factory AdventureMissionCreate([void updates(AdventureMissionCreateBuilder b)]) = _$AdventureMissionCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdventureMissionCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdventureMissionCreate> get serializer => _$AdventureMissionCreateSerializer();
}

class _$AdventureMissionCreateSerializer implements PrimitiveSerializer<AdventureMissionCreate> {
  @override
  final Iterable<Type> types = const [AdventureMissionCreate, _$AdventureMissionCreate];

  @override
  final String wireName = r'AdventureMissionCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdventureMissionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'title_sv';
    yield serializers.serialize(
      object.titleSv,
      specifiedType: const FullType(String),
    );
    yield r'title_en';
    yield serializers.serialize(
      object.titleEn,
      specifiedType: const FullType(String),
    );
    yield r'description_sv';
    yield serializers.serialize(
      object.descriptionSv,
      specifiedType: const FullType(String),
    );
    yield r'description_en';
    yield serializers.serialize(
      object.descriptionEn,
      specifiedType: const FullType(String),
    );
    yield r'max_points';
    yield serializers.serialize(
      object.maxPoints,
      specifiedType: const FullType(int),
    );
    yield r'min_points';
    yield serializers.serialize(
      object.minPoints,
      specifiedType: const FullType(int),
    );
    yield r'nollning_week';
    yield serializers.serialize(
      object.nollningWeek,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdventureMissionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdventureMissionCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.titleSv = valueDes;
          break;
        case r'title_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.titleEn = valueDes;
          break;
        case r'description_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.descriptionSv = valueDes;
          break;
        case r'description_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.descriptionEn = valueDes;
          break;
        case r'max_points':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.maxPoints = valueDes;
          break;
        case r'min_points':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.minPoints = valueDes;
          break;
        case r'nollning_week':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.nollningWeek = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdventureMissionCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdventureMissionCreateBuilder();
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

