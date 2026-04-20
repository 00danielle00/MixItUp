import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

bool isAdult(DateTime fechaNac) {
  final now = DateTime.now();
  final age = now.difference(fechaNac).inDays / 365;

  return age >= 18;
}

int calcularIndex(int length) {
  final now = DateTime.now();
  final sum = now.day + now.month + now.year;
  return sum % length;
}

int siguientePaso(
  int pasoActual,
  int totalPasos,
) {
  if (pasoActual < totalPasos) {
    return pasoActual + 1;
  } else {
    return pasoActual;
  }
}

int pasoAnt(int pasoActual) {
  if (pasoActual > 1) {
    return pasoActual - 1;
  } else {
    return pasoActual; // ya está en el primer paso
  }
}

int segundosAms(int segundos) {
  return segundos * 1000;
}
