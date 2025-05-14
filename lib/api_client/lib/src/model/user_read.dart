//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/user_post_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_read.g.dart';

/// UserRead
///
/// Properties:
/// * [id] 
/// * [firstName] 
/// * [lastName] 
/// * [program] 
/// * [posts] 
/// * [startYear] 
@BuiltValue()
abstract class UserRead implements Built<UserRead, UserReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'first_name')
  String get firstName;

  @BuiltValueField(wireName: r'last_name')
  String get lastName;

  @BuiltValueField(wireName: r'program')
  UserReadProgramEnum? get program;
  // enum programEnum {  F,  Pi,  N,  };

  @BuiltValueField(wireName: r'posts')
  BuiltList<UserPostRead> get posts;

  @BuiltValueField(wireName: r'start_year')
  int get startYear;

  UserRead._();

  factory UserRead([void updates(UserReadBuilder b)]) = _$UserRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserRead> get serializer => _$UserReadSerializer();
}

class _$UserReadSerializer implements PrimitiveSerializer<UserRead> {
  @override
  final Iterable<Type> types = const [UserRead, _$UserRead];

  @override
  final String wireName = r'UserRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'first_name';
    yield serializers.serialize(
      object.firstName,
      specifiedType: const FullType(String),
    );
    yield r'last_name';
    yield serializers.serialize(
      object.lastName,
      specifiedType: const FullType(String),
    );
    yield r'program';
    yield object.program == null ? null : serializers.serialize(
      object.program,
      specifiedType: const FullType.nullable(UserReadProgramEnum),
    );
    yield r'posts';
    yield serializers.serialize(
      object.posts,
      specifiedType: const FullType(BuiltList, [FullType(UserPostRead)]),
    );
    yield r'start_year';
    yield serializers.serialize(
      object.startYear,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserReadBuilder result,
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
        case r'first_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.firstName = valueDes;
          break;
        case r'last_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastName = valueDes;
          break;
        case r'program':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(UserReadProgramEnum),
          ) as UserReadProgramEnum?;
          if (valueDes == null) continue;
          result.program = valueDes;
          break;
        case r'posts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserPostRead)]),
          ) as BuiltList<UserPostRead>;
          result.posts.replace(valueDes);
          break;
        case r'start_year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.startYear = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserReadBuilder();
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

class UserReadProgramEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'F')
  static const UserReadProgramEnum F = _$userReadProgramEnum_F;
  @BuiltValueEnumConst(wireName: r'Pi')
  static const UserReadProgramEnum pi = _$userReadProgramEnum_pi;
  @BuiltValueEnumConst(wireName: r'N')
  static const UserReadProgramEnum N = _$userReadProgramEnum_N;

  static Serializer<UserReadProgramEnum> get serializer => _$userReadProgramEnumSerializer;

  const UserReadProgramEnum._(String name): super(name);

  static BuiltSet<UserReadProgramEnum> get values => _$userReadProgramEnumValues;
  static UserReadProgramEnum valueOf(String name) => _$userReadProgramEnumValueOf(name);
}

