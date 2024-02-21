abstract class PhoneNumberEntity {
  const PhoneNumberEntity({
    this.type,
    this.e164,
    this.international,
    this.national,
    this.countryCode,
    this.regionCode,
    this.nationalNumber,
  });

  final String? type;
  final String? e164;
  final String? international;
  final String? national;
  final String? countryCode;
  final String? regionCode;
  final String? nationalNumber;

  PhoneNumberEntity copyWith({
    final String? type,
    final String? e164,
    final String? international,
    final String? national,
    final String? countryCode,
    final String? regionCode,
    final String? nationalNumber,
  });
}
