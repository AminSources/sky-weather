import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_weather/core/utils/icon_converter.dart';
import 'package:sky_weather/core/utils/time_converter.dart';
import 'package:sky_weather/core/widgets/loading_widget.dart';
import 'package:sky_weather/core/widgets/on_error_widget.dart';
import 'package:sky_weather/core/widgets/txt.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/forecastdays_weather_entity.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/status/fw_status.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/weather_bloc.dart';

class ForecastdaysWidget extends StatelessWidget {
  const ForecastdaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 425,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.fwStatus is FwLoading) {
              return SizedBox(height: 425, child: LoadingWidget());
            } else if (state.fwStatus is FwError) {
              return OnErrorWidget();
            } else if (state.fwStatus is FwCompleted) {
              //* cast
              FwCompleted fwCompleted = state.fwStatus as FwCompleted;

              //* forecastdays weather entity
              List<ForecastdaysWeatherEntity> forecastdaysWeatherEntity =
                  fwCompleted.forecastdaysWeatherEntity;

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* title
                  txt("Forecast 7 days", size: 18, fontWeight: FontWeight.bold),

                  Column(
                    children: List.generate(
                      7,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //* date
                            SizedBox(
                              width: 90,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //* day
                                      txt(
                                        convertUnixTimeToReadableDay(
                                          forecastdaysWeatherEntity[index].dt!,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),

                                      //* date
                                      txt(
                                        convertUnixTimeToReadableMonthDay(
                                          forecastdaysWeatherEntity[index].dt!,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            //* humidity
                            SizedBox(
                              width: 80,
                              child: Row(
                                children: [
                                  //* icon
                                  SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: Image.asset(
                                      "lib/assets/images/humidity_icon.png",
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                    ),
                                  ),

                                  //* humidity percent
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: txt(
                                      "${forecastdaysWeatherEntity[index].humidity}%",
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              width: 95,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //* icon
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset(
                                      "lib/assets/images/${convertMainToPngIcon(forecastdaysWeatherEntity[index].weather![0].main!)}.png",
                                    ),
                                  ),

                                  //* min, max temp
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: txt(
                                      "${forecastdaysWeatherEntity[index].temp!.min.round()}\u00B0 | ${forecastdaysWeatherEntity[index].temp!.max.round()}\u00B0",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
