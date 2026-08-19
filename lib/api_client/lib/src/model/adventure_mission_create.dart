//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
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
/// * [missionCategory] 
/// * [unlockCode] 
/// * [unlockHintSv] 
/// * [unlockHintEn] 
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

  @BuiltValueField(wireName: r'mission_category')
  AdventureMissionCreateMissionCategoryEnum? get missionCategory;
  // enum missionCategoryEnum {  Barbiedans,  Fadder,  Kreativ,  Resa,  Spel,  Tävling,  Älg,  };

  @BuiltValueField(wireName: r'unlock_code')
  String? get unlockCode;

  @BuiltValueField(wireName: r'unlock_hint_sv')
  String? get unlockHintSv;

  @BuiltValueField(wireName: r'unlock_hint_en')
  String? get unlockHintEn;

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
    if (object.missionCategory != null) {
      yield r'mission_category';
      yield serializers.serialize(
        object.missionCategory,
        specifiedType: const FullType.nullable(AdventureMissionCreateMissionCategoryEnum),
      );
    }
    if (object.unlockCode != null) {
      yield r'unlock_code';
      yield serializers.serialize(
        object.unlockCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.unlockHintSv != null) {
      yield r'unlock_hint_sv';
      yield serializers.serialize(
        object.unlockHintSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.unlockHintEn != null) {
      yield r'unlock_hint_en';
      yield serializers.serialize(
        object.unlockHintEn,
        specifiedType: const FullType.nullable(String),
      );
    }
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
        case r'mission_category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(AdventureMissionCreateMissionCategoryEnum),
          ) as AdventureMissionCreateMissionCategoryEnum?;
          if (valueDes == null) continue;
          result.missionCategory = valueDes;
          break;
        case r'unlock_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.unlockCode = valueDes;
          break;
        case r'unlock_hint_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.unlockHintSv = valueDes;
          break;
        case r'unlock_hint_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.unlockHintEn = valueDes;
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

class AdventureMissionCreateMissionCategoryEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Barbiedans')
  static const AdventureMissionCreateMissionCategoryEnum barbiedans = _$adventureMissionCreateMissionCategoryEnum_barbiedans;
  @BuiltValueEnumConst(wireName: r'Fadder')
  static const AdventureMissionCreateMissionCategoryEnum fadder = _$adventureMissionCreateMissionCategoryEnum_fadder;
  @BuiltValueEnumConst(wireName: r'Kreativ')
  static const AdventureMissionCreateMissionCategoryEnum kreativ = _$adventureMissionCreateMissionCategoryEnum_kreativ;
  @BuiltValueEnumConst(wireName: r'Resa')
  static const AdventureMissionCreateMissionCategoryEnum resa = _$adventureMissionCreateMissionCategoryEnum_resa;
  @BuiltValueEnumConst(wireName: r'Spel')
  static const AdventureMissionCreateMissionCategoryEnum spel = _$adventureMissionCreateMissionCategoryEnum_spel;
  @BuiltValueEnumConst(wireName: r'Tävling')
  static const AdventureMissionCreateMissionCategoryEnum tvling = _$adventureMissionCreateMissionCategoryEnum_tvling;
  @BuiltValueEnumConst(wireName: r'Älg')
  static const AdventureMissionCreateMissionCategoryEnum lg = _$adventureMissionCreateMissionCategoryEnum_lg;

  static Serializer<AdventureMissionCreateMissionCategoryEnum> get serializer => _$adventureMissionCreateMissionCategoryEnumSerializer;

  const AdventureMissionCreateMissionCategoryEnum._(String name): super(name);

  static BuiltSet<AdventureMissionCreateMissionCategoryEnum> get values => _$adventureMissionCreateMissionCategoryEnumValues;
  static AdventureMissionCreateMissionCategoryEnum valueOf(String name) => _$adventureMissionCreateMissionCategoryEnumValueOf(name);
}

