//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'guild_meeting_update.g.dart';

/// GuildMeetingUpdate
///
/// Properties:
/// * [titleSv] 
/// * [titleEn] 
/// * [dateDescriptionSv] 
/// * [dateDescriptionEn] 
/// * [descriptionSv] 
/// * [descriptionEn] 
/// * [isActive] 
@BuiltValue()
abstract class GuildMeetingUpdate implements Built<GuildMeetingUpdate, GuildMeetingUpdateBuilder> {
  @BuiltValueField(wireName: r'title_sv')
  String? get titleSv;

  @BuiltValueField(wireName: r'title_en')
  String? get titleEn;

  @BuiltValueField(wireName: r'date_description_sv')
  String? get dateDescriptionSv;

  @BuiltValueField(wireName: r'date_description_en')
  String? get dateDescriptionEn;

  @BuiltValueField(wireName: r'description_sv')
  String? get descriptionSv;

  @BuiltValueField(wireName: r'description_en')
  String? get descriptionEn;

  @BuiltValueField(wireName: r'is_active')
  bool? get isActive;

  GuildMeetingUpdate._();

  factory GuildMeetingUpdate([void updates(GuildMeetingUpdateBuilder b)]) = _$GuildMeetingUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GuildMeetingUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GuildMeetingUpdate> get serializer => _$GuildMeetingUpdateSerializer();
}

class _$GuildMeetingUpdateSerializer implements PrimitiveSerializer<GuildMeetingUpdate> {
  @override
  final Iterable<Type> types = const [GuildMeetingUpdate, _$GuildMeetingUpdate];

  @override
  final String wireName = r'GuildMeetingUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GuildMeetingUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.titleSv != null) {
      yield r'title_sv';
      yield serializers.serialize(
        object.titleSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.titleEn != null) {
      yield r'title_en';
      yield serializers.serialize(
        object.titleEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.dateDescriptionSv != null) {
      yield r'date_description_sv';
      yield serializers.serialize(
        object.dateDescriptionSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.dateDescriptionEn != null) {
      yield r'date_description_en';
      yield serializers.serialize(
        object.dateDescriptionEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.descriptionSv != null) {
      yield r'description_sv';
      yield serializers.serialize(
        object.descriptionSv,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.descriptionEn != null) {
      yield r'description_en';
      yield serializers.serialize(
        object.descriptionEn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.isActive != null) {
      yield r'is_active';
      yield serializers.serialize(
        object.isActive,
        specifiedType: const FullType.nullable(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GuildMeetingUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GuildMeetingUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.titleSv = valueDes;
          break;
        case r'title_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.titleEn = valueDes;
          break;
        case r'date_description_sv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dateDescriptionSv = valueDes;
          break;
        case r'date_description_en':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dateDescriptionEn = valueDes;
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
        case r'is_active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isActive = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GuildMeetingUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GuildMeetingUpdateBuilder();
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

