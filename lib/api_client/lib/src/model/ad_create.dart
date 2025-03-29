//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ad_create.g.dart';

/// AdCreate
///
/// Properties:
/// * [title]
/// * [author]
/// * [price]
/// * [course]
/// * [userId]
/// * [selling]
/// * [condition]
@BuiltValue()
abstract class AdCreate implements Built<AdCreate, AdCreateBuilder> {
  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'author')
  String? get author;

  @BuiltValueField(wireName: r'price')
  int? get price;

  @BuiltValueField(wireName: r'course')
  String? get course;

  @BuiltValueField(wireName: r'user_id')
  int get userId;

  @BuiltValueField(wireName: r'selling')
  bool get selling;

  @BuiltValueField(wireName: r'condition')
  int get condition;

  AdCreate._();

  factory AdCreate([void updates(AdCreateBuilder b)]) = _$AdCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdCreate> get serializer => _$AdCreateSerializer();
}

class _$AdCreateSerializer implements PrimitiveSerializer<AdCreate> {
  @override
  final Iterable<Type> types = const [AdCreate, _$AdCreate];

  @override
  final String wireName = r'AdCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'author';
    yield object.author == null
        ? null
        : serializers.serialize(
            object.author,
            specifiedType: const FullType.nullable(String),
          );
    yield r'price';
    yield object.price == null
        ? null
        : serializers.serialize(
            object.price,
            specifiedType: const FullType.nullable(int),
          );
    yield r'course';
    yield object.course == null
        ? null
        : serializers.serialize(
            object.course,
            specifiedType: const FullType.nullable(String),
          );
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(int),
    );
    yield r'selling';
    yield serializers.serialize(
      object.selling,
      specifiedType: const FullType(bool),
    );
    yield r'condition';
    yield serializers.serialize(
      object.condition,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'author':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.author = valueDes;
          break;
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.price = valueDes;
          break;
        case r'course':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.course = valueDes;
          break;
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'selling':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.selling = valueDes;
          break;
        case r'condition':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.condition = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdCreateBuilder();
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
