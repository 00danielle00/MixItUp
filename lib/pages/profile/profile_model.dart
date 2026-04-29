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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - recetausuario] action in Profile widget.
  List<dynamic>? usuarioReceta;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
