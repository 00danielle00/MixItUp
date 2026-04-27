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
  // cocktailHome
  {
    'guwqijwj': {
      'es': 'Descubre tu cóctel perfecto',
      'en': '',
      'pt': '',
    },
    '8lu0ju06': {
      'es': 'Explora nuestra colección de recetas clásicas y modernas',
      'en': '',
      'pt': '',
    },
    'yz7rl1w4': {
      'es': 'Buscar cócteles, ingredientes...',
      'en': '',
      'pt': '',
    },
    'aii2m5y6': {
      'es': 'Margarita Premium',
      'en': '',
      'pt': '',
    },
    '6egd7gy7': {
      'es': 'Tequila premium, cointreau, lima fresca',
      'en': '',
      'pt': '',
    },
    '7rvwfyzv': {
      'es': '4.9',
      'en': '',
      'pt': '',
    },
    'bs1b5hd7': {
      'es': '10 min',
      'en': '',
      'pt': '',
    },
    '0lz85vfi': {
      'es': 'Piña Colada',
      'en': '',
      'pt': '',
    },
    'tvto2n2i': {
      'es': 'Ron blanco, crema de coco, piña natural',
      'en': '',
      'pt': '',
    },
    '144x6qvu': {
      'es': '4.7',
      'en': '',
      'pt': '',
    },
    'b95k9o2p': {
      'es': '12 min',
      'en': '',
      'pt': '',
    },
    'vn65ijn7': {
      'es': 'Cóctel del día',
      'en': '',
      'pt': '',
    },
    'izueaxle': {
      'es': '8 min',
      'en': '',
      'pt': '',
    },
    'dktdh8s8': {
      'es': 'Medio',
      'en': '',
      'pt': '',
    },
    'vfi5e7kt': {
      'es': 'Ver receta',
      'en': '',
      'pt': '',
    },
    'uroawwsm': {
      'es': 'Recetas populares',
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
  // Perfil
  {
    'q188yi21': {
      'es': 'Mi Perfil',
      'en': '',
      'pt': '',
    },
    'tlxklx1d': {
      'es': '127',
      'en': '',
      'pt': '',
    },
    'w6i4xon3': {
      'es': 'RECETAS',
      'en': '',
      'pt': '',
    },
    'jkzdfjkm': {
      'es': '2.4K',
      'en': '',
      'pt': '',
    },
    'kntax4cl': {
      'es': 'SEGUIDORES',
      'en': '',
      'pt': '',
    },
    'hngmn2tp': {
      'es': '89',
      'en': '',
      'pt': '',
    },
    'yt34datf': {
      'es': 'SIGUIENDO',
      'en': '',
      'pt': '',
    },
    'lutda63r': {
      'es': 'Editar Perfil',
      'en': '',
      'pt': '',
    },
    'lotahsgl': {
      'es': 'Compartir',
      'en': '',
      'pt': '',
    },
    '91a216pj': {
      'es': 'Especialidades',
      'en': '',
      'pt': '',
    },
    'zmgco59p': {
      'es': 'Cócteles Clásicos',
      'en': '',
      'pt': '',
    },
    'fgbpj9to': {
      'es': 'Mixología',
      'en': '',
      'pt': '',
    },
    'fvmmubm1': {
      'es': 'Cócteles Tropicales',
      'en': '',
      'pt': '',
    },
    'k50jrpmi': {
      'es': 'Gin & Tonic',
      'en': '',
      'pt': '',
    },
    '12kxdpfh': {
      'es': 'Logros',
      'en': '',
      'pt': '',
    },
    '7ilbaaql': {
      'es': 'Mixólogo',
      'en': '',
      'pt': '',
    },
    'jn79ft94': {
      'es': '100 Me Gusta',
      'en': '',
      'pt': '',
    },
    'b5kq97eb': {
      'es': 'Influencer',
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
    'ze0k59ce': {
      'es': 'PREFERENCIAS',
      'en': '',
      'pt': '',
    },
    'npzfedx2': {
      'es': 'Modo oscuro',
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
  // pepelu
  {
    'ywzfs4lr': {
      'es': 'Cócteles',
      'en': '',
      'pt': '',
    },
    'sghxjrax': {
      'es': 'Descubre nuestra selección de cócteles artesanales',
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
      'es': 'Anterior',
      'en': '',
      'pt': '',
    },
    'vjj33lif': {
      'es': 'Siguiente',
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
    'jnwagdek': {
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
    'ghmap2vt': {
      'es': 'Tiempo de preparación',
      'en': '',
      'pt': '',
    },
    '0trcstv6': {
      'es': 'Ej. 15 minutos',
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
      'es': 'ml / g / oz',
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
    '5njn1qqk': {
      'es':
          'Mezclar todos los ingredientes en una coctelera con hielo durante 30 segundos.',
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
  // ingedientItem
  {
    '6ssflcdo': {
      'es': '1',
      'en': '',
      'pt': '',
    },
    'c21hcfo4': {
      'es': 'Ingrediente',
      'en': '',
      'pt': '',
    },
    'y015bx41': {
      'es': 'Nombre del ingrediente (ej. Harina)',
      'en': '',
      'pt': '',
    },
    'imlwtn8r': {
      'es': 'Cantidad',
      'en': '',
      'pt': '',
    },
    'd5nqf6az': {
      'es': 'Unidad (ej. gr, ml)',
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
