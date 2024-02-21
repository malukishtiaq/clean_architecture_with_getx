import '../../constants/otp_status.dart';

abstract class ParseFromDynamic {
  const ParseFromDynamic._();

  static int? toInt({dynamic input}) {
    if (input == null) {
      return 0;
    }

    if (input is String) {
      if (input.isEmpty) {
        return 0;
      }

      return int.tryParse(input);
    }

    if (input is double) {
      input.toInt();
    }

    if (input is int) {
      return input;
    }

    return 0;
  }

  static double toDouble({dynamic input}) {
    if (input == null) {
      return 0;
    }

    if (input is String) {
      final parsed = double.tryParse(input);

      if (parsed == null) {
        return 0;
      }

      return parsed;
    }

    if (input is int) {
      return input.toDouble();
    }

    if (input is double) {
      return input;
    }

    return 0;
  }

  static bool toBool({dynamic input}) {
    if (input == true || input == false) {
      return input as bool;
    }

    if (input is int || input is double) {
      return input == 1;
    }

    if (input == 'False' || input == 'false' || input == '0') {
      return false;
    }

    if (input == 'True' || input == 'true' || input == '1') {
      return true;
    }

    if (input is bool) {
      return input;
    }

    return false;
  }

  static String? parseToString({dynamic input}) {
    if (input == null) {
      return null;
    }

    if (input is int || input is double) {
      return input.toString();
    }

    if (input is String) {
      return input;
    }

    return null;
  }

  static OtpStatus parseToOtpStatus({
    required String input,
  }) {
    switch (input) {
      case 'VALID':
        return OtpStatus.valid;
      default:
        return OtpStatus.invalid;
    }
  }
}
