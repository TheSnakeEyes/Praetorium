/// Definition for all localized strings in application
abstract class LocaleBundle {
  String get homePageTitle;
  String get delete;
  String get edit;
  String get pointsShortcut;
}

class LocaleBundleEn extends LocaleBundle {
  @override
  String get homePageTitle => 'Praetorium';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get pointsShortcut => 'pts';

}