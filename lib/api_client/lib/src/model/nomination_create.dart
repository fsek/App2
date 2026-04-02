//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'nomination_create.g.dart';

/// NominationCreate
///
/// Properties:
/// * [subElectionId] 
/// * [nomineeName] 
/// * [nomineeEmail] 
/// * [motivation] 
/// * [electionPostId] 
@BuiltValue()
abstract class NominationCreate implements Built<NominationCreate, NominationCreateBuilder> {
  @BuiltValueField(wireName: r'sub_election_id')
  int get subElectionId;

  @BuiltValueField(wireName: r'nominee_name')
  String get nomineeName;

  @BuiltValueField(wireName: r'nominee_email')
  String get nomineeEmail;

  @BuiltValueField(wireName: r'motivation')
  String get motivation;

  @BuiltValueField(wireName: r'election_post_id')
  int get electionPostId;

  NominationCreate._();

  factory NominationCreate([void updates(NominationCreateBuilder b)]) = _$NominationCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NominationCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NominationCreate> get serializer => _$NominationCreateSerializer();
}

class _$NominationCreateSerializer implements PrimitiveSerializer<NominationCreate> {
  @override
  final Iterable<Type> types = const [NominationCreate, _$NominationCreate];

  @override
  final String wireName = r'NominationCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NominationCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'election_post_id';
    yield serializers.serialize(
      object.electionPostId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    NominationCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required NominationCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  NominationCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NominationCreateBuilder();
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

