import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'anyadir_rec_a_coll_widget.dart' show AnyadirRecACollWidget;
import 'package:flutter/material.dart';

class AnyadirRecACollModel extends FlutterFlowModel<AnyadirRecACollWidget> {
  ///  Local state fields for this page.

  List<int> recetasSeleccionadas = [];
  void addToRecetasSeleccionadas(int item) => recetasSeleccionadas.add(item);
  void removeFromRecetasSeleccionadas(int item) =>
      recetasSeleccionadas.remove(item);
  void removeAtIndexFromRecetasSeleccionadas(int index) =>
      recetasSeleccionadas.removeAt(index);
  void insertAtIndexInRecetasSeleccionadas(int index, int item) =>
      recetasSeleccionadas.insert(index, item);
  void updateRecetasSeleccionadasAtIndex(int index, Function(int) updateFn) =>
      recetasSeleccionadas[index] = updateFn(recetasSeleccionadas[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in anyadirRecAColl widget.
  List<ColeccionRecetaRow>? queryColeccion;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
