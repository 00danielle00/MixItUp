import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'anyadir_ingrediente_widget.dart' show AnyadirIngredienteWidget;
import 'package:flutter/material.dart';

class AnyadirIngredienteModel
    extends FlutterFlowModel<AnyadirIngredienteWidget> {
  ///  Local state fields for this page.

  List<IngredientesStruct> listaIngredientes = [];
  void addToListaIngredientes(IngredientesStruct item) =>
      listaIngredientes.add(item);
  void removeFromListaIngredientes(IngredientesStruct item) =>
      listaIngredientes.remove(item);
  void removeAtIndexFromListaIngredientes(int index) =>
      listaIngredientes.removeAt(index);
  void insertAtIndexInListaIngredientes(int index, IngredientesStruct item) =>
      listaIngredientes.insert(index, item);
  void updateListaIngredientesAtIndex(
          int index, Function(IngredientesStruct) updateFn) =>
      listaIngredientes[index] = updateFn(listaIngredientes[index]);

  int? idIngredienteActual;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<IngredientesRow>? selectIngredientes;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  IngredientesRow? insertIngrediente;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  RecetaIngredienteRow? insertRecetaIngredientes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
