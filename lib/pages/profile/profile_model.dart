import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  Local state fields for this page.

  List<dynamic> listaRecetaPorUsuario = [];
  void addToListaRecetaPorUsuario(dynamic item) =>
      listaRecetaPorUsuario.add(item);
  void removeFromListaRecetaPorUsuario(dynamic item) =>
      listaRecetaPorUsuario.remove(item);
  void removeAtIndexFromListaRecetaPorUsuario(int index) =>
      listaRecetaPorUsuario.removeAt(index);
  void insertAtIndexInListaRecetaPorUsuario(int index, dynamic item) =>
      listaRecetaPorUsuario.insert(index, item);
  void updateListaRecetaPorUsuarioAtIndex(
          int index, Function(dynamic) updateFn) =>
      listaRecetaPorUsuario[index] = updateFn(listaRecetaPorUsuario[index]);

  List<dynamic> listaColeccionUsuario = [];
  void addToListaColeccionUsuario(dynamic item) =>
      listaColeccionUsuario.add(item);
  void removeFromListaColeccionUsuario(dynamic item) =>
      listaColeccionUsuario.remove(item);
  void removeAtIndexFromListaColeccionUsuario(int index) =>
      listaColeccionUsuario.removeAt(index);
  void insertAtIndexInListaColeccionUsuario(int index, dynamic item) =>
      listaColeccionUsuario.insert(index, item);
  void updateListaColeccionUsuarioAtIndex(
          int index, Function(dynamic) updateFn) =>
      listaColeccionUsuario[index] = updateFn(listaColeccionUsuario[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - recetausuario] action in Profile widget.
  List<dynamic>? usuarioReceta;
  // Stores action output result for [Custom Action - comprobarColecciones] action in Profile widget.
  List<dynamic>? coleccionesUsuario;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
