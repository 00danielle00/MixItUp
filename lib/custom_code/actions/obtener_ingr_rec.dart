// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<dynamic>> obtenerIngrRec(int idReceta) async {
  final supabase = Supabase.instance.client;

  final recetaIngr = await supabase
      .from('receta_ingrediente')
      .select()
      .eq('id_receta', idReceta);

  List<Map<String, dynamic>> resultado = [];

  for (final item in recetaIngr) {
    final ingr = await supabase
        .from('ingredientes')
        .select()
        .eq('id_ingr', item['id_ingr'])
        .single();

    resultado.add({
      'id_ingr': item['id_ingr'],
      'nombre': ingr['nombre'],
      'cantidad': item['cantidad'],
      'unidad': item['unidad'],
    });
  }

  return resultado;
}
