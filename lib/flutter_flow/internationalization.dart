import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
    String? ptText = '',
  }) =>
      [esText, enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LOGIN
  {
    '1lvdbefj': {
      'es': 'Iniciar sesión',
      'en': '',
      'pt': '',
    },
    'g2v4kwv8': {
      'es': 'Let\'s get started by filling out the form below.',
      'en': '',
      'pt': '',
    },
    'hwl7q3vb': {
      'es': 'Email',
      'en': '',
      'pt': '',
    },
    'ds8nmtuy': {
      'es': 'Password',
      'en': '',
      'pt': '',
    },
    '1yt0zz0z': {
      'es': 'Log In',
      'en': '',
      'pt': '',
    },
    'ricag7zl': {
      'es': 'Or sign up with',
      'en': '',
      'pt': '',
    },
    '43e77fva': {
      'es': 'Continue with Google',
      'en': '',
      'pt': '',
    },
    'j9yfplwk': {
      'es': 'Continue with Apple',
      'en': '',
      'pt': '',
    },
    '18wqk1f7': {
      'es': 'Don\'t have an account?  ',
      'en': '',
      'pt': '',
    },
    'j5bs8out': {
      'es': 'Sign Up here',
      'en': '',
      'pt': '',
    },
    'zaoc9dgm': {
      'es': 'Home',
      'en': '',
      'pt': '',
    },
  },
  // SIGNIn
  {
    'nk4ztf6q': {
      'es': 'Registrarse',
      'en': '',
      'pt': '',
    },
    'djqy9vjx': {
      'es': 'Rellena los datos para darte de alta en la aplicación.',
      'en': '',
      'pt': '',
    },
    '654rznd3': {
      'es': 'Nombre',
      'en': '',
      'pt': '',
    },
    'nxjciswd': {
      'es': 'Seleccionar fecha',
      'en': '',
      'pt': '',
    },
    '3qpugb3l': {
      'es': 'Correo electrónico',
      'en': '',
      'pt': '',
    },
    '6t9f123p': {
      'es': 'Contraseña',
      'en': '',
      'pt': '',
    },
    'uf81clam': {
      'es': 'Confirmar contraseña',
      'en': '',
      'pt': '',
    },
    'yxvqrzy4': {
      'es': 'Crear Cuenta',
      'en': '',
      'pt': '',
    },
    'i42wdxyr': {
      'es': '¿Ya tienes una cuenta?  ',
      'en': '',
      'pt': '',
    },
    'y7ak5v57': {
      'es': 'Iniciar sesión aquí',
      'en': '',
      'pt': '',
    },
    'ey1n9c91': {
      'es': 'Home',
      'en': '',
      'pt': '',
    },
  },
  // detalleCoctel
  {
    'abw416l1': {
      'es': 'Ingredientes',
      'en': '',
      'pt': '',
    },
    'c92nk00d': {
      'es': 'Empezar',
      'en': '',
      'pt': '',
    },
  },
  // NicknamePage
  {
    'wkll9xmz': {
      'es': '¿Cómo quieres que te llamemos?',
      'en': '',
      'pt': '',
    },
    'e7pb8ztl': {
      'es': 'Este será tu nombre visible en la app.',
      'en': '',
      'pt': '',
    },
    'kezkk663': {
      'es': 'Tu nombre o nickname',
      'en': '',
      'pt': '',
    },
    'f7xmr09m': {
      'es': 'Continuar',
      'en': '',
      'pt': '',
    },
  },
  // Settings
  {
    'mpb9whk9': {
      'es': 'Configuración',
      'en': '',
      'pt': '',
    },
    'k5acsfsx': {
      'es': 'PERFIL',
      'en': '',
      'pt': '',
    },
    'cxqlq8qy': {
      'es': 'Editar perfil',
      'en': '',
      'pt': '',
    },
    'v7h4fltx': {
      'es': 'Cócteles favoritos',
      'en': '',
      'pt': '',
    },
    '7y48s077': {
      'es': 'Mis cócteles',
      'en': '',
      'pt': '',
    },
    'potr0reo': {
      'es': 'Cerrar Sesión',
      'en': '',
      'pt': '',
    },
    'wufaynkn': {
      'es': 'Home',
      'en': '',
      'pt': '',
    },
  },
  // PasoScreen
  {
    'muozfel0': {
      'es': 'Paso ',
      'en': '',
      'pt': '',
    },
    'a9sn4rm7': {
      'es': 'de ',
      'en': '',
      'pt': '',
    },
    'v3gb0svs': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'k1dtlsfr': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'vjj33lif': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'ie61p4xn': {
      'es': 'Finalizar',
      'en': '',
      'pt': '',
    },
  },
  // SuccessPage
  {
    'wxcxwgip': {
      'es': '¡Receta completada!',
      'en': '',
      'pt': '',
    },
    '1u6rhngr': {
      'es': 'Has terminado todos los pasos de esta receta.',
      'en': '',
      'pt': '',
    },
    'iv0wmebp': {
      'es': 'Volver al inicio',
      'en': '',
      'pt': '',
    },
  },
  // CrearCoctel
  {
    'uqkjr60t': {
      'es': 'Crear Cóctel',
      'en': '',
      'pt': '',
    },
    'd2njfw50': {
      'es': 'Haz clic para añadir la imagen\nde tu cóctel',
      'en': '',
      'pt': '',
    },
    '2v96sysl': {
      'es': 'Nombre del Cóctel',
      'en': '',
      'pt': '',
    },
    'ph7o4t3q': {
      'es': 'Ej. Mojito Tropical',
      'en': '',
      'pt': '',
    },
    'y4tlkgpi': {
      'es': 'Descripción',
      'en': '',
      'pt': '',
    },
    'v7s0k4ub': {
      'es': 'Describe tu cóctel...',
      'en': '',
      'pt': '',
    },
    'vtdhff1u': {
      'es': 'Dificultad',
      'en': '',
      'pt': '',
    },
    'lqm55c7e': {
      'es': 'Selecciona la dificultad',
      'en': '',
      'pt': '',
    },
    'hvalc9ia': {
      'es': 'Fácil',
      'en': '',
      'pt': '',
    },
    '7qarwb99': {
      'es': 'Medio',
      'en': '',
      'pt': '',
    },
    'n71veshx': {
      'es': 'Difícil',
      'en': '',
      'pt': '',
    },
    'suhrvylm': {
      'es': 'Categoría',
      'en': '',
      'pt': '',
    },
    'iqer54t3': {
      'es': 'Selecciona la categoría  del cóctel',
      'en': '',
      'pt': '',
    },
    'ghmap2vt': {
      'es': 'Tiempo de preparación',
      'en': '',
      'pt': '',
    },
    '0trcstv6': {
      'es': 'Ej. 15 min',
      'en': '',
      'pt': '',
    },
    'sb006xth': {
      'es': '¿Es alcohólica?',
      'en': '',
      'pt': '',
    },
    '530b8m96': {
      'es': 'Indica si contiene alcohol',
      'en': '',
      'pt': '',
    },
    '9jnpxjk4': {
      'es': 'Continuar',
      'en': '',
      'pt': '',
    },
  },
  // anyadirIngrediente
  {
    'h5hgehz1': {
      'es': 'Ingredientes',
      'en': '',
      'pt': '',
    },
    'a1l52yub': {
      'es': 'Ingrediente',
      'en': '',
      'pt': '',
    },
    'yjq2g26n': {
      'es': 'Ej: Vodka',
      'en': '',
      'pt': '',
    },
    'uym94kvm': {
      'es': 'Cantidad',
      'en': '',
      'pt': '',
    },
    'e0n5pz3i': {
      'es': 'Ej: 50',
      'en': '',
      'pt': '',
    },
    '5dken9nm': {
      'es': 'Unidad',
      'en': '',
      'pt': '',
    },
    'am20x5a7': {
      'es': 'ml / g / oz / cucharadas / al gusto',
      'en': '',
      'pt': '',
    },
    '67bklsmn': {
      'es': 'Añadir ingrediente',
      'en': '',
      'pt': '',
    },
    'jmksszeh': {
      'es': 'Lista de ingredientes',
      'en': '',
      'pt': '',
    },
    '233uck5d': {
      'es': 'items',
      'en': '',
      'pt': '',
    },
    'jajcf722': {
      'es': 'Guardar ingredientes',
      'en': '',
      'pt': '',
    },
    '9ihhckzv': {
      'es': 'Continuar',
      'en': '',
      'pt': '',
    },
  },
  // anyadirPasos
  {
    'md8yjo8k': {
      'es': 'Añadir Pasos',
      'en': '',
      'pt': '',
    },
    '7ocny1n2': {
      'es': 'Descripción del paso',
      'en': '',
      'pt': '',
    },
    'jvbz19qc': {
      'es': 'Escribe el paso…',
      'en': '',
      'pt': '',
    },
    '13xi7lg1': {
      'es': 'Tiempo de cada paso',
      'en': '',
      'pt': '',
    },
    'xchucyw2': {
      'es': 'Escribe el tiempo del paso…',
      'en': '',
      'pt': '',
    },
    'm3w8ynb4': {
      'es': 'Añadir paso',
      'en': '',
      'pt': '',
    },
    'guu1z17b': {
      'es': 'Pasos añadidos',
      'en': '',
      'pt': '',
    },
    '3zt68cwu': {
      'es': 'Paso ',
      'en': '',
      'pt': '',
    },
    'milzhxjz': {
      'es': 'Guardar pasos',
      'en': '',
      'pt': '',
    },
    'j1t9rgqe': {
      'es': 'Finalizar receta',
      'en': '',
      'pt': '',
    },
  },
  // listaDeCocteles
  {
    'z3jc55n4': {
      'es': 'Cócteles',
      'en': '',
      'pt': '',
    },
    'me9c4kxt': {
      'es': 'Descubre tu próxima bebida favorita',
      'en': '',
      'pt': '',
    },
  },
  // Home
  {
    'gbiamgfi': {
      'es': 'Descubre tu cóctel perfecto',
      'en': '',
      'pt': '',
    },
    'gvdh9a74': {
      'es': 'Cóctel del día',
      'en': '',
      'pt': '',
    },
    'tm8rzhg9': {
      'es': 'Categorías',
      'en': '',
      'pt': '',
    },
    'dtbsklvp': {
      'es': 'Tropicales',
      'en': '',
      'pt': '',
    },
    'qwgt7xv3': {
      'es': 'Clásicos',
      'en': '',
      'pt': '',
    },
    'uqixidzx': {
      'es': 'Ácidos',
      'en': '',
      'pt': '',
    },
    'ciwms7mz': {
      'es': 'Dulces',
      'en': '',
      'pt': '',
    },
    '0fgbob86': {
      'es': 'Sin Alcohol',
      'en': '',
      'pt': '',
    },
    '24b43is9': {
      'es': 'Fuertes',
      'en': '',
      'pt': '',
    },
    'ovg4b9oa': {
      'es': 'Explora nuestras recetas',
      'en': '',
      'pt': '',
    },
    'e5h1d7i3': {
      'es': 'min',
      'en': '',
      'pt': '',
    },
    'e9obd0xp': {
      'es': 'Recientes',
      'en': '',
      'pt': '',
    },
    'pg481wri': {
      'es': 'Ver todos',
      'en': '',
      'pt': '',
    },
    '98y4bblb': {
      'es': 'Aperol Spritz',
      'en': '',
      'pt': '',
    },
    '3mnzwqd4': {
      'es': 'Aperol · Prosecco · Soda',
      'en': '',
      'pt': '',
    },
  },
  // Profile
  {
    't3cdqgll': {
      'es': 'Mi Perfil',
      'en': '',
      'pt': '',
    },
    'jvf3vv0n': {
      'es': 'Favoritos',
      'en': '',
      'pt': '',
    },
    'ezn7k0lq': {
      'es': 'Cócteles hechos',
      'en': '',
      'pt': '',
    },
    'x1a2jq6v': {
      'es': 'Editar Perfil',
      'en': '',
      'pt': '',
    },
    'gkjwi8p9': {
      'es': 'Mis Favoritos',
      'en': '',
      'pt': '',
    },
    'a6qbv5av': {
      'es': 'Mis Cócteles',
      'en': '',
      'pt': '',
    },
    'hkodpzpw': {
      'es': 'No has creado aún ninguna receta',
      'en': '',
      'pt': '',
    },
  },
  // GestionRecetaPage
  {
    'trfvnytm': {
      'es': 'Gestión de Receta',
      'en': '',
      'pt': '',
    },
    'fsfoz9ur': {
      'es': 'Descripción',
      'en': '',
      'pt': '',
    },
    'j0kdfnmf': {
      'es': 'Ingredientes',
      'en': '',
      'pt': '',
    },
    '9lsqs88y': {
      'es': '• ',
      'en': '',
      'pt': '',
    },
    '5vcczjjr': {
      'es': 'Preparación',
      'en': '',
      'pt': '',
    },
    'i6ewcc21': {
      'es': '• ',
      'en': '',
      'pt': '',
    },
    'h9kkvtxk': {
      'es': 'Editar receta',
      'en': '',
      'pt': '',
    },
    'ga5zber0': {
      'es': 'Eliminar receta',
      'en': '',
      'pt': '',
    },
  },
  // EditarCoctel
  {
    'zfcvmb0y': {
      'es': 'Editar Cóctel',
      'en': '',
      'pt': '',
    },
    '4fts2bp0': {
      'es': 'Haz clic para añadir la imagen\nde tu cóctel',
      'en': '',
      'pt': '',
    },
    'l23qapsp': {
      'es': 'Nombre del Cóctel',
      'en': '',
      'pt': '',
    },
    '1qd49zqv': {
      'es': 'Ej. Mojito Tropical',
      'en': '',
      'pt': '',
    },
    'b98ssq1e': {
      'es': 'Descripción',
      'en': '',
      'pt': '',
    },
    '8g5g3vu9': {
      'es': 'Describe tu cóctel...',
      'en': '',
      'pt': '',
    },
    'ahkmg7rz': {
      'es': 'Dificultad',
      'en': '',
      'pt': '',
    },
    '282gh8hs': {
      'es': 'Selecciona la dificultad',
      'en': '',
      'pt': '',
    },
    '0nn597nk': {
      'es': 'Fácil',
      'en': '',
      'pt': '',
    },
    '29kpnjun': {
      'es': 'Medio',
      'en': '',
      'pt': '',
    },
    'lfonqlhd': {
      'es': 'Difícil',
      'en': '',
      'pt': '',
    },
    '0fstfp5c': {
      'es': 'Categoría',
      'en': '',
      'pt': '',
    },
    'r4i1z1kk': {
      'es': 'Selecciona la categoría',
      'en': '',
      'pt': '',
    },
    '9gyi67rv': {
      'es': 'Tiempo de preparación',
      'en': '',
      'pt': '',
    },
    '0sqolu7a': {
      'es': 'Ej. 15 min',
      'en': '',
      'pt': '',
    },
    '23kjhk8v': {
      'es': '¿Es alcohólica?',
      'en': '',
      'pt': '',
    },
    'v45rtk3d': {
      'es': 'Indica si contiene alcohol',
      'en': '',
      'pt': '',
    },
    'yza6sw29': {
      'es': 'Guardar y continuar',
      'en': '',
      'pt': '',
    },
  },
  // categoria
  {
    'dm529dlk': {
      'es': 'Cócteles ',
      'en': '',
      'pt': '',
    },
    'f79wjgm0': {
      'es': 'resultados',
      'en': '',
      'pt': '',
    },
  },
  // EditarIngredientes
  {
    '1stuxa2m': {
      'es': 'Editar Ingredientes',
      'en': '',
      'pt': '',
    },
    'buq7w68d': {
      'es': 'Ingrediente',
      'en': '',
      'pt': '',
    },
    'nqg0z95e': {
      'es': 'Ej: Vodka',
      'en': '',
      'pt': '',
    },
    'ufdn2mn4': {
      'es': 'Cantidad',
      'en': '',
      'pt': '',
    },
    '1wwf3qob': {
      'es': 'Ej: 50',
      'en': '',
      'pt': '',
    },
    '8vvv7nvk': {
      'es': 'Unidad',
      'en': '',
      'pt': '',
    },
    '12sd3mv8': {
      'es': 'ml / g / oz / cucharadas / al gusto',
      'en': '',
      'pt': '',
    },
    '1wyx1vwi': {
      'es': 'Añadir ingrediente',
      'en': '',
      'pt': '',
    },
    '9hlf829t': {
      'es': 'Lista de ingredientes',
      'en': '',
      'pt': '',
    },
    '25h456m5': {
      'es': 'items',
      'en': '',
      'pt': '',
    },
    'rwy5heot': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'wikf7jy2': {
      'es': '',
      'en': '',
      'pt': '',
    },
    '9zdicmkg': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'qcibcofg': {
      'es': 'Guardar ingredientes',
      'en': '',
      'pt': '',
    },
    'nggire5f': {
      'es': 'Continuar',
      'en': '',
      'pt': '',
    },
  },
  // Miscellaneous
  {
    '3j4pyonz': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'dkjw52yc': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'e0581uwg': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'coftsa9y': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'uiv5fx1y': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'sgb8634h': {
      'es': '',
      'en': '',
      'pt': '',
    },
    '6iiiauil': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'x8gkckei': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'b8jtsjdp': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'jiy0wvk0': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'kd1h1dn6': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'cascdx39': {
      'es': '',
      'en': '',
      'pt': '',
    },
    '2fcl4ui6': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'wp9inwcq': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'ro7avxbq': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'rcpz0ene': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'ud3xmiih': {
      'es': '',
      'en': '',
      'pt': '',
    },
    '5aayutbt': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'w8q850x2': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'ku7bv74c': {
      'es': '',
      'en': '',
      'pt': '',
    },
    '70xpa1sf': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'qltz33df': {
      'es': '',
      'en': '',
      'pt': '',
    },
    '68zt9sxv': {
      'es': '',
      'en': '',
      'pt': '',
    },
    '0r6netpa': {
      'es': '',
      'en': '',
      'pt': '',
    },
    'pjkbiwyw': {
      'es': '',
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
