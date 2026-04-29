import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'editar_coctel_widget.dart' show EditarCoctelWidget;
import 'package:flutter/material.dart';

class EditarCoctelModel extends FlutterFlowModel<EditarCoctelWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? imagenCoctel;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadImagen = false;
  FFUploadedFile uploadedLocalFile_uploadImagen =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // State field(s) for dificultad widget.
  String? dificultadValue;
  FormFieldController<String>? dificultadValueController;
  // State field(s) for categoria widget.
  String? categoriaValue;
  FormFieldController<String>? categoriaValueController;
  // State field(s) for tiempo widget.
  FocusNode? tiempoFocusNode;
  TextEditingController? tiempoTextController;
  String? Function(BuildContext, String?)? tiempoTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  bool isDataUploading_uploadDataIj8 = false;
  FFUploadedFile uploadedLocalFile_uploadDataIj8 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataIj8 = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<RecetasRow>? recetaEnviada;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();

    tiempoFocusNode?.dispose();
    tiempoTextController?.dispose();
  }
}
