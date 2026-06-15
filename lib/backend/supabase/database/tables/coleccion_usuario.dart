import '../database.dart';

class ColeccionUsuarioTable extends SupabaseTable<ColeccionUsuarioRow> {
  @override
  String get tableName => 'coleccion_usuario';

  @override
  ColeccionUsuarioRow createRow(Map<String, dynamic> data) =>
      ColeccionUsuarioRow(data);
}

class ColeccionUsuarioRow extends SupabaseDataRow {
  ColeccionUsuarioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ColeccionUsuarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get idColeccion => getField<int>('id_coleccion');
  set idColeccion(int? value) => setField<int>('id_coleccion', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);
}
