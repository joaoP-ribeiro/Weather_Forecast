part of 'wether_bloc_bloc.dart';

sealed class WetherBlocEvent extends Equatable {
  const WetherBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWether extends WetherBlocEvent {
  final Position position;
  const FetchWether(this.position);
  @override
  List<Object> get props => [position];
}
