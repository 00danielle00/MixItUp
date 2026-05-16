import '/backend/supabase/supabase.dart';
import '/components/cocktail_card/cocktail_card_widget.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'swipe_model.dart';
export 'swipe_model.dart';

/// Pantalla llamada “Descubre” que contiene únicamente un texto introductorio
/// pequeño arriba y debajo un Swipeable Stack ocupando casi toda la pantalla.
///
/// El Swipeable Stack debe usar un backend query a la colección “cocktails” y
/// mostrar una tarjeta por cada elemento. Cada tarjeta es un contenedor
/// grande con una imagen arriba, debajo el nombre del cóctel, una fila con
/// los ingredientes básicos y un texto pequeño con la dificultad. Las
/// tarjetas deben estar apiladas unas sobre otras y permitir swipe a
/// izquierda y derecha. No añadir AppBar, no añadir botones, no añadir
/// acciones, no añadir estilos avanzados. Solo la estructura: texto
/// introductorio y el Swipeable Stack con el contenedor de la tarjeta y sus
/// elementos internos.
class SwipeWidget extends StatefulWidget {
  const SwipeWidget({super.key});

  static String routeName = 'swipe';
  static String routePath = '/swipe';

  @override
  State<SwipeWidget> createState() => _SwipeWidgetState();
}

class _SwipeWidgetState extends State<SwipeWidget> {
  late SwipeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeModel());
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
        backgroundColor: Color(0xFFF8F4F0),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'o8u3c877' /* Descubre */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontStyle,
                          lineHeight: 1.4,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'cn33q9uh' /* Desliza para encontrar tu próx... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          lineHeight: 1.4,
                        ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
            Expanded(
              child: Stack(
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
                      List<RecetasRow> swipeableStackRecetasRowList =
                          snapshot.data!;

                      return FlutterFlowSwipeableStack(
                        onSwipeFn: (swipeableStackIndex) {},
                        onLeftSwipe: (swipeableStackIndex) {},
                        onRightSwipe: (swipeableStackIndex) {},
                        onUpSwipe: (swipeableStackIndex) {},
                        onDownSwipe: (swipeableStackIndex) {},
                        itemBuilder: (context, swipeableStackIndex) {
                          final swipeableStackRecetasRow =
                              swipeableStackRecetasRowList[swipeableStackIndex];
                          return wrapWithModel(
                            model: _model.cocktailCardModels.getModel(
                              swipeableStackRecetasRow.recetaId.toString(),
                              swipeableStackIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: CocktailCardWidget(
                              key: Key(
                                'Key2al_${swipeableStackRecetasRow.recetaId.toString()}',
                              ),
                              receta: swipeableStackRecetasRow,
                            ),
                          );
                        },
                        itemCount: swipeableStackRecetasRowList.length,
                        controller: _model.swipeableStackController,
                        loop: false,
                        cardDisplayCount: 3,
                        scale: 0.2,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
