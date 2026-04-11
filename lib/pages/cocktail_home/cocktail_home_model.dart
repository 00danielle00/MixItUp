import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cocktail_home_widget.dart' show CocktailHomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CocktailHomeModel extends FlutterFlowModel<CocktailHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - coctailDelDia] action in cocktailHome widget.
  dynamic res;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
