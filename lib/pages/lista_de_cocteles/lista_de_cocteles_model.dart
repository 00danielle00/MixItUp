import '/components/difficulty/difficulty_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'lista_de_cocteles_widget.dart' show ListaDeCoctelesWidget;
import 'package:flutter/material.dart';

class ListaDeCoctelesModel extends FlutterFlowModel<ListaDeCoctelesWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for Difficulty dynamic component.
  late FlutterFlowDynamicModels<DifficultyModel> difficultyModels;

  @override
  void initState(BuildContext context) {
    difficultyModels = FlutterFlowDynamicModels(() => DifficultyModel());
  }

  @override
  void dispose() {
    difficultyModels.dispose();
  }
}
