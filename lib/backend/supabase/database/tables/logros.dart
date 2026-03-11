import '../database.dart';

class LogrosTable extends SupabaseTable<LogrosRow> {
  @override
  String get tableName => 'logros';

  @override
  LogrosRow createRow(Map<String, dynamic> data) => LogrosRow(data);
}

class LogrosRow extends SupabaseDataRow {
  LogrosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LogrosTable();

  int get idLogro => getField<int>('idLogro')!;
  set idLogro(int value) => setField<int>('idLogro', value);

  String? get nombre => getField<String>('nombre');
  set nombre(String? value) => setField<String>('nombre', value);

  String? get descripcion => getField<String>('descripcion');
  set descripcion(String? value) => setField<String>('descripcion', value);
}
