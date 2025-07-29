//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'memberroles.g.dart';

class MEMBERROLES extends EnumClass {

  @BuiltValueEnumConst(wireName: r'Photographer')
  static const MEMBERROLES photographer = _$photographer;
  @BuiltValueEnumConst(wireName: r'Ordförande')
  static const MEMBERROLES ordfrande = _$ordfrande;
  @BuiltValueEnumConst(wireName: r'Dinmamma')
  static const MEMBERROLES dinmamma = _$dinmamma;

  static Serializer<MEMBERROLES> get serializer => _$mEMBERROLESSerializer;

  const MEMBERROLES._(String name): super(name);

  static BuiltSet<MEMBERROLES> get values => _$values;
  static MEMBERROLES valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class MEMBERROLESMixin = Object with _$MEMBERROLESMixin;

