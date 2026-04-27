import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'difficulty_model.dart';
export 'difficulty_model.dart';

class DifficultyWidget extends StatefulWidget {
  const DifficultyWidget({
    super.key,
    required this.difficulty,
  });

  final String? difficulty;

  @override
  State<DifficultyWidget> createState() => _DifficultyWidgetState();
}

class _DifficultyWidgetState extends State<DifficultyWidget> {
  late DifficultyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DifficultyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 80.0,
          height: 30.0,
          decoration: BoxDecoration(
            color: () {
              if (widget.difficulty == 'Fácil') {
                return Color(0xFFE8F5E9);
              } else if (widget.difficulty == 'Medio') {
                return Color(0xFFFFF3E0);
              } else {
                return Color(0xFFFCE4EC);
              }
            }(),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.difficulty,
                'difff',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: () {
                      if (widget.difficulty == 'Fácil') {
                        return Color(0xFF2E7D32);
                      } else if (widget.difficulty == 'Medio') {
                        return Color(0xFFE65100);
                      } else {
                        return Color(0xFFC62828);
                      }
                    }(),
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
