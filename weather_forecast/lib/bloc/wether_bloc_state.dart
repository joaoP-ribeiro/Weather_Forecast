part of 'wether_bloc_bloc.dart';

sealed class WetherBlocState extends Equatable {
  const WetherBlocState();
  
  @override
  List<Object> get props => [];
}

final class WetherBlocInitial extends WetherBlocState {}
