//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'moose_game_read.g.dart';

/// MooseGameRead
///
/// Properties:
/// * [mooseGameName] 
/// * [mooseGameScore] 
@BuiltValue()
abstract class MooseGameRead implements Built<MooseGameRead, MooseGameReadBuilder> {
  @BuiltValueField(wireName: r'moose_game_name')
  String get mooseGameName;

  @BuiltValueField(wireName: r'moose_game_score')
  int get mooseGameScore;

  MooseGameRead._();

  factory MooseGameRead([void updates(MooseGameReadBuilder b)]) = _$MooseGameRead;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MooseGameReadBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MooseGameRead> get serializer => _$MooseGameReadSerializer();
}

class _$MooseGameReadSerializer implements PrimitiveSerializer<MooseGameRead> {
  @override
  final Iterable<Type> types = const [MooseGameRead, _$MooseGameRead];

  @override
  final String wireName = r'MooseGameRead';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MooseGameRead object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'moose_game_name';
    yield serializers.serialize(
      object.mooseGameName,
      specifiedType: const FullType(String),
    );
    yield r'moose_game_score';
    yield serializers.serialize(
      object.mooseGameScore,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    MooseGameRead object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MooseGameReadBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'moose_game_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mooseGameName = valueDes;
          break;
        case r'moose_game_score':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.mooseGameScore = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MooseGameRead deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MooseGameReadBuilder();
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

