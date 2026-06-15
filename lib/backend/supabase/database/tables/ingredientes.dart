import '../database.dart';

class IngredientesTable extends SupabaseTable<IngredientesRow> {
  @override
  String get tableName => 'ingredientes';

  @override
  IngredientesRow createRow(Map<String, dynamic> data) => IngredientesRow(data);
}

class IngredientesRow extends SupabaseDataRow {
  IngredientesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IngredientesTable();

  int get idIngr => getField<int>('id_ingr')!;
  set idIngr(int value) => setField<int>('id_ingr', value);

  String get nombre => getField<String>('nombre')!;
  set nombre(String value) => setField<String>('nombre', value);
}
