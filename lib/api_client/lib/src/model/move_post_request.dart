//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'move_post_request.g.dart';

/// MovePostRequest
///
/// Properties:
/// * [electionPostId] 
/// * [newSubElectionId] 
@BuiltValue()
abstract class MovePostRequest implements Built<MovePostRequest, MovePostRequestBuilder> {
  @BuiltValueField(wireName: r'election_post_id')
  int get electionPostId;

  @BuiltValueField(wireName: r'new_sub_election_id')
  int get newSubElectionId;

  MovePostRequest._();

  factory MovePostRequest([void updates(MovePostRequestBuilder b)]) = _$MovePostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MovePostRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MovePostRequest> get serializer => _$MovePostRequestSerializer();
}

class _$MovePostRequestSerializer implements PrimitiveSerializer<MovePostRequest> {
  @override
  final Iterable<Type> types = const [MovePostRequest, _$MovePostRequest];

  @override
  final String wireName = r'MovePostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MovePostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'election_post_id';
    yield serializers.serialize(
      object.electionPostId,
      specifiedType: const FullType(int),
    );
    yield r'new_sub_election_id';
    yield serializers.serialize(
      object.newSubElectionId,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MovePostRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MovePostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'election_post_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.electionPostId = valueDes;
          break;
        case r'new_sub_election_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.newSubElectionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MovePostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MovePostRequestBuilder();
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

