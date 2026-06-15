// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoritosStruct extends BaseStruct {
  FavoritosStruct({
    int? idReceta,
    String? idUser,
    int? idFav,
  })  : _idReceta = idReceta,
        _idUser = idUser,
        _idFav = idFav;

  // "id_receta" field.
  int? _idReceta;
  int get idReceta => _idReceta ?? 0;
  set idReceta(int? val) => _idReceta = val;

  void incrementIdReceta(int amount) => idReceta = idReceta + amount;

  bool hasIdReceta() => _idReceta != null;

  // "id_user" field.
  String? _idUser;
  String get idUser => _idUser ?? '';
  set idUser(String? val) => _idUser = val;

  bool hasIdUser() => _idUser != null;

  // "id_fav" field.
  int? _idFav;
  int get idFav => _idFav ?? 0;
  set idFav(int? val) => _idFav = val;

  void incrementIdFav(int amount) => idFav = idFav + amount;

  bool hasIdFav() => _idFav != null;

  static FavoritosStruct fromMap(Map<String, dynamic> data) => FavoritosStruct(
        idReceta: castToType<int>(data['id_receta']),
        idUser: data['id_user'] as String?,
        idFav: castToType<int>(data['id_fav']),
      );

  static FavoritosStruct? maybeFromMap(dynamic data) => data is Map
      ? FavoritosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id_receta': _idReceta,
        'id_user': _idUser,
        'id_fav': _idFav,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_receta': serializeParam(
          _idReceta,
          ParamType.int,
        ),
        'id_user': serializeParam(
          _idUser,
          ParamType.String,
        ),
        'id_fav': serializeParam(
          _idFav,
          ParamType.int,
        ),
      }.withoutNulls;

  static FavoritosStruct fromSerializableMap(Map<String, dynamic> data) =>
      FavoritosStruct(
        idReceta: deserializeParam(
          data['id_receta'],
          ParamType.int,
          false,
        ),
        idUser: deserializeParam(
          data['id_user'],
          ParamType.String,
          false,
        ),
        idFav: deserializeParam(
          data['id_fav'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FavoritosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FavoritosStruct &&
        idReceta == other.idReceta &&
        idUser == other.idUser &&
        idFav == other.idFav;
  }

  @override
  int get hashCode => const ListEquality().hash([idReceta, idUser, idFav]);
}

FavoritosStruct createFavoritosStruct({
  int? idReceta,
  String? idUser,
  int? idFav,
}) =>
    FavoritosStruct(
      idReceta: idReceta,
      idUser: idUser,
      idFav: idFav,
    );
