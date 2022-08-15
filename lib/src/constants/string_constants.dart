import 'package:base_project/main.dart';
import 'package:base_project/src/app_cubit/app_cubit.dart';
import 'package:base_project/src/constants/language_constant/english.dart';
import 'package:base_project/src/constants/language_constant/urdu.dart';
import 'package:base_project/src/services/translation_srevice.dart';

class StringConstants {
  static String get appName => _getLang('appName');
  static String get loginExpired => _getLang('loginExpired');
  static String get loading => _getLang('loading');
  static String get errorNameShouldContainOnlyAlphabets =>
      _getLang('errorNameShouldContainOnlyAlphabets');
  static String get errorPleaseEnterYour => _getLang('errorPleaseEnterYour');
  static String get characters => _getLang('characters');
  static String get pleaseEnterAtLeast => _getLang('pleaseEnterAtLeast');
  static String get errorLengthElevenError =>
      _getLang('errorLengthElevenError');
  static String get errorThisFieldCantBeEmpty =>
      _getLang('errorThisFieldCantBeEmpty');
  static String get errorInvalidPhone => _getLang('errorInvalidPhone');
  static String get errorMinLengthPassword =>
      _getLang('errorMinLengthPassword');
  static String get errorInvalidEmail => _getLang('errorInvalidEmail');

  static String get errorInvalidPasswordFormat =>
      _getLang('errorInvalidPasswordFormat');
  static String get errorEmailLengthShouldBeSixtyCharactersOrLess =>
      _getLang('errorEmailLengthShouldBeSixtyCharactersOrLess');
  static String get errSomethingWentWrong => _getLang('errSomethingWentWrong');
  static String get update => _getLang('update');
  static String get cancel => _getLang('cancel');
  static String get confirm => _getLang('confirm');
  static String get mediaSelection => _getLang('mediaSelection');
  static String get gallery => _getLang('gallery');
  static String get camera => _getLang('camera');

  static String _getLang(String s) {
    if (getIt<TranslationService>().isUrdu()) {
      return UrduConstant.urduLabels[s] ?? '';
    }
    return EnglishConstant.englishLabels[s] ?? '';
  }
}
