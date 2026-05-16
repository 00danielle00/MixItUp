import '/components/cocktail_card/cocktail_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'swipe_widget.dart' show SwipeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeModel extends FlutterFlowModel<SwipeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;
  // Models for CocktailCard dynamic component.
  late FlutterFlowDynamicModels<CocktailCardModel> cocktailCardModels;

  @override
  void initState(BuildContext context) {
    swipeableStackController = CardSwiperController();
    cocktailCardModels = FlutterFlowDynamicModels(() => CocktailCardModel());
  }

  @override
  void dispose() {
    cocktailCardModels.dispose();
  }
}
