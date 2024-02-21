import '../entities/state.dart';
import '../entities/states.dart';
import 'state.dart';

class StatesUseCase extends StatesEntity {
  const StatesUseCase({
    super.states,
  });

  factory StatesUseCase.fromJson(Map<String, dynamic> json) {
    final _allStates = (json['StatesList'] as List<dynamic>)
        .map(
          (state) => StateUseCase.fromJson(state as Map<String, dynamic>),
        )
        .toList();

    return StatesUseCase(states: _allStates);
  }

  @override
  StatesEntity copyWith({
    final List<StateEntity>? states,
  }) {
    return StatesUseCase(
      states: states ?? super.states,
    );
  }
}
