import '../database.dart';

class FavoritosTable extends SupabaseTable<FavoritosRow> {
  @override
  String get tableName => 'favoritos';

  @override
  FavoritosRow createRow(Map<String, dynamic> data) => FavoritosRow(data);
}

class FavoritosRow extends SupabaseDataRow {
  FavoritosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavoritosTable();

  int get idReceta => getField<int>('id_receta')!;
  set idReceta(int value) => setField<int>('id_receta', value);

  String get idUser => getField<String>('id_user')!;
  set idUser(String value) => setField<String>('id_user', value);
}
