import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favoritos =
          prefs.getStringList('ff_favoritos')?.map(int.parse).toList() ??
              _favoritos;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<int> _favoritos = [];
  List<int> get favoritos => _favoritos;
  set favoritos(List<int> value) {
    _favoritos = value;
    prefs.setStringList(
        'ff_favoritos', value.map((x) => x.toString()).toList());
  }

  void addToFavoritos(int value) {
    favoritos.add(value);
    prefs.setStringList(
        'ff_favoritos', _favoritos.map((x) => x.toString()).toList());
  }

  void removeFromFavoritos(int value) {
    favoritos.remove(value);
    prefs.setStringList(
        'ff_favoritos', _favoritos.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromFavoritos(int index) {
    favoritos.removeAt(index);
    prefs.setStringList(
        'ff_favoritos', _favoritos.map((x) => x.toString()).toList());
  }

  void updateFavoritosAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    favoritos[index] = updateFn(_favoritos[index]);
    prefs.setStringList(
        'ff_favoritos', _favoritos.map((x) => x.toString()).toList());
  }

  void insertAtIndexInFavoritos(int index, int value) {
    favoritos.insert(index, value);
    prefs.setStringList(
        'ff_favoritos', _favoritos.map((x) => x.toString()).toList());
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
