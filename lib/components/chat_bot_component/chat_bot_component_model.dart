import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_bot_component_widget.dart' show ChatBotComponentWidget;
import 'package:flutter/material.dart';

class ChatBotComponentModel extends FlutterFlowModel<ChatBotComponentWidget> {
  ///  Local state fields for this component.

  List<dynamic> mensajes = [];
  void addToMensajes(dynamic item) => mensajes.add(item);
  void removeFromMensajes(dynamic item) => mensajes.remove(item);
  void removeAtIndexFromMensajes(int index) => mensajes.removeAt(index);
  void insertAtIndexInMensajes(int index, dynamic item) =>
      mensajes.insert(index, item);
  void updateMensajesAtIndex(int index, Function(dynamic) updateFn) =>
      mensajes[index] = updateFn(mensajes[index]);

  bool? esUsuario;

  String mensajeInicial =
      'Hola, soy tu bartender virtual. ¿Qué quieres preparar?';

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (StackAIChat)] action in IconButton widget.
  ApiCallResponse? apiResulthxe;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
