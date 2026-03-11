import '../database.dart';

class UserLogroTable extends SupabaseTable<UserLogroRow> {
  @override
  String get tableName => 'user_logro';

  @override
  UserLogroRow createRow(Map<String, dynamic> data) => UserLogroRow(data);
}

class UserLogroRow extends SupabaseDataRow {
  UserLogroRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserLogroTable();

  int get idLogro => getField<int>('id_logro')!;
  set idLogro(int value) => setField<int>('id_logro', value);

  DateTime? get fechaLogro => getField<DateTime>('fecha_logro');
  set fechaLogro(DateTime? value) => setField<DateTime>('fecha_logro', value);

  String? get idUser => getField<String>('id_user');
  set idUser(String? value) => setField<String>('id_user', value);
}
