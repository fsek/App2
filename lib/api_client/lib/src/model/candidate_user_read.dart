//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'candidate_user_read.g.dart';

/// CandidateUserRead
///
/// Properties:
/// * [firstName] 
/// * [lastName] 
/// * [email] 
/// * [telephoneNumber] 
/// * [stilId] 
/// * [startYear] 
/// * [program] 
@BuiltValue()
abstract class CandidateUserRead implements Built<CandidateUserRead, CandidateUserReadBuilder> {
  @BuiltValueField(wireName: r'first_name')
  String get firstName;

  @BuiltValueField(wireName: r'last_name')
  String get lastName;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'telephone_number')
  String get telephoneNumber;

  @BuiltValueField(wireName: r'stil_id')
  String? get stilId;

  @BuiltValueField(wireName: r'start_year')
  int get startYear;

  @BuiltValueField(wireName: r'program')
  CandidateUserReadProgramEnum get program;
  // enum programEnum {  Oklart,  F,  Pi,  N,  };

  CandidateUserRead._();

  factory CandidateUserRead([void updates(CandidateUserReadBuilder b)]) = _$CandidateUserRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CandidateUserReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CandidateUserRead> get serializer => _$CandidateUserReadSerializer();
}

class _$CandidateUserReadSerializer implements PrimitiveSerializer<CandidateUserRead> {
  @override
  final Iterable<Type> types = const [CandidateUserRead, _$CandidateUserRead];

  @override
  final String wireName = r'CandidateUserRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CandidateUserRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    yield r'telephone_number';
    yield serializers.serialize(
      object.telephoneNumber,
      specifiedType: const FullType(String),
    );
    yield r'stil_id';
    yield object.stilId == null ? null : serializers.serialize(
      object.stilId,
      specifiedType: const FullType.nullable(String),
    );
    yield r'start_year';
    yield serializers.serialize(
      object.startYear,
      specifiedType: const FullType(int),
    );
    yield r'program';
    yield serializers.serialize(
      object.program,
      specifiedType: const FullType(CandidateUserReadProgramEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CandidateUserRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CandidateUserReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'telephone_number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.telephoneNumber = valueDes;
          break;
        case r'stil_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.stilId = valueDes;
          break;
        case r'start_year':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.startYear = valueDes;
          break;
        case r'program':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CandidateUserReadProgramEnum),
          ) as CandidateUserReadProgramEnum;
          result.program = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CandidateUserRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CandidateUserReadBuilder();
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

class CandidateUserReadProgramEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Oklart')
  static const CandidateUserReadProgramEnum oklart = _$candidateUserReadProgramEnum_oklart;
  @BuiltValueEnumConst(wireName: r'F')
  static const CandidateUserReadProgramEnum F = _$candidateUserReadProgramEnum_F;
  @BuiltValueEnumConst(wireName: r'Pi')
  static const CandidateUserReadProgramEnum pi = _$candidateUserReadProgramEnum_pi;
  @BuiltValueEnumConst(wireName: r'N')
  static const CandidateUserReadProgramEnum N = _$candidateUserReadProgramEnum_N;

  static Serializer<CandidateUserReadProgramEnum> get serializer => _$candidateUserReadProgramEnumSerializer;

  const CandidateUserReadProgramEnum._(String name): super(name);

  static BuiltSet<CandidateUserReadProgramEnum> get values => _$candidateUserReadProgramEnumValues;
  static CandidateUserReadProgramEnum valueOf(String name) => _$candidateUserReadProgramEnumValueOf(name);
}

