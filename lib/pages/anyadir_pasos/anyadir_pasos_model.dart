import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'anyadir_pasos_widget.dart' show AnyadirPasosWidget;
import 'package:flutter/material.dart';

class AnyadirPasosModel extends FlutterFlowModel<AnyadirPasosWidget> {
  ///  Local state fields for this page.

  List<PasosStruct> listaDePasos = [];
  void addToListaDePasos(PasosStruct item) => listaDePasos.add(item);
  void removeFromListaDePasos(PasosStruct item) => listaDePasos.remove(item);
  void removeAtIndexFromListaDePasos(int index) => listaDePasos.removeAt(index);
  void insertAtIndexInListaDePasos(int index, PasosStruct item) =>
      listaDePasos.insert(index, item);
  void updateListaDePasosAtIndex(int index, Function(PasosStruct) updateFn) =>
      listaDePasos[index] = updateFn(listaDePasos[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
