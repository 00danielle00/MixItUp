import '/flutter_flow/flutter_flow_util.dart';
import 'categoria_widget.dart' show CategoriaWidget;
import 'package:flutter/material.dart';

class CategoriaModel extends FlutterFlowModel<CategoriaWidget> {
  ///  Local state fields for this page.

  List<dynamic> filtro = [];
  void addToFiltro(dynamic item) => filtro.add(item);
  void removeFromFiltro(dynamic item) => filtro.remove(item);
  void removeAtIndexFromFiltro(int index) => filtro.removeAt(index);
  void insertAtIndexInFiltro(int index, dynamic item) =>
      filtro.insert(index, item);
  void updateFiltroAtIndex(int index, Function(dynamic) updateFn) =>
      filtro[index] = updateFn(filtro[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - filtroCat] action in categoria widget.
  List<dynamic>? filer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
