import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'editar_collection_widget.dart' show EditarCollectionWidget;
import 'package:flutter/material.dart';

class EditarCollectionModel extends FlutterFlowModel<EditarCollectionWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? imagenCoctel;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadImageColl = false;
  FFUploadedFile uploadedLocalFile_uploadImageColl =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  bool isDataUploading_uploadDataColecciones = false;
  FFUploadedFile uploadedLocalFile_uploadDataColecciones =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataColecciones = '';

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ColeccionRow>? coleccionENviada;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<ColeccionRow>? editCol;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();
  }
}
