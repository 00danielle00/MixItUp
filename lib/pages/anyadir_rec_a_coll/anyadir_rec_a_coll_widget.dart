import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'anyadir_rec_a_coll_model.dart';
export 'anyadir_rec_a_coll_model.dart';

/// Crea una pantalla moderna y minimalista para añadir recetas a una
/// colección, sin AppBar y sin ninguna acción ni lógica.
///
/// Solo estructura visual.
///
/// ESTILO GENERAL:
/// - Fondo blanco o gris muy claro.
/// - Mucho espacio en blanco.
/// - Padding horizontal de 20 px.
/// - Tipografía Poppins o Inter.
/// - Cards limpias, premium, con esquinas redondeadas (16 px) y sombra suave.
/// - Diseño ordenado, elegante y fácil de leer.
///
/// ESTRUCTURA DE LA PANTALLA:
///
/// 1. Encabezado superior (sin AppBar):
///    - Texto grande y semibold: “Añadir recetas”.
///    - Debajo, texto pequeño en gris: “Selecciona recetas para esta
/// colección”.
///    - Separación vertical de 20 px.
///
/// 2. Contenedor informativo:
///    - Padding 16 px.
///    - Fondo gris muy claro (#F5F5F5).
///    - Bordes redondeados (12 px).
///    - Texto: “Recetas disponibles”.
///    - Texto pequeño debajo: “Elige las recetas que quieres añadir”.
///    - Separación vertical de 20 px.
///
/// 3. ListView vertical de recetas:
///    - Separación entre items: 16 px.
///    - Cada item es una card con:
///        - Imagen cuadrada a la izquierda (ratio 1:1, esquinas redondeadas).
///        - A la derecha, una columna con:
///            - Nombre de la receta (texto grande, semibold).
///            - Descripción corta (máximo 2 líneas, gris).
///            - Dificultad en texto pequeño.
///        - A la derecha del todo, un icono circular gris (checkbox o
/// bookmark), sin acciones.
///    - Cards con fondo blanco, sombra suave y padding interno de 12 px.
///
/// 4. Botón inferior fijo:
///    - Texto: “Añadir a la colección”.
///    - Botón grande, ancho completo, esquinas redondeadas (radius 30).
///    - Color primario suave.
///    - Sin acciones, solo apariencia.
///
/// NO INCLUIR:
/// - No incluir AppBar.
/// - No incluir funciones.
/// - No incluir acciones.
/// - No incluir lógica de selección.
/// - No incluir queries.
/// - Solo estructura visual premium.
class AnyadirRecACollWidget extends StatefulWidget {
  const AnyadirRecACollWidget({
    super.key,
    this.idCol,
  });

  final int? idCol;

  static String routeName = 'anyadirRecAColl';
  static String routePath = '/anyadirRecAColl';

  @override
  State<AnyadirRecACollWidget> createState() => _AnyadirRecACollWidgetState();
}

class _AnyadirRecACollWidgetState extends State<AnyadirRecACollWidget> {
  late AnyadirRecACollModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnyadirRecACollModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.queryColeccion = await ColeccionRecetaTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id_coleccion',
          widget.idCol,
        ),
      );
      _model.recetasSeleccionadas = _model.queryColeccion!
          .map((e) => e.idReceta)
          .toList()
          .toList()
          .cast<int>();
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF8F5F0),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'igyuycz0' /* Añadir recetas */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 32.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                              lineHeight: 1.4,
                            ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '6mcu8ux1' /* Selecciona recetas para esta c... */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                                lineHeight: 1.4,
                              ),
                        ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FutureBuilder<List<RecetasRow>>(
                        future: RecetasTable().queryRows(
                          queryFn: (q) => q,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<RecetasRow> listViewRecetasRowList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewRecetasRowList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewRecetasRow =
                                  listViewRecetasRowList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Container(
                                  height: 125.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      FlutterFlowTheme.of(context)
                                          .designToken
                                          .shadow
                                          .sm
                                    ],
                                    borderRadius: BorderRadius.circular(16.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            listViewRecetasRow.imagen!,
                                            width: 120.0,
                                            height: 120.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  listViewRecetasRow.nombre,
                                                  'name',
                                                ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .interTight(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                          lineHeight: 1.4,
                                                        ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  listViewRecetasRow
                                                      .descripcion,
                                                  'desc',
                                                ),
                                                maxLines: 2,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodySmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .fontStyle,
                                                      lineHeight: 1.4,
                                                    ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1beegs6n' /* Fácil • 20 min */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelSmall
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                      lineHeight: 1.4,
                                                    ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                        Container(
                                          width: 32.0,
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(9999.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 30.0,
                                              fillColor: Colors.white,
                                              icon: Icon(
                                                Icons.add_circle_sharp,
                                                color: _model.recetasSeleccionadas
                                                            .contains(
                                                                listViewRecetasRow
                                                                    .recetaId) ==
                                                        true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .warning
                                                    : Colors.black,
                                                size: 26.0,
                                              ),
                                              onPressed: () async {
                                                if (_model.recetasSeleccionadas
                                                        .contains(
                                                            listViewRecetasRow
                                                                .recetaId) ==
                                                    true) {
                                                  _model
                                                      .removeFromRecetasSeleccionadas(
                                                          listViewRecetasRow
                                                              .recetaId);
                                                  safeSetState(() {});
                                                  await ColeccionRecetaTable()
                                                      .delete(
                                                    matchingRows: (rows) => rows
                                                        .eqOrNull(
                                                          'id_coleccion',
                                                          widget.idCol,
                                                        )
                                                        .eqOrNull(
                                                          'id_receta',
                                                          listViewRecetasRow
                                                              .recetaId,
                                                        ),
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Receta quitada',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      backgroundColor:
                                                          Color(0xFF9CFFF4),
                                                    ),
                                                  );
                                                } else {
                                                  _model
                                                      .addToRecetasSeleccionadas(
                                                          listViewRecetasRow
                                                              .recetaId);
                                                  safeSetState(() {});
                                                  await ColeccionRecetaTable()
                                                      .insert({
                                                    'id_coleccion':
                                                        widget.idCol,
                                                    'id_receta':
                                                        listViewRecetasRow
                                                            .recetaId,
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Receta añadida',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 300),
                                                      backgroundColor:
                                                          Color(0xFF9CFFF4),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(HomeWidget.routeName);
                    },
                    text: FFLocalizations.of(context).getText(
                      'ij8tsbec' /* Finalizar */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.black,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
