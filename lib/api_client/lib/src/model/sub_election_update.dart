//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sub_election_update.g.dart';

/// SubElectionUpdate
///
/// Properties:
/// * [titleSv] 
/// * [titleEn] 
/// * [endTime] 
/// * [postIds] 
@BuiltValue()
abstract class SubElectionUpdate implements Built<SubElectionUpdate, SubElectionUpdateBuilder> {
  @BuiltValueField(wireName: r'title_sv')
  String? get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String? get titleEn;

  @BuiltValueField(wireName: r'end_time')
  DateTime? get endTime;

  @BuiltValueField(wireName: r'post_ids')
  BuiltList<int>? get postIds;

  SubElectionUpdate._();

  factory SubElectionUpdate([void updates(SubElectionUpdateBuilder b)]) = _$SubElectionUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubElectionUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubElectionUpdate> get serializer => _$SubElectionUpdateSerializer();
}

class _$SubElectionUpdateSerializer implements PrimitiveSerializer<SubElectionUpdate> {
  @override
  final Iterable<Type> types = const [SubElectionUpdate, _$SubElectionUpdate];

  @override
  final String wireName = r'SubElectionUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubElectionUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.titleSv != null) {
      yield r'title_sv';
      yield serializers.serialize(
        object.titleSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.titleEn != null) {
      yield r'title_en';
      yield serializers.serialize(
        object.titleEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.endTime != null) {
      yield r'end_time';
      yield serializers.serialize(
        object.endTime,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
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
    SubElectionUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubElectionUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.titleSv = valueDes;
          break;
        case r'title_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.titleEn = valueDes;
          break;
        case r'end_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
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
  SubElectionUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubElectionUpdateBuilder();
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

