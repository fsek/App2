//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sub_election_create.g.dart';

/// SubElectionCreate
///
/// Properties:
/// * [electionId] 
/// * [titleSv] 
/// * [titleEn] 
/// * [endTime] 
/// * [postIds] 
@BuiltValue()
abstract class SubElectionCreate implements Built<SubElectionCreate, SubElectionCreateBuilder> {
  @BuiltValueField(wireName: r'election_id')
  int get electionId;

  @BuiltValueField(wireName: r'title_sv')
  String get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String get titleEn;

  @BuiltValueField(wireName: r'end_time')
  DateTime get endTime;

  @BuiltValueField(wireName: r'post_ids')
  BuiltList<int>? get postIds;

  SubElectionCreate._();

  factory SubElectionCreate([void updates(SubElectionCreateBuilder b)]) = _$SubElectionCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubElectionCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubElectionCreate> get serializer => _$SubElectionCreateSerializer();
}

class _$SubElectionCreateSerializer implements PrimitiveSerializer<SubElectionCreate> {
  @override
  final Iterable<Type> types = const [SubElectionCreate, _$SubElectionCreate];

  @override
  final String wireName = r'SubElectionCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubElectionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'election_id';
    yield serializers.serialize(
      object.electionId,
      specifiedType: const FullType(int),
    );
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
    yield r'end_time';
    yield serializers.serialize(
      object.endTime,
      specifiedType: const FullType(DateTime),
    );
    if (object.postIds != null) {
      yield r'post_ids';
      yield serializers.serialize(
        object.postIds,
        specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SubElectionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubElectionCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'election_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.electionId = valueDes;
          break;
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
        case r'end_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endTime = valueDes;
          break;
        case r'post_ids':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(int)]),
          ) as BuiltList<int>?;
          if (valueDes == null) continue;
          result.postIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubElectionCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubElectionCreateBuilder();
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

