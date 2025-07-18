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
      'es': 'Email Address:',
      'en': '',
    },
    'spgedsmy': {
      'es': 'Email Address',
      'en': '',
    },
    'qosu3v3v': {
      'es': 'Nickname:',
      'en': '',
    },
    'kd7q5mbl': {
      'es': 'Nickname',
      'en': '',
    },
    'oe5px983': {
      'es': 'Birthday:',
      'en': '',
    },
    'n2wx762i': {
      'es': 'mm/dd/yyyy',
      'en': '',
    },
    'fehml6yb': {
      'es': 'Password:',
      'en': '',
    },
    'su9rl1op': {
      'es': 'Password',
      'en': '',
    },
    'u8xysqrh': {
      'es': 'Confirm Password:',
      'en': '',
    },
    '8ebn7s1x': {
      'es': 'Confirm Password',
      'en': '',
    },
    'a8s9ap5s': {
      'es': 'Sign Up',
      'en': '',
    },
    'nveey1ei': {
      'es': 'Do you already have an account?',
      'en': '',
    },
    'r6rnbe99': {
      'es': 'Sign In',
      'en': '',
    },
    'l6ns4b0t': {
      'es': 'Sign up',
      'en': '',
    },
    'bqnsaige': {
      'es': 'Home',
      'en': '',
    },
  },
  // HomePage
  {
    '401bi2um': {
      'es': 'Page Title',
      'en': '',
    },
    'jfztf6ry': {
      'es': 'Home',
      'en': '',
    },
  },
  // ReservaCanchaPage
  {
    '0vjcmjce': {
      'es': 'Select...',
      'en': '',
    },
    'jxm2w6bm': {
      'es': 'Search...',
      'en': '',
    },
    'h3oemlo0': {
      'es': 'Option 1',
      'en': '',
    },
    'aimph3to': {
      'es': 'Option 2',
      'en': '',
    },
    'ppwspc54': {
      'es': 'Option 3',
      'en': '',
    },
    'a3o02afl': {
      'es': 'Select...',
      'en': '',
    },
    '4q2uy5ex': {
      'es': 'Search...',
      'en': '',
    },
    'h524yv8o': {
      'es': 'Option 1',
      'en': '',
    },
    'xx3cuxdt': {
      'es': 'Option 2',
      'en': '',
    },
    'pl8op1nu': {
      'es': 'Option 3',
      'en': '',
    },
    'pf3brk9r': {
      'es': 'Reservar',
      'en': '',
    },
    '8l9fedx8': {
      'es': 'Reserva de Canchas',
      'en': 'Recover Password',
    },
    'dqs42ah2': {
      'es': 'Home',
      'en': '',
    },
  },
  // SolicitarImplementosPage
  {
    'lgzo22y9': {
      'es': 'Solicitar Implementos',
      'en': 'Recover Password',
    },
    'ss1ptnxe': {
      'es': 'Home',
      'en': '',
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
      'en': '',
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
      'en': 'SignIn',
    },
    'nuztd9am': {
      'es': 'No tienes cuenta todavia?',
      'en': 'Don\'t you have an account yet?',
    },
    'pdjw48cq': {
      'es': 'Registrarte',
      'en': 'Signup',
    },
    'gea4whqa': {
      'es': 'Olvidaste la contraseña?',
      'en': 'Do you forget the password?',
    },
    'mtw8uf0y': {
      'es': 'Nueva Contraseña',
      'en': 'New Password',
    },
    'r31x266o': {
      'es': 'Iniciar sesión',
      'en': 'Recover Password',
    },
    'mcdnh4we': {
      'es': 'Home',
      'en': '',
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
      'en': 'Send recovery email ',
    },
    'u8r9u9qo': {
      'es': 'Recuperar Contraseña',
      'en': 'Recover Password',
    },
    'fvlx1po7': {
      'es': 'Home',
      'en': '',
    },
  },
  // ReservasReali
  {
    '57qki5e2': {
      'es': 'Reservas Realizadas',
      'en': 'Recover Password',
    },
    'fwjb51ds': {
      'es': 'Home',
      'en': '',
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
