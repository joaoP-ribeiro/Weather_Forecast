import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/bloc/wether_bloc_bloc.dart';
import 'package:weather_forecast/components/blur_decoration.dart';
import 'package:weather_forecast/components/status_view.dart';

class HomeScrenn extends StatefulWidget {
  const HomeScrenn({super.key});
  @override
  State<HomeScrenn> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScrenn> {
  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/1.png');
      case >= 300 && < 400:
        return Image.asset('assets/2.png');
      case >= 500 && < 600:
        return Image.asset('assets/3.png');
      case >= 600 && < 700:
        return Image.asset('assets/4.png');
      case >= 700 && < 800:
        return Image.asset('assets/5.png');
      case == 800:
        return Image.asset('assets/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/7.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context)
              .size
              .height, // define o sizeBox como o tamanho da tela total
          child: Stack(
            children: [
              BlurDecoration(
                  position: 1,
                  height: 200,
                  top: -0.3,
                  width: 200,
                  color: Colors.cyanAccent),
              BlurDecoration(
                  position: -1,
                  height: 200,
                  top: -0.3,
                  width: 200,
                  color: Colors.cyanAccent),
              BlurDecoration(
                  position: 0,
                  height: 300,
                  top: -1.3,
                  width: 800,
                  color: Colors.orangeAccent),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  )),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    return SizedBox(
                      width: MediaQuery.of(context)
                          .size
                          .width, // largura total da tela
                      height: MediaQuery.of(context)
                          .size
                          .height, // autura total da tela
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // alinha os itens da coluna a esquerda
                        children: [
                          Text('${state.weather.areaName}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Hello João, See today's forecast",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Center(
                            child: Text(
                              '${state.weather.weatherMain!.toUpperCase()}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Text(
                              DateFormat('EEEE dd :')
                                  .add_jm()
                                  .format(state.weather.date!),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, 40.0, 0, 0), // Margens específicas
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                StatusView(
                                  img: 'assets/11.png',
                                  title: 'Sunrise',
                                  status: DateFormat()
                                      .add_jm()
                                      .format(state.weather.sunrise!),
                                ),
                                StatusView(
                                    img: 'assets/12.png',
                                    title: 'Sunset',
                                    status: DateFormat()
                                        .add_jm()
                                        .format(state.weather.sunset!)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, 50.0, 0, 0), // Margens específicas
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                StatusView(
                                    img: 'assets/13.png',
                                    title: 'Temp Max',
                                    status:
                                        '${state.weather.tempMax!.celsius!.round()}°C'),
                                StatusView(
                                    img: 'assets/14.png',
                                    title: 'Temp Min',
                                    status:
                                        '${state.weather.tempMin!.celsius!.round()}°C'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
