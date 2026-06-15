import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'crear_coleccion_widget.dart' show CrearColeccionWidget;
import 'package:flutter/material.dart';

class CrearColeccionModel extends FlutterFlowModel<CrearColeccionWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? imagenCoctel;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataS0p = false;
  FFUploadedFile uploadedLocalFile_uploadDataS0p =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading_uploadImagenCollection = false;
  FFUploadedFile uploadedLocalFile_uploadImagenCollection =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadImagenCollection = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  ColeccionRow? coleccionEnviada;

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
