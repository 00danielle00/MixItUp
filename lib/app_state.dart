import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _nickname = await secureStorage.getString('ff_nickname') ?? _nickname;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<int> _favoritos = [];
  List<int> get favoritos => _favoritos;
  set favoritos(List<int> value) {
    _favoritos = value;
  }

  void addToFavoritos(int value) {
    favoritos.add(value);
  }

  void removeFromFavoritos(int value) {
    favoritos.remove(value);
  }

  void removeAtIndexFromFavoritos(int index) {
    favoritos.removeAt(index);
  }

  void updateFavoritosAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    favoritos[index] = updateFn(_favoritos[index]);
  }

  void insertAtIndexInFavoritos(int index, int value) {
    favoritos.insert(index, value);
  }

  dynamic _recetaDelDia;
  dynamic get recetaDelDia => _recetaDelDia;
  set recetaDelDia(dynamic value) {
    _recetaDelDia = value;
  }

  int _indexDelDia = 0;
  int get indexDelDia => _indexDelDia;
  set indexDelDia(int value) {
    _indexDelDia = value;
  }

  String _nickname = '';
  String get nickname => _nickname;
  set nickname(String value) {
    _nickname = value;
    secureStorage.setString('ff_nickname', value);
  }

  void deleteNickname() {
    secureStorage.delete(key: 'ff_nickname');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
