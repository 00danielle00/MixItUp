// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IngredientesStruct extends BaseStruct {
  IngredientesStruct({
    String? nombre,
    int? cantidad,
    String? unidad,
  })  : _nombre = nombre,
        _cantidad = cantidad,
        _unidad = unidad;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  set cantidad(int? val) => _cantidad = val;

  void incrementCantidad(int amount) => cantidad = cantidad + amount;

  bool hasCantidad() => _cantidad != null;

  // "unidad" field.
  String? _unidad;
  String get unidad => _unidad ?? '';
  set unidad(String? val) => _unidad = val;

  bool hasUnidad() => _unidad != null;

  static IngredientesStruct fromMap(Map<String, dynamic> data) =>
      IngredientesStruct(
        nombre: data['nombre'] as String?,
        cantidad: castToType<int>(data['cantidad']),
        unidad: data['unidad'] as String?,
      );

  static IngredientesStruct? maybeFromMap(dynamic data) => data is Map
      ? IngredientesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombre': _nombre,
        'cantidad': _cantidad,
        'unidad': _unidad,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'cantidad': serializeParam(
          _cantidad,
          ParamType.int,
        ),
        'unidad': serializeParam(
          _unidad,
          ParamType.String,
        ),
      }.withoutNulls;

  static IngredientesStruct fromSerializableMap(Map<String, dynamic> data) =>
      IngredientesStruct(
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        cantidad: deserializeParam(
          data['cantidad'],
          ParamType.int,
          false,
        ),
        unidad: deserializeParam(
          data['unidad'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IngredientesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IngredientesStruct &&
        nombre == other.nombre &&
        cantidad == other.cantidad &&
        unidad == other.unidad;
  }

  @override
  int get hashCode => const ListEquality().hash([nombre, cantidad, unidad]);
}

IngredientesStruct createIngredientesStruct({
  String? nombre,
  int? cantidad,
  String? unidad,
}) =>
    IngredientesStruct(
      nombre: nombre,
      cantidad: cantidad,
      unidad: unidad,
    );
