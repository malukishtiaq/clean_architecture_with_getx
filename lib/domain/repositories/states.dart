import 'dart:convert';
import 'package:get/get.dart';
import '../../app/tools/functions/api.dart';
import '../../data/external/states/states.dart';
import '../entities/states.dart';
import '../use_cases/states.dart';

class StatesRepository extends GetxController {
  factory StatesRepository() {
    if (Get.isRegistered<StatesRepository>()) {
      return Get.find<StatesRepository>();
    } else {
      return Get.put(StatesRepository._(), permanent: true);
    }
  }

  StatesRepository._();

  Rx<StatesEntity> statesObs = const StatesUseCase().obs;

  final _getStates = ExternalStatesList();

  Future<bool?> getStates() async {
    return _getStates.getStates().call(
      (response) {
        final isSuccess = isSuccessResponse(response);

        if (isSuccess) {
          statesObs.value = StatesUseCase.fromJson(
            jsonDecode(response.body),
          );
          return true;
        }
        return false;
      },
      forceCall: true,
    );
  }
}
