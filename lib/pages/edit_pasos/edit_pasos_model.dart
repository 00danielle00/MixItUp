import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'edit_pasos_widget.dart' show EditPasosWidget;
import 'package:flutter/material.dart';

class EditPasosModel extends FlutterFlowModel<EditPasosWidget> {
  ///  Local state fields for this page.

  List<dynamic> listaPasos = [];
  void addToListaPasos(dynamic item) => listaPasos.add(item);
  void removeFromListaPasos(dynamic item) => listaPasos.remove(item);
  void removeAtIndexFromListaPasos(int index) => listaPasos.removeAt(index);
  void insertAtIndexInListaPasos(int index, dynamic item) =>
      listaPasos.insert(index, item);
  void updateListaPasosAtIndex(int index, Function(dynamic) updateFn) =>
      listaPasos[index] = updateFn(listaPasos[index]);

  ///  State fields for stateful widgets in this page.

  Completer<List<PasosRow>>? requestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
