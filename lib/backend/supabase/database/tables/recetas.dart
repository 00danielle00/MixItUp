import '../database.dart';

class RecetasTable extends SupabaseTable<RecetasRow> {
  @override
  String get tableName => 'recetas';

  @override
  RecetasRow createRow(Map<String, dynamic> data) => RecetasRow(data);
}

class RecetasRow extends SupabaseDataRow {
  RecetasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RecetasTable();

  int get recetaId => getField<int>('receta_id')!;
  set recetaId(int value) => setField<int>('receta_id', value);

  bool? get esAlcoholica => getField<bool>('esAlcoholica');
  set esAlcoholica(bool? value) => setField<bool>('esAlcoholica', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get dificultad => getField<String>('dificultad');
  set dificultad(String? value) => setField<String>('dificultad', value);

  String? get imagen => getField<String>('imagen');
  set imagen(String? value) => setField<String>('imagen', value);

  String? get descripcion => getField<String>('descripcion');
  set descripcion(String? value) => setField<String>('descripcion', value);

  String? get creadorId => getField<String>('creador_id');
  set creadorId(String? value) => setField<String>('creador_id', value);

  int? get tiempo => getField<int>('tiempo');
  set tiempo(int? value) => setField<int>('tiempo', value);
}
