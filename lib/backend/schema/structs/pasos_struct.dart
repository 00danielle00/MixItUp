// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PasosStruct extends BaseStruct {
  PasosStruct({
    String? descripcion,
    int? duracionSegundos,
  })  : _descripcion = descripcion,
        _duracionSegundos = duracionSegundos;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  // "duracion_segundos" field.
  int? _duracionSegundos;
  int get duracionSegundos => _duracionSegundos ?? 0;
  set duracionSegundos(int? val) => _duracionSegundos = val;

  void incrementDuracionSegundos(int amount) =>
      duracionSegundos = duracionSegundos + amount;

  bool hasDuracionSegundos() => _duracionSegundos != null;

  static PasosStruct fromMap(Map<String, dynamic> data) => PasosStruct(
        descripcion: data['descripcion'] as String?,
        duracionSegundos: castToType<int>(data['duracion_segundos']),
      );

  static PasosStruct? maybeFromMap(dynamic data) =>
      data is Map ? PasosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'descripcion': _descripcion,
        'duracion_segundos': _duracionSegundos,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
        'duracion_segundos': serializeParam(
          _duracionSegundos,
          ParamType.int,
        ),
      }.withoutNulls;

  static PasosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PasosStruct(
        descripcion: deserializeParam(
          data['descripcion'],
          ParamType.String,
          false,
        ),
        duracionSegundos: deserializeParam(
          data['duracion_segundos'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PasosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PasosStruct &&
        descripcion == other.descripcion &&
        duracionSegundos == other.duracionSegundos;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([descripcion, duracionSegundos]);
}

PasosStruct createPasosStruct({
  String? descripcion,
  int? duracionSegundos,
}) =>
    PasosStruct(
      descripcion: descripcion,
      duracionSegundos: duracionSegundos,
    );
