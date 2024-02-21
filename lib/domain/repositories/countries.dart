import 'dart:convert';

import 'package:get/get.dart';

import '../../app/tools/functions/api.dart';
import '../../data/external/countries/list.dart';
import '../entities/countries.dart';
import '../use_cases/countries.dart';

class CountriesRepository extends GetxController {
  factory CountriesRepository() {
    if (Get.isRegistered<CountriesRepository>()) {
      return Get.find<CountriesRepository>();
    } else {
      return Get.put(CountriesRepository._(), permanent: true);
    }
  }

  CountriesRepository._();

  Rx<CountriesEntity> countriesObs = const CountriesUseCase().obs;

  final _externalCountriesApi = ExternalCountriesList();

  Future<bool?> getCountries({
    String? searchString,
  }) async {
    return _externalCountriesApi
        .getCountries(
      searchString: searchString,
    )
        .call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          countriesObs.value = CountriesUseCase.fromJson(
            jsonDecode(response.body),
          );
        }
        return isSuccess;
      },
      forceCall: true,
    );
  }
}
