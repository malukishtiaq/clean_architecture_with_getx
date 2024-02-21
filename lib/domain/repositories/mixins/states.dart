import 'package:get/get.dart';

import '../../entities/states.dart';
import '../states.dart';

mixin StatesMixin {
  final _statesRepository = StatesRepository();

  Rx<StatesEntity> get statesObs => _statesRepository.statesObs;

  Future<bool?> Function() get getStatesList => _statesRepository.getStates;
}
