import '/flutter_flow/flutter_flow_util.dart';
import 'change_nickname_widget.dart' show ChangeNicknameWidget;
import 'package:flutter/material.dart';

class ChangeNicknameModel extends FlutterFlowModel<ChangeNicknameWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for contraseaActual widget.
  FocusNode? contraseaActualFocusNode;
  TextEditingController? contraseaActualTextController;
  String? Function(BuildContext, String?)?
      contraseaActualTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    contraseaActualFocusNode?.dispose();
    contraseaActualTextController?.dispose();
  }
}
