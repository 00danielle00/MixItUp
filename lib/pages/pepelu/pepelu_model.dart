import '/components/difficulty/difficulty_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pepelu_widget.dart' show PepeluWidget;
import 'package:flutter/material.dart';

class PepeluModel extends FlutterFlowModel<PepeluWidget> {
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
