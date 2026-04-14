import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

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
}
