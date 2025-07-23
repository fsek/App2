//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:api_client/src/model/detail.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'error_model.g.dart';

/// ErrorModel
///
/// Properties:
/// * [detail] 
@BuiltValue()
abstract class ErrorModel implements Built<ErrorModel, ErrorModelBuilder> {
  @BuiltValueField(wireName: r'detail')
  Detail get detail;

  ErrorModel._();

  factory ErrorModel([void updates(ErrorModelBuilder b)]) = _$ErrorModel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ErrorModelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ErrorModel> get serializer => _$ErrorModelSerializer();
}

class _$ErrorModelSerializer implements PrimitiveSerializer<ErrorModel> {
  @override
  final Iterable<Type> types = const [ErrorModel, _$ErrorModel];

  @override
  final String wireName = r'ErrorModel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ErrorModel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'detail';
    yield serializers.serialize(
      object.detail,
      specifiedType: const FullType(Detail),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ErrorModel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ErrorModelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'detail':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Detail),
          ) as Detail;
          result.detail.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ErrorModel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ErrorModelBuilder();
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

