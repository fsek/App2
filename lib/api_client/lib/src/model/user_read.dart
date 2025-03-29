//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/user_event_read.dart';
import 'package:api_client/src/model/user_post_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_read.g.dart';

/// UserRead
///
/// Properties:
/// * [id] 
/// * [email] 
/// * [isActive] 
/// * [isSuperuser] 
/// * [isVerified] 
/// * [firstName] 
/// * [lastName] 
/// * [posts] 
/// * [events] 
/// * [telephoneNumber] 
/// * [startYear] 
/// * [accountCreated] 
/// * [wantNotifications] 
/// * [stilId] 
@BuiltValue()
abstract class UserRead implements Built<UserRead, UserReadBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'is_active')
  bool? get isActive;

  @BuiltValueField(wireName: r'is_superuser')
  bool? get isSuperuser;

  @BuiltValueField(wireName: r'is_verified')
  bool? get isVerified;

  @BuiltValueField(wireName: r'first_name')
  String get firstName;

  @BuiltValueField(wireName: r'last_name')
  String get lastName;

  @BuiltValueField(wireName: r'posts')
  BuiltList<UserPostRead> get posts;

  @BuiltValueField(wireName: r'events')
  BuiltList<UserEventRead> get events;

  @BuiltValueField(wireName: r'telephone_number')
  String get telephoneNumber;

  @BuiltValueField(wireName: r'start_year')
  int get startYear;

  @BuiltValueField(wireName: r'account_created')
  DateTime get accountCreated;

  @BuiltValueField(wireName: r'want_notifications')
  bool get wantNotifications;

  @BuiltValueField(wireName: r'stil_id')
  String? get stilId;

  UserRead._();

  factory UserRead([void updates(UserReadBuilder b)]) = _$UserRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserReadBuilder b) => b
      ..isActive = true
      ..isSuperuser = false
      ..isVerified = false;

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
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    if (object.isActive != null) {
      yield r'is_active';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isSuperuser != null) {
      yield r'is_superuser';
      yield serializers.serialize(
        object.isSuperuser,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isVerified != null) {
      yield r'is_verified';
      yield serializers.serialize(
        object.isVerified,
        specifiedType: const FullType(bool),
      );
    }
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
    yield r'posts';
    yield serializers.serialize(
      object.posts,
      specifiedType: const FullType(BuiltList, [FullType(UserPostRead)]),
    );
    yield r'events';
    yield serializers.serialize(
      object.events,
      specifiedType: const FullType(BuiltList, [FullType(UserEventRead)]),
    );
    yield r'telephone_number';
    yield serializers.serialize(
      object.telephoneNumber,
      specifiedType: const FullType(String),
    );
    yield r'start_year';
    yield serializers.serialize(
      object.startYear,
      specifiedType: const FullType(int),
    );
    yield r'account_created';
    yield serializers.serialize(
      object.accountCreated,
      specifiedType: const FullType(DateTime),
    );
    yield r'want_notifications';
    yield serializers.serialize(
      object.wantNotifications,
      specifiedType: const FullType(bool),
    );
    if (object.stilId != null) {
      yield r'stil_id';
      yield serializers.serialize(
        object.stilId,
        specifiedType: const FullType.nullable(String),
      );
    }
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
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'is_active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isActive = valueDes;
          break;
        case r'is_superuser':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isSuperuser = valueDes;
          break;
        case r'is_verified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isVerified = valueDes;
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
        case r'posts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserPostRead)]),
          ) as BuiltList<UserPostRead>;
          result.posts.replace(valueDes);
          break;
        case r'events':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserEventRead)]),
          ) as BuiltList<UserEventRead>;
          result.events.replace(valueDes);
          break;
        case r'telephone_number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.telephoneNumber = valueDes;
          break;
        case r'start_year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.startYear = valueDes;
          break;
        case r'account_created':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.accountCreated = valueDes;
          break;
        case r'want_notifications':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.wantNotifications = valueDes;
          break;
        case r'stil_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.stilId = valueDes;
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

