import '/flutter_flow/flutter_flow_util.dart';
import 'change_passwd_widget.dart' show ChangePasswdWidget;
import 'package:flutter/material.dart';

class ChangePasswdModel extends FlutterFlowModel<ChangePasswdWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for contraseaActual widget.
  FocusNode? contraseaActualFocusNode;
  TextEditingController? contraseaActualTextController;
  late bool contraseaActualVisibility;
  String? Function(BuildContext, String?)?
      contraseaActualTextControllerValidator;
  // State field(s) for contrasenaNueva widget.
  FocusNode? contrasenaNuevaFocusNode;
  TextEditingController? contrasenaNuevaTextController;
  late bool contrasenaNuevaVisibility;
  String? Function(BuildContext, String?)?
      contrasenaNuevaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    contraseaActualVisibility = false;
    contrasenaNuevaVisibility = false;
  }

  @override
  void dispose() {
    contraseaActualFocusNode?.dispose();
    contraseaActualTextController?.dispose();

    contrasenaNuevaFocusNode?.dispose();
    contrasenaNuevaTextController?.dispose();
  }
}
