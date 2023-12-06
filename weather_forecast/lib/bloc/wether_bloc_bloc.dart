import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forecast/data/my_data.dart';
part 'wether_bloc_event.dart';
part 'wether_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WetherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWether>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(WeatherBlocSuccess(weather));
      } catch (error) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
