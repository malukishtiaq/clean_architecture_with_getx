import '../../app/tools/util/parse_from_dynamic.dart';
import '../entities/phone_number.dart';

class PhoneNumberUseCase extends PhoneNumberEntity {
  const PhoneNumberUseCase({
    super.type,
    super.e164,
    super.international,
    super.national,
    super.countryCode,
    super.regionCode,
    super.nationalNumber,
  });

  factory PhoneNumberUseCase.fromJson(Map<String, dynamic> json) =>
      PhoneNumberUseCase(
        type: ParseFromDynamic.parseToString(input: json['type']),
        e164: ParseFromDynamic.parseToString(input: json['e164']),
        international:
            ParseFromDynamic.parseToString(input: json['international']),
        national: ParseFromDynamic.parseToString(input: json['national']),
        countryCode:
            ParseFromDynamic.parseToString(input: json['country_code']),
        regionCode: ParseFromDynamic.parseToString(input: json['region_code']),
        nationalNumber:
            ParseFromDynamic.parseToString(input: json['national_number']),
      );

  @override
  PhoneNumberEntity copyWith({
    final String? type,
    final String? e164,
    final String? international,
    final String? national,
    final String? countryCode,
    final String? regionCode,
    final String? nationalNumber,
  }) {
    return PhoneNumberUseCase(
      type: type ?? super.type,
      e164: e164 ?? super.e164,
      international: international ?? super.international,
      national: national ?? super.national,
      countryCode: countryCode ?? super.countryCode,
      regionCode: regionCode ?? super.regionCode,
      nationalNumber: nationalNumber ?? super.nationalNumber,
    );
  }
}
