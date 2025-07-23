//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/group_read.dart';
import 'package:api_client/src/model/post_read.dart';
import 'package:built_collection/built_collection.dart';
import 'package:api_client/src/model/simple_user_access_read.dart';
import 'package:api_client/src/model/user_event_read.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_user_read.g.dart';

/// AdminUserRead
///
/// Properties:
/// * [id] 
/// * [email] 
/// * [isActive] 
/// * [isSuperuser] 
/// * [isVerified] 
/// * [firstName] 
/// * [lastName] 
/// * [program] 
/// * [posts] 
/// * [events] 
/// * [telephoneNumber] 
/// * [startYear] 
/// * [accountCreated] 
/// * [wantNotifications] 
/// * [stilId] 
/// * [standardFoodPreferences] 
/// * [otherFoodPreferences] 
/// * [accesses] 
/// * [isMember] 
/// * [groups] 
@BuiltValue()
abstract class AdminUserRead implements Built<AdminUserRead, AdminUserReadBuilder> {
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

  @BuiltValueField(wireName: r'program')
  AdminUserReadProgramEnum get program;
  // enum programEnum {  Oklart,  F,  Pi,  N,  };

  @BuiltValueField(wireName: r'posts')
  BuiltList<PostRead> get posts;

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

  @BuiltValueField(wireName: r'standard_food_preferences')
  BuiltList<String>? get standardFoodPreferences;

  @BuiltValueField(wireName: r'other_food_preferences')
  String? get otherFoodPreferences;

  @BuiltValueField(wireName: r'accesses')
  BuiltList<SimpleUserAccessRead> get accesses;

  @BuiltValueField(wireName: r'is_member')
  bool get isMember;

  @BuiltValueField(wireName: r'groups')
  BuiltList<GroupRead> get groups;

  AdminUserRead._();

  factory AdminUserRead([void updates(AdminUserReadBuilder b)]) = _$AdminUserRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminUserReadBuilder b) => b
      ..isActive = true
      ..isSuperuser = false
      ..isVerified = false;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminUserRead> get serializer => _$AdminUserReadSerializer();
}

class _$AdminUserReadSerializer implements PrimitiveSerializer<AdminUserRead> {
  @override
  final Iterable<Type> types = const [AdminUserRead, _$AdminUserRead];

  @override
  final String wireName = r'AdminUserRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminUserRead object, {
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
    yield r'program';
    yield serializers.serialize(
      object.program,
      specifiedType: const FullType(AdminUserReadProgramEnum),
    );
    yield r'posts';
    yield serializers.serialize(
      object.posts,
      specifiedType: const FullType(BuiltList, [FullType(PostRead)]),
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
    yield r'standard_food_preferences';
    yield object.standardFoodPreferences == null ? null : serializers.serialize(
      object.standardFoodPreferences,
      specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
    );
    yield r'other_food_preferences';
    yield object.otherFoodPreferences == null ? null : serializers.serialize(
      object.otherFoodPreferences,
      specifiedType: const FullType.nullable(String),
    );
    yield r'accesses';
    yield serializers.serialize(
      object.accesses,
      specifiedType: const FullType(BuiltList, [FullType(SimpleUserAccessRead)]),
    );
    yield r'is_member';
    yield serializers.serialize(
      object.isMember,
      specifiedType: const FullType(bool),
    );
    yield r'groups';
    yield serializers.serialize(
      object.groups,
      specifiedType: const FullType(BuiltList, [FullType(GroupRead)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminUserRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AdminUserReadBuilder result,
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
        case r'program':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AdminUserReadProgramEnum),
          ) as AdminUserReadProgramEnum;
          result.program = valueDes;
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
        case r'standard_food_preferences':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(String)]),
          ) as BuiltList<String>?;
          if (valueDes == null) continue;
          result.standardFoodPreferences.replace(valueDes);
          break;
        case r'other_food_preferences':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.otherFoodPreferences = valueDes;
          break;
        case r'accesses':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SimpleUserAccessRead)]),
          ) as BuiltList<SimpleUserAccessRead>;
          result.accesses.replace(valueDes);
          break;
        case r'is_member':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isMember = valueDes;
          break;
        case r'groups':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(GroupRead)]),
          ) as BuiltList<GroupRead>;
          result.groups.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminUserRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminUserReadBuilder();
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

class AdminUserReadProgramEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Oklart')
  static const AdminUserReadProgramEnum oklart = _$adminUserReadProgramEnum_oklart;
  @BuiltValueEnumConst(wireName: r'F')
  static const AdminUserReadProgramEnum F = _$adminUserReadProgramEnum_F;
  @BuiltValueEnumConst(wireName: r'Pi')
  static const AdminUserReadProgramEnum pi = _$adminUserReadProgramEnum_pi;
  @BuiltValueEnumConst(wireName: r'N')
  static const AdminUserReadProgramEnum N = _$adminUserReadProgramEnum_N;

  static Serializer<AdminUserReadProgramEnum> get serializer => _$adminUserReadProgramEnumSerializer;

  const AdminUserReadProgramEnum._(String name): super(name);

  static BuiltSet<AdminUserReadProgramEnum> get values => _$adminUserReadProgramEnumValues;
  static AdminUserReadProgramEnum valueOf(String name) => _$adminUserReadProgramEnumValueOf(name);
}

