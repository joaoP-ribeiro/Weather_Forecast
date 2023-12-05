import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wether_bloc_event.dart';
part 'wether_bloc_state.dart';

class WetherBlocBloc extends Bloc<WetherBlocEvent, WetherBlocState> {
  WetherBlocBloc() : super(WetherBlocInitial()) {
    on<WetherBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
