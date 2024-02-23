import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travel/config/constants.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  double longitude;
  double latitude;
  WeatherBlocBloc({required this.latitude, required this.longitude})
      : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory wf =
            WeatherFactory(WEATHER_API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );
        print("---------------------------");
        print(weather.toString());
        emit(WeatherBlocSuccess(weather));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
