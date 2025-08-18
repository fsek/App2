//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/post_read.dart';
import 'package:api_client/src/model/event_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'council_read.g.dart';

/// CouncilRead
///
/// Properties:
/// * [id] 
/// * [nameSv] 
/// * [nameEn] 
/// * [posts] 
/// * [events] 
/// * [descriptionSv] 
/// * [descriptionEn] 
@BuiltValue()
abstract class CouncilRead implements Built<CouncilRead, CouncilReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name_sv')
  String get nameSv;

  @BuiltValueField(wireName: r'name_en')
  String get nameEn;

  @BuiltValueField(wireName: r'posts')
  BuiltList<PostRead> get posts;

  @BuiltValueField(wireName: r'events')
  BuiltList<EventRead> get events;

  @BuiltValueField(wireName: r'description_sv')
  String? get descriptionSv;

  @BuiltValueField(wireName: r'description_en')
  String? get descriptionEn;

  CouncilRead._();

  factory CouncilRead([void updates(CouncilReadBuilder b)]) = _$CouncilRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CouncilReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CouncilRead> get serializer => _$CouncilReadSerializer();
}

class _$CouncilReadSerializer implements PrimitiveSerializer<CouncilRead> {
  @override
  final Iterable<Type> types = const [CouncilRead, _$CouncilRead];

  @override
  final String wireName = r'CouncilRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CouncilRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'name_sv';
    yield serializers.serialize(
      object.nameSv,
      specifiedType: const FullType(String),
    );
    yield r'name_en';
    yield serializers.serialize(
      object.nameEn,
      specifiedType: const FullType(String),
    );
    yield r'posts';
    yield serializers.serialize(
      object.posts,
      specifiedType: const FullType(BuiltList, [FullType(PostRead)]),
    );
    yield r'events';
    yield serializers.serialize(
      object.events,
      specifiedType: const FullType(BuiltList, [FullType(EventRead)]),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    CouncilRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CouncilReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'name_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nameSv = valueDes;
          break;
        case r'name_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nameEn = valueDes;
          break;
        case r'posts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PostRead)]),
          ) as BuiltList<PostRead>;
          result.posts.replace(valueDes);
          break;
        case r'events':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(EventRead)]),
          ) as BuiltList<EventRead>;
          result.events.replace(valueDes);
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CouncilRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CouncilReadBuilder();
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

