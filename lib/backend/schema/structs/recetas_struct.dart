// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecetasStruct extends BaseStruct {
  RecetasStruct({
    int? recetaId,
    bool? esAlcoholica,
    String? nombre,
    String? dificultad,
    String? imagen,
    String? descripcion,
    int? creadorId,
    int? tiempo,
  })  : _recetaId = recetaId,
        _esAlcoholica = esAlcoholica,
        _nombre = nombre,
        _dificultad = dificultad,
        _imagen = imagen,
        _descripcion = descripcion,
        _creadorId = creadorId,
        _tiempo = tiempo;

  // "recetaId" field.
  int? _recetaId;
  int get recetaId => _recetaId ?? 0;
  set recetaId(int? val) => _recetaId = val;

  void incrementRecetaId(int amount) => recetaId = recetaId + amount;

  bool hasRecetaId() => _recetaId != null;

  // "esAlcoholica" field.
  bool? _esAlcoholica;
  bool get esAlcoholica => _esAlcoholica ?? false;
  set esAlcoholica(bool? val) => _esAlcoholica = val;

  bool hasEsAlcoholica() => _esAlcoholica != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "dificultad" field.
  String? _dificultad;
  String get dificultad => _dificultad ?? '';
  set dificultad(String? val) => _dificultad = val;

  bool hasDificultad() => _dificultad != null;

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  set imagen(String? val) => _imagen = val;

  bool hasImagen() => _imagen != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  // "creador_id" field.
  int? _creadorId;
  int get creadorId => _creadorId ?? 0;
  set creadorId(int? val) => _creadorId = val;

  void incrementCreadorId(int amount) => creadorId = creadorId + amount;

  bool hasCreadorId() => _creadorId != null;

  // "tiempo" field.
  int? _tiempo;
  int get tiempo => _tiempo ?? 0;
  set tiempo(int? val) => _tiempo = val;

  void incrementTiempo(int amount) => tiempo = tiempo + amount;

  bool hasTiempo() => _tiempo != null;

  static RecetasStruct fromMap(Map<String, dynamic> data) => RecetasStruct(
        recetaId: castToType<int>(data['recetaId']),
        esAlcoholica: data['esAlcoholica'] as bool?,
        nombre: data['nombre'] as String?,
        dificultad: data['dificultad'] as String?,
        imagen: data['imagen'] as String?,
        descripcion: data['descripcion'] as String?,
        creadorId: castToType<int>(data['creador_id']),
        tiempo: castToType<int>(data['tiempo']),
      );

  static RecetasStruct? maybeFromMap(dynamic data) =>
      data is Map ? RecetasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'recetaId': _recetaId,
        'esAlcoholica': _esAlcoholica,
        'nombre': _nombre,
        'dificultad': _dificultad,
        'imagen': _imagen,
        'descripcion': _descripcion,
        'creador_id': _creadorId,
        'tiempo': _tiempo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'recetaId': serializeParam(
          _recetaId,
          ParamType.int,
        ),
        'esAlcoholica': serializeParam(
          _esAlcoholica,
          ParamType.bool,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'dificultad': serializeParam(
          _dificultad,
          ParamType.String,
        ),
        'imagen': serializeParam(
          _imagen,
          ParamType.String,
        ),
        'descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
        'creador_id': serializeParam(
          _creadorId,
          ParamType.int,
        ),
        'tiempo': serializeParam(
          _tiempo,
          ParamType.int,
        ),
      }.withoutNulls;

  static RecetasStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecetasStruct(
        recetaId: deserializeParam(
          data['recetaId'],
          ParamType.int,
          false,
        ),
        esAlcoholica: deserializeParam(
          data['esAlcoholica'],
          ParamType.bool,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        dificultad: deserializeParam(
          data['dificultad'],
          ParamType.String,
          false,
        ),
        imagen: deserializeParam(
          data['imagen'],
          ParamType.String,
          false,
        ),
        descripcion: deserializeParam(
          data['descripcion'],
          ParamType.String,
          false,
        ),
        creadorId: deserializeParam(
          data['creador_id'],
          ParamType.int,
          false,
        ),
        tiempo: deserializeParam(
          data['tiempo'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RecetasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecetasStruct &&
        recetaId == other.recetaId &&
        esAlcoholica == other.esAlcoholica &&
        nombre == other.nombre &&
        dificultad == other.dificultad &&
        imagen == other.imagen &&
        descripcion == other.descripcion &&
        creadorId == other.creadorId &&
        tiempo == other.tiempo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        recetaId,
        esAlcoholica,
        nombre,
        dificultad,
        imagen,
        descripcion,
        creadorId,
        tiempo
      ]);
}

RecetasStruct createRecetasStruct({
  int? recetaId,
  bool? esAlcoholica,
  String? nombre,
  String? dificultad,
  String? imagen,
  String? descripcion,
  int? creadorId,
  int? tiempo,
}) =>
    RecetasStruct(
      recetaId: recetaId,
      esAlcoholica: esAlcoholica,
      nombre: nombre,
      dificultad: dificultad,
      imagen: imagen,
      descripcion: descripcion,
      creadorId: creadorId,
      tiempo: tiempo,
    );
