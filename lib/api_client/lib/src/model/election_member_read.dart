//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/sub_election_member_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'election_member_read.g.dart';

/// ElectionMemberRead
///
/// Properties:
/// * [electionId] 
/// * [titleSv] 
/// * [titleEn] 
/// * [startTime] 
/// * [descriptionSv] 
/// * [descriptionEn] 
/// * [visible] 
/// * [subElections] 
@BuiltValue()
abstract class ElectionMemberRead implements Built<ElectionMemberRead, ElectionMemberReadBuilder> {
  @BuiltValueField(wireName: r'election_id')
  int get electionId;

  @BuiltValueField(wireName: r'title_sv')
  String get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String get titleEn;

  @BuiltValueField(wireName: r'start_time')
  DateTime get startTime;

  @BuiltValueField(wireName: r'description_sv')
  String? get descriptionSv;

  @BuiltValueField(wireName: r'description_en')
  String? get descriptionEn;

  @BuiltValueField(wireName: r'visible')
  bool get visible;

  @BuiltValueField(wireName: r'sub_elections')
  BuiltList<SubElectionMemberRead> get subElections;

  ElectionMemberRead._();

  factory ElectionMemberRead([void updates(ElectionMemberReadBuilder b)]) = _$ElectionMemberRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ElectionMemberReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ElectionMemberRead> get serializer => _$ElectionMemberReadSerializer();
}

class _$ElectionMemberReadSerializer implements PrimitiveSerializer<ElectionMemberRead> {
  @override
  final Iterable<Type> types = const [ElectionMemberRead, _$ElectionMemberRead];

  @override
  final String wireName = r'ElectionMemberRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ElectionMemberRead object, {
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
    yield r'start_time';
    yield serializers.serialize(
      object.startTime,
      specifiedType: const FullType(DateTime),
    );
    yield r'description_sv';
    yield object.descriptionSv == null ? null : serializers.serialize(
      object.descriptionSv,
      specifiedType: const FullType.nullable(String),
    );
    yield r'description_en';
    yield object.descriptionEn == null ? null : serializers.serialize(
      object.descriptionEn,
      specifiedType: const FullType.nullable(String),
    );
    yield r'visible';
    yield serializers.serialize(
      object.visible,
      specifiedType: const FullType(bool),
    );
    yield r'sub_elections';
    yield serializers.serialize(
      object.subElections,
      specifiedType: const FullType(BuiltList, [FullType(SubElectionMemberRead)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ElectionMemberRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ElectionMemberReadBuilder result,
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
        case r'start_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startTime = valueDes;
          break;
        case r'description_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.descriptionSv = valueDes;
          break;
        case r'description_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.descriptionEn = valueDes;
          break;
        case r'visible':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.visible = valueDes;
          break;
        case r'sub_elections':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SubElectionMemberRead)]),
          ) as BuiltList<SubElectionMemberRead>;
          result.subElections.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ElectionMemberRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ElectionMemberReadBuilder();
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

