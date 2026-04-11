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
      _favoritos = (await secureStorage.getStringList('ff_favoritos'))
              ?.map(int.parse)
              .toList() ??
          _favoritos;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_recetaDelDia') != null) {
        try {
          _recetaDelDia = jsonDecode(
              await secureStorage.getString('ff_recetaDelDia') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
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
    secureStorage.setStringList(
        'ff_favoritos', value.map((x) => x.toString()).toList());
  }

  void deleteFavoritos() {
    secureStorage.delete(key: 'ff_favoritos');
  }

  void addToFavoritos(int value) {
    favoritos.add(value);
    secureStorage.setStringList(
        'ff_favoritos', _favoritos.map((x) => x.toString()).toList());
  }

  void removeFromFavoritos(int value) {
    favoritos.remove(value);
    secureStorage.setStringList(
        'ff_favoritos', _favoritos.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromFavoritos(int index) {
    favoritos.removeAt(index);
    secureStorage.setStringList(
        'ff_favoritos', _favoritos.map((x) => x.toString()).toList());
  }

  void updateFavoritosAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    favoritos[index] = updateFn(_favoritos[index]);
    secureStorage.setStringList(
        'ff_favoritos', _favoritos.map((x) => x.toString()).toList());
  }

  void insertAtIndexInFavoritos(int index, int value) {
    favoritos.insert(index, value);
    secureStorage.setStringList(
        'ff_favoritos', _favoritos.map((x) => x.toString()).toList());
  }

  dynamic _recetaDelDia;
  dynamic get recetaDelDia => _recetaDelDia;
  set recetaDelDia(dynamic value) {
    _recetaDelDia = value;
    secureStorage.setString('ff_recetaDelDia', jsonEncode(value));
  }

  void deleteRecetaDelDia() {
    secureStorage.delete(key: 'ff_recetaDelDia');
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
