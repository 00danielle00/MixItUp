import '/components/difficulty/difficulty_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cocktail_card_widget.dart' show CocktailCardWidget;
import 'package:flutter/material.dart';

class CocktailCardModel extends FlutterFlowModel<CocktailCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Difficulty component.
  late DifficultyModel difficultyModel;

  @override
  void initState(BuildContext context) {
    difficultyModel = createModel(context, () => DifficultyModel());
  }

  @override
  void dispose() {
    difficultyModel.dispose();
  }
}
