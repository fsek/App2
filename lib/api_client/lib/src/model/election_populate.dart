//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'election_populate.g.dart';

/// ElectionPopulate
///
/// Properties:
/// * [semester] 
/// * [endTimeGuild] 
/// * [endTimeBoard] 
/// * [endTimeBoardIntermediate] 
/// * [endTimeEducationalCouncil] 
@BuiltValue()
abstract class ElectionPopulate implements Built<ElectionPopulate, ElectionPopulateBuilder> {
  @BuiltValueField(wireName: r'semester')
  ElectionPopulateSemesterEnum get semester;
  // enum semesterEnum {  HT,  VT,  Other,  };

  @BuiltValueField(wireName: r'end_time_guild')
  DateTime get endTimeGuild;

  @BuiltValueField(wireName: r'end_time_board')
  DateTime get endTimeBoard;

  @BuiltValueField(wireName: r'end_time_board_intermediate')
  DateTime get endTimeBoardIntermediate;

  @BuiltValueField(wireName: r'end_time_educational_council')
  DateTime get endTimeEducationalCouncil;

  ElectionPopulate._();

  factory ElectionPopulate([void updates(ElectionPopulateBuilder b)]) = _$ElectionPopulate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ElectionPopulateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ElectionPopulate> get serializer => _$ElectionPopulateSerializer();
}

class _$ElectionPopulateSerializer implements PrimitiveSerializer<ElectionPopulate> {
  @override
  final Iterable<Type> types = const [ElectionPopulate, _$ElectionPopulate];

  @override
  final String wireName = r'ElectionPopulate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ElectionPopulate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'semester';
    yield serializers.serialize(
      object.semester,
      specifiedType: const FullType(ElectionPopulateSemesterEnum),
    );
    yield r'end_time_guild';
    yield serializers.serialize(
      object.endTimeGuild,
      specifiedType: const FullType(DateTime),
    );
    yield r'end_time_board';
    yield serializers.serialize(
      object.endTimeBoard,
      specifiedType: const FullType(DateTime),
    );
    yield r'end_time_board_intermediate';
    yield serializers.serialize(
      object.endTimeBoardIntermediate,
      specifiedType: const FullType(DateTime),
    );
    yield r'end_time_educational_council';
    yield serializers.serialize(
      object.endTimeEducationalCouncil,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ElectionPopulate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ElectionPopulateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'semester':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ElectionPopulateSemesterEnum),
          ) as ElectionPopulateSemesterEnum;
          result.semester = valueDes;
          break;
        case r'end_time_guild':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endTimeGuild = valueDes;
          break;
        case r'end_time_board':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endTimeBoard = valueDes;
          break;
        case r'end_time_board_intermediate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endTimeBoardIntermediate = valueDes;
          break;
        case r'end_time_educational_council':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endTimeEducationalCouncil = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ElectionPopulate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ElectionPopulateBuilder();
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

class ElectionPopulateSemesterEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'HT')
  static const ElectionPopulateSemesterEnum HT = _$electionPopulateSemesterEnum_HT;
  @BuiltValueEnumConst(wireName: r'VT')
  static const ElectionPopulateSemesterEnum VT = _$electionPopulateSemesterEnum_VT;
  @BuiltValueEnumConst(wireName: r'Other')
  static const ElectionPopulateSemesterEnum other = _$electionPopulateSemesterEnum_other;

  static Serializer<ElectionPopulateSemesterEnum> get serializer => _$electionPopulateSemesterEnumSerializer;

  const ElectionPopulateSemesterEnum._(String name): super(name);

  static BuiltSet<ElectionPopulateSemesterEnum> get values => _$electionPopulateSemesterEnumValues;
  static ElectionPopulateSemesterEnum valueOf(String name) => _$electionPopulateSemesterEnumValueOf(name);
}

