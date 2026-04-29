import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'crear_coctel_widget.dart' show CrearCoctelWidget;
import 'package:flutter/material.dart';

class CrearCoctelModel extends FlutterFlowModel<CrearCoctelWidget> {
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
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for Switch widget.
  bool? switchValue;
  bool isDataUploading_uploadImagen2 = false;
  FFUploadedFile uploadedLocalFile_uploadImagen2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadImagen2 = '';

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  RecetasRow? recetaEnviada;

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
