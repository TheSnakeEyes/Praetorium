import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:praetorium/i18n/locale_bundle.dart';

class Localization {
  Localization(this.locale);

  final Locale locale;

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  static Map<String, LocaleBundle> _localizedValues = {
    'en': LocaleBundleEn(),
  };

  LocaleBundle get bundle {
    return _localizedValues[locale.languageCode];
  }
}


class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  static const List<Locale> supportedLocales = [Locale('en')];

  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => supportedLocales.map((e) => e.languageCode).contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) {
    return SynchronousFuture<Localization>(Localization(locale));
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}
