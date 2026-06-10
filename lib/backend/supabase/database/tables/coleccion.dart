import '../database.dart';

class ColeccionTable extends SupabaseTable<ColeccionRow> {
  @override
  String get tableName => 'coleccion';

  @override
  ColeccionRow createRow(Map<String, dynamic> data) => ColeccionRow(data);
}

class ColeccionRow extends SupabaseDataRow {
  ColeccionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ColeccionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get descripcion => getField<String>('descripción');
  set descripcion(String? value) => setField<String>('descripción', value);

  String? get imagen => getField<String>('imagen');
  set imagen(String? value) => setField<String>('imagen', value);
}
