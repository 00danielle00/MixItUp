import '../database.dart';

class RecetaIngredienteTable extends SupabaseTable<RecetaIngredienteRow> {
  @override
  String get tableName => 'receta_ingrediente';

  @override
  RecetaIngredienteRow createRow(Map<String, dynamic> data) =>
      RecetaIngredienteRow(data);
}

class RecetaIngredienteRow extends SupabaseDataRow {
  RecetaIngredienteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RecetaIngredienteTable();

  int get idReceta => getField<int>('id_receta')!;
  set idReceta(int value) => setField<int>('id_receta', value);

  int get idIngr => getField<int>('id_ingr')!;
  set idIngr(int value) => setField<int>('id_ingr', value);

  int? get cantidad => getField<int>('cantidad');
  set cantidad(int? value) => setField<int>('cantidad', value);

  String? get unidad => getField<String>('unidad');
  set unidad(String? value) => setField<String>('unidad', value);
}
