import '../database.dart';

class ColeccionRecetaTable extends SupabaseTable<ColeccionRecetaRow> {
  @override
  String get tableName => 'coleccion_receta';

  @override
  ColeccionRecetaRow createRow(Map<String, dynamic> data) =>
      ColeccionRecetaRow(data);
}

class ColeccionRecetaRow extends SupabaseDataRow {
  ColeccionRecetaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ColeccionRecetaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get idColeccion => getField<int>('id_coleccion')!;
  set idColeccion(int value) => setField<int>('id_coleccion', value);

  int get idReceta => getField<int>('id_receta')!;
  set idReceta(int value) => setField<int>('id_receta', value);
}
