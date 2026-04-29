import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'gestion_receta_page_widget.dart' show GestionRecetaPageWidget;
import 'package:flutter/material.dart';

class GestionRecetaPageModel extends FlutterFlowModel<GestionRecetaPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<RecetaIngredienteRow>? deleteRecIngr;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
