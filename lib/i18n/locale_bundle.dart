/// Definition for all localized strings in application
abstract class LocaleBundle {
  String get homePageTitle;
}

class LocaleBundleEn extends LocaleBundle {
  @override
  String get homePageTitle => "Praetorium";

}