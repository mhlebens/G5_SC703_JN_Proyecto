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

  static List<String> languages() => ['es', 'en'];

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
  }) =>
      [esText, enText][languageIndex] ?? '';

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
  // SignupPage
  {
    'dfd1xovg': {
      'es': 'Correo Electrónico:',
      'en': 'Email Address:',
    },
    'spgedsmy': {
      'es': 'Correo Electrónico',
      'en': 'Email Address',
    },
    'qosu3v3v': {
      'es': 'Apodo:',
      'en': 'Nickname:',
    },
    'kd7q5mbl': {
      'es': 'Apodo',
      'en': 'Nickname',
    },
    'oe5px983': {
      'es': 'Fecha Nacimiento:',
      'en': 'Birthday:',
    },
    'n2wx762i': {
      'es': 'mm/dd/yyyy',
      'en': 'mm/dd/yyyy',
    },
    'fehml6yb': {
      'es': 'Contraseña:',
      'en': 'Password:',
    },
    'su9rl1op': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'u8xysqrh': {
      'es': 'Confirmar Contraseña:',
      'en': 'Confirm Password:',
    },
    '8nhau7xp': {
      'es': 'Confirmar Contraseña',
      'en': '',
    },
    'a8s9ap5s': {
      'es': 'Registrar',
      'en': 'Sign Up',
    },
    'nveey1ei': {
      'es': '¿Ya tienes una cuenta?',
      'en': 'Do you already have an account?',
    },
    'r6rnbe99': {
      'es': 'Iniciar Sesión',
      'en': 'Sign In',
    },
    'l6ns4b0t': {
      'es': 'Registrarse',
      'en': 'Sign Up',
    },
    'bqnsaige': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // HomePage
  {
    '401bi2um': {
      'es': 'Page Title',
      'en': 'Page Title',
    },
    'jfztf6ry': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // ReservaCanchaPage
  {
    'wtcfuaqh': {
      'es': '',
      'en': '',
    },
    '0vjcmjce': {
      'es': 'Select...',
      'en': 'Select...',
    },
    'jxm2w6bm': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'h3oemlo0': {
      'es': '08:00 AM',
      'en': '08:00 AM',
    },
    'aimph3to': {
      'es': '09:00 AM',
      'en': '09:00 AM',
    },
    'ppwspc54': {
      'es': '10:00 AM',
      'en': '10:00 AM',
    },
    'a3o02afl': {
      'es': 'Select...',
      'en': 'Select...',
    },
    '4q2uy5ex': {
      'es': 'Search...',
      'en': 'Search...',
    },
    'h524yv8o': {
      'es': 'Cancha de Fulbol 1',
      'en': 'Soccer Field 1',
    },
    'xx3cuxdt': {
      'es': 'Cancha de Fulbol 2',
      'en': 'Soccer Field 2',
    },
    'pl8op1nu': {
      'es': 'Cancha de Basketball 3',
      'en': 'Basketball Court 3',
    },
    'u3i11175': {
      'es': 'Selecciona implementos deportivos',
      'en': 'Select sports equipment',
    },
    '5jj5tti7': {
      'es': 'Balón de fútbol',
      'en': 'Soccer ball',
    },
    'z86m6i4i': {
      'es': 'Balón de basquetball\n',
      'en': 'Basketball',
    },
    'pf3brk9r': {
      'es': 'Reservar',
      'en': 'Reserve',
    },
    '8l9fedx8': {
      'es': 'Reserva de Canchas',
      'en': 'Court Reservation',
    },
    'dqs42ah2': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // SignIn
  {
    'ks9i9tj5': {
      'es': 'Correo Electrónico',
      'en': 'Email',
    },
    'ueeyayiu': {
      'es': 'Correo Electrónico',
      'en': 'Email',
    },
    '7zfh4e4o': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'p1lv52a4': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '6t144ncf': {
      'es': 'Iniciar Sesión',
      'en': 'Login',
    },
    'nuztd9am': {
      'es': 'No tienes cuenta todavia?',
      'en': 'Don\'t have an account yet?',
    },
    'pdjw48cq': {
      'es': 'Registrarte',
      'en': 'Register',
    },
    'gea4whqa': {
      'es': 'Olvidaste la contraseña?',
      'en': 'Forgot your password?',
    },
    'mtw8uf0y': {
      'es': 'Nueva Contraseña',
      'en': 'New Password',
    },
    'z6cfljwf': {
      'es': 'Iniciar sesión',
      'en': 'Login',
    },
    'vjxa2za5': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // ResetPassword
  {
    'yrsm76s6': {
      'es': 'Correo Electrónico',
      'en': 'Email',
    },
    't0dyxygl': {
      'es': 'Correo Electrónico',
      'en': 'Email',
    },
    'tbw6846f': {
      'es': 'Enviar correo de recuperación',
      'en': 'Send recovery email',
    },
    'ymky6iep': {
      'es': 'Recuperar Contraseña',
      'en': 'Recover Password',
    },
    'iqu6hoyz': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // ReservasReali
  {
    'w67neuji': {
      'es': 'Reservas Realizadas',
      'en': 'Reservations Made',
    },
    '4ddaxpxm': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // MisReservasPage
  {
    'w0ulhm7d': {
      'es': 'Mis Reservas',
      'en': 'Court Reservation',
    },
    'ss1ptnxe': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Miscellaneous
  {
    'ds611aax': {
      'es': '',
      'en': '',
    },
    'blotaokl': {
      'es': '',
      'en': '',
    },
    'h0zctnrp': {
      'es': '',
      'en': '',
    },
    'e76cp933': {
      'es': '',
      'en': '',
    },
    'w02f6pux': {
      'es': '',
      'en': '',
    },
    'r69zv3dm': {
      'es': '',
      'en': '',
    },
    'xvwks4k1': {
      'es': '',
      'en': '',
    },
    'sdyub7cm': {
      'es': '',
      'en': '',
    },
    'y611pz31': {
      'es': '',
      'en': '',
    },
    'mwd2xpxc': {
      'es': '',
      'en': '',
    },
    '15jozz6m': {
      'es': '',
      'en': '',
    },
    'jbbpkrap': {
      'es': '',
      'en': '',
    },
    'una4juz1': {
      'es': '',
      'en': '',
    },
    'ntpjmr5w': {
      'es': '',
      'en': '',
    },
    '3n9ben5n': {
      'es': '',
      'en': '',
    },
    '721zqb32': {
      'es': '',
      'en': '',
    },
    '0u0c55sa': {
      'es': '',
      'en': '',
    },
    'tg2qpn5a': {
      'es': '',
      'en': '',
    },
    '6ol89guh': {
      'es': '',
      'en': '',
    },
    'vhnxm3g2': {
      'es': '',
      'en': '',
    },
    'slty622u': {
      'es': '',
      'en': '',
    },
    'iunmifs5': {
      'es': '',
      'en': '',
    },
    '0pq8ha5c': {
      'es': '',
      'en': '',
    },
    'lsn5rhyy': {
      'es': '',
      'en': '',
    },
    'k68mvdwo': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
