//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'nomination_read.g.dart';

/// NominationRead
///
/// Properties:
/// * [nominationId] 
/// * [subElectionId] 
/// * [nomineeName] 
/// * [nomineeEmail] 
/// * [motivation] 
/// * [createdAt] 
/// * [postId] 
/// * [electionPostId] 
@BuiltValue()
abstract class NominationRead implements Built<NominationRead, NominationReadBuilder> {
  @BuiltValueField(wireName: r'nomination_id')
  int get nominationId;

  @BuiltValueField(wireName: r'sub_election_id')
  int get subElectionId;

  @BuiltValueField(wireName: r'nominee_name')
  String get nomineeName;

  @BuiltValueField(wireName: r'nominee_email')
  String get nomineeEmail;

  @BuiltValueField(wireName: r'motivation')
  String get motivation;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'post_id')
  int get postId;

  @BuiltValueField(wireName: r'election_post_id')
  int get electionPostId;

  NominationRead._();

  factory NominationRead([void updates(NominationReadBuilder b)]) = _$NominationRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NominationReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NominationRead> get serializer => _$NominationReadSerializer();
}

class _$NominationReadSerializer implements PrimitiveSerializer<NominationRead> {
  @override
  final Iterable<Type> types = const [NominationRead, _$NominationRead];

  @override
  final String wireName = r'NominationRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NominationRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'nomination_id';
    yield serializers.serialize(
      object.nominationId,
      specifiedType: const FullType(int),
    );
    yield r'sub_election_id';
    yield serializers.serialize(
      object.subElectionId,
      specifiedType: const FullType(int),
    );
    yield r'nominee_name';
    yield serializers.serialize(
      object.nomineeName,
      specifiedType: const FullType(String),
    );
    yield r'nominee_email';
    yield serializers.serialize(
      object.nomineeEmail,
      specifiedType: const FullType(String),
    );
    yield r'motivation';
    yield serializers.serialize(
      object.motivation,
      specifiedType: const FullType(String),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'post_id';
    yield serializers.serialize(
      object.postId,
      specifiedType: const FullType(int),
    );
    yield r'election_post_id';
    yield serializers.serialize(
      object.electionPostId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NominationRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NominationReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'nomination_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.nominationId = valueDes;
          break;
        case r'sub_election_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.subElectionId = valueDes;
          break;
        case r'nominee_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nomineeName = valueDes;
          break;
        case r'nominee_email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nomineeEmail = valueDes;
          break;
        case r'motivation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.motivation = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.postId = valueDes;
          break;
        case r'election_post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.electionPostId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NominationRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NominationReadBuilder();
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

