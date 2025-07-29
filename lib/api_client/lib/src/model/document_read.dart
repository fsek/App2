//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/simple_user_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'document_read.g.dart';

/// DocumentRead
///
/// Properties:
/// * [id] 
/// * [title] 
/// * [fileName] 
/// * [category] 
/// * [authorId] 
/// * [author] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [isPrivate] 
@BuiltValue()
abstract class DocumentRead implements Built<DocumentRead, DocumentReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'title')
  String get title;

  @BuiltValueField(wireName: r'file_name')
  String get fileName;

  @BuiltValueField(wireName: r'category')
  String get category;

  @BuiltValueField(wireName: r'author_id')
  int get authorId;

  @BuiltValueField(wireName: r'author')
  SimpleUserRead get author;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime get updatedAt;

  @BuiltValueField(wireName: r'is_private')
  bool get isPrivate;

  DocumentRead._();

  factory DocumentRead([void updates(DocumentReadBuilder b)]) = _$DocumentRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DocumentReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DocumentRead> get serializer => _$DocumentReadSerializer();
}

class _$DocumentReadSerializer implements PrimitiveSerializer<DocumentRead> {
  @override
  final Iterable<Type> types = const [DocumentRead, _$DocumentRead];

  @override
  final String wireName = r'DocumentRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DocumentRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'file_name';
    yield serializers.serialize(
      object.fileName,
      specifiedType: const FullType(String),
    );
    yield r'category';
    yield serializers.serialize(
      object.category,
      specifiedType: const FullType(String),
    );
    yield r'author_id';
    yield serializers.serialize(
      object.authorId,
      specifiedType: const FullType(int),
    );
    yield r'author';
    yield serializers.serialize(
      object.author,
      specifiedType: const FullType(SimpleUserRead),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'is_private';
    yield serializers.serialize(
      object.isPrivate,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DocumentRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DocumentReadBuilder result,
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
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'file_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fileName = valueDes;
          break;
        case r'category':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.category = valueDes;
          break;
        case r'author_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.authorId = valueDes;
          break;
        case r'author':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SimpleUserRead),
          ) as SimpleUserRead;
          result.author.replace(valueDes);
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        case r'is_private':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPrivate = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DocumentRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DocumentReadBuilder();
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

