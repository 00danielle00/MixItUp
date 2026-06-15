import '../database.dart';

class PasosTable extends SupabaseTable<PasosRow> {
  @override
  String get tableName => 'pasos';

  @override
  PasosRow createRow(Map<String, dynamic> data) => PasosRow(data);
}

class PasosRow extends SupabaseDataRow {
  PasosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PasosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get recetaId => getField<int>('receta_id');
  set recetaId(int? value) => setField<int>('receta_id', value);

  int? get pasoNum => getField<int>('paso_num');
  set pasoNum(int? value) => setField<int>('paso_num', value);

  String? get descripcion => getField<String>('descripcion');
  set descripcion(String? value) => setField<String>('descripcion', value);

  int? get duracionSegundos => getField<int>('duracion_segundos');
  set duracionSegundos(int? value) => setField<int>('duracion_segundos', value);
}
