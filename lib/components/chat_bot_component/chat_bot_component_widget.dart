import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_bot_component_model.dart';
export 'chat_bot_component_model.dart';

class ChatBotComponentWidget extends StatefulWidget {
  const ChatBotComponentWidget({super.key});

  @override
  State<ChatBotComponentWidget> createState() => _ChatBotComponentWidgetState();
}

class _ChatBotComponentWidgetState extends State<ChatBotComponentWidget> {
  late ChatBotComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBotComponentModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToMensajes(<String, dynamic>{
        'text': _model.mensajeInicial,
        'esUsuario': false,
      });
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      height: 450.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(0.0, 2.0),
            spreadRadius: 5.0,
          )
        ],
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
            child: Container(
              height: 55.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                  )
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD7AB),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: const Icon(
                        Icons.local_bar,
                        color: Color(0xFFEEA860),
                        size: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          10.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '9w0qqpvz' /* MixItUp AI */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              font: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // MENSAJES
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Builder(
                builder: (context) {
                  final currentItem = _model.mensajes.toList();

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: currentItem.length,
                    itemBuilder: (context, index) {
                      final item = currentItem[index];
                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 5.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 0.0, 2.0),
                                child: Text(
                                  getJsonField(item, r'''$.esUsuario''')
                                      ? 'Tú'
                                      : 'Chatbot',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 5.0),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                      maxWidth: 300.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: getJsonField(
                                        item,
                                        r'''$.esUsuario''',
                                      )
                                          ? const Color(0xFFFFF4C0)
                                          : const Color(0xFFE3E3E3),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8.0, 8.0, 8.0, 8.0),
                                      child: AutoSizeText(
                                        getJsonField(
                                          item,
                                          r'''$.text''',
                                        ).toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),

          // INPUT
          Column(
            children: [
              Container(
                width: 350.0,
                height: 55.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(2.0, 2.0),
                      spreadRadius: 3.0,
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      10.0, 0.0, 10.0, 0.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: FFLocalizations.of(context).getText(
                                '8iurrvl8' /* Dame una receta... */,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                  ),
                                  letterSpacing: 0.0,
                                ),
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primaryText,
                        icon: Icon(
                          Icons.send_rounded,
                          color: FlutterFlowTheme.of(context).info,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          _model.addToMensajes(<String, dynamic>{
                            'text': _model.textController.text,
                            'esUsuario': true,
                          });
                          safeSetState(() {});
                          _model.esUsuario = true;
                          safeSetState(() {});
                          _model.apiResulthxe = await StackAIChatCall.call(
                            prompt: _model.textController.text,
                          );

                          if ((_model.apiResulthxe?.succeeded ?? true)) {
                            _model.addToMensajes(<String, dynamic>{
                              'text': getJsonField(
                                (_model.apiResulthxe?.jsonBody ?? ''),
                                r'''$.outputs["out-0"]''',
                              ),
                              'esUsuario': false,
                            });
                            safeSetState(() {});
                            _model.esUsuario = false;
                            safeSetState(() {});
                            safeSetState(() {
                              _model.textController?.clear();
                            });
                          }

                          safeSetState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
