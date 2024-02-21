import 'state.dart';

abstract class StatesEntity {
  const StatesEntity({
    this.states,
  });

  final List<StateEntity>? states;

  StatesEntity copyWith({
    final List<StateEntity>? states,
  });
}
