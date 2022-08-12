

import 'package:base_project/src/constants/string_constants.dart';

class ValidationService {
  static const _passwordMinLen8WithNumbers =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  static const String _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const _numberPattern = r'^[0-9]*$';
  static const _textPattern = r'^[A-Za-z]+$';

  static bool _isEmailValid(String email) {
    final regexEmail = RegExp(_emailPattern);
    return regexEmail.hasMatch(email);
  }

  static bool _isNumberValid(String number) {
    final regexPhone = RegExp(_numberPattern);
    return regexPhone.hasMatch(number);
  }

  static bool _validate(String password, String pattern) {
    final regexPassword = RegExp(pattern);
    return regexPassword.hasMatch(password);
  }

  static String? validateEmail(
    String email, {
    String? errorMessage,
    String? fieldName,
  }) {
    if (email.isEmpty) {
      return StringConstants.errorThisFieldCantBeEmpty;
    } else if (email.length > 60) {
      return StringConstants.errorEmailLengthShouldBeSixtyCharactersOrLess;
    } else if (_isEmailValid(email)) {
      return null;
    } else {
      return errorMessage ?? StringConstants.errorInvalidEmail;
    }
  }

  static String? validatePassword(
    String password, {
    String? errorMessage,
    String? fieldName,
  }) {
    if (password.isEmpty) {
      return StringConstants.errorThisFieldCantBeEmpty;
    } else if (password.length < 5) {
      return StringConstants.errorMinLengthPassword;
    } else if (!_validate(password, _passwordMinLen8WithNumbers)) {
      return StringConstants.errorInvalidPasswordFormat;
    } else {
      return null;
    }
  }

  static String? validatePhone(
    String number, {
    String? errorMessage,
    required String? fieldName,
  }) {
    if (number.isEmpty) {
      return '${StringConstants.errorPleaseEnterYour} $fieldName';
    } else if (number.length != 11) {
      return StringConstants.errorLengthElevenError;
    } else if (_isNumberValid(number) == true) {
      return null;
    } else {
      return errorMessage ?? StringConstants.errorInvalidPhone;
    }
  }

  static String? validateEmptyField(
    String controller, {
    String? errorMessage,
    bool check11CharLength = false,
  }) {
    if (controller.isEmpty) {
      if (errorMessage != null) {
        return errorMessage;
      } else {
        return StringConstants.errorThisFieldCantBeEmpty;
      }
    } else if (controller.length != 11 && check11CharLength) {
      return StringConstants.errorLengthElevenError;
    }
    return null;
  }

  static String? validateConfirmPassword({
    required String? password,
    required String? confirmPass,
    required String? fieldName,
    required String? confirmPasswordMessage,
  }) {
    if (password!.isEmpty) {
      return '${StringConstants.errorPleaseEnterYour} $fieldName';
    } else if (confirmPass != password) {
      return confirmPasswordMessage!;
    } else {
      return null;
    }
  }

  static String? validateMinLength({
    required String value,
    required int minLength,
  }) {
    if (value.isEmpty) {
      return StringConstants.errorPleaseEnterYour;
    } else if (value.length < minLength) {
      return '${StringConstants.pleaseEnterAtLeast} '
          '$minLength ${StringConstants.characters}';
    } else {
      return null;
    }
  }

  static String? validateText(
    String value, {
    required String fieldName,
  }) {
    if (value.isEmpty) {
      return '${StringConstants.errorPleaseEnterYour} $fieldName';
    } else if (!_validate(value, _textPattern)) {
      return StringConstants.errorNameShouldContainOnlyAlphabets;
    } else {
      return null;
    }
  }
}
