//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'post_door_access_read.g.dart';

/// PostDoorAccessRead
///
/// Properties:
/// * [id] 
/// * [door] 
@BuiltValue()
abstract class PostDoorAccessRead implements Built<PostDoorAccessRead, PostDoorAccessReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'door')
  PostDoorAccessReadDoorEnum get door;
  // enum doorEnum {  Ledningscentralen,  Ambassaden,  Syster Kents,  Hilbert Cafe,  Cafeförrådet,  Pubförrådet,  Sopkomprimatorn,  Arkivet,  };

  PostDoorAccessRead._();

  factory PostDoorAccessRead([void updates(PostDoorAccessReadBuilder b)]) = _$PostDoorAccessRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PostDoorAccessReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PostDoorAccessRead> get serializer => _$PostDoorAccessReadSerializer();
}

class _$PostDoorAccessReadSerializer implements PrimitiveSerializer<PostDoorAccessRead> {
  @override
  final Iterable<Type> types = const [PostDoorAccessRead, _$PostDoorAccessRead];

  @override
  final String wireName = r'PostDoorAccessRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PostDoorAccessRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'door';
    yield serializers.serialize(
      object.door,
      specifiedType: const FullType(PostDoorAccessReadDoorEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PostDoorAccessRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PostDoorAccessReadBuilder result,
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
        case r'door':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PostDoorAccessReadDoorEnum),
          ) as PostDoorAccessReadDoorEnum;
          result.door = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PostDoorAccessRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PostDoorAccessReadBuilder();
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

class PostDoorAccessReadDoorEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Ledningscentralen')
  static const PostDoorAccessReadDoorEnum ledningscentralen = _$postDoorAccessReadDoorEnum_ledningscentralen;
  @BuiltValueEnumConst(wireName: r'Ambassaden')
  static const PostDoorAccessReadDoorEnum ambassaden = _$postDoorAccessReadDoorEnum_ambassaden;
  @BuiltValueEnumConst(wireName: r'Syster Kents')
  static const PostDoorAccessReadDoorEnum systerKents = _$postDoorAccessReadDoorEnum_systerKents;
  @BuiltValueEnumConst(wireName: r'Hilbert Cafe')
  static const PostDoorAccessReadDoorEnum hilbertCafe = _$postDoorAccessReadDoorEnum_hilbertCafe;
  @BuiltValueEnumConst(wireName: r'Cafeförrådet')
  static const PostDoorAccessReadDoorEnum cafefrrdet = _$postDoorAccessReadDoorEnum_cafefrrdet;
  @BuiltValueEnumConst(wireName: r'Pubförrådet')
  static const PostDoorAccessReadDoorEnum pubfrrdet = _$postDoorAccessReadDoorEnum_pubfrrdet;
  @BuiltValueEnumConst(wireName: r'Sopkomprimatorn')
  static const PostDoorAccessReadDoorEnum sopkomprimatorn = _$postDoorAccessReadDoorEnum_sopkomprimatorn;
  @BuiltValueEnumConst(wireName: r'Arkivet')
  static const PostDoorAccessReadDoorEnum arkivet = _$postDoorAccessReadDoorEnum_arkivet;

  static Serializer<PostDoorAccessReadDoorEnum> get serializer => _$postDoorAccessReadDoorEnumSerializer;

  const PostDoorAccessReadDoorEnum._(String name): super(name);

  static BuiltSet<PostDoorAccessReadDoorEnum> get values => _$postDoorAccessReadDoorEnumValues;
  static PostDoorAccessReadDoorEnum valueOf(String name) => _$postDoorAccessReadDoorEnumValueOf(name);
}

