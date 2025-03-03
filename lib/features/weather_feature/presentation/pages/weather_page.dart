import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sky_weather/core/widgets/loading_widget.dart';
import 'package:sky_weather/core/widgets/on_error_widget.dart';
import 'package:sky_weather/core/widgets/txt.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/current_weather_entity.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/status/cw_status.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/weather_bloc.dart';
import 'package:sky_weather/features/weather_feature/presentation/widgets/air_quality_widget.dart';
import 'package:sky_weather/features/weather_feature/presentation/widgets/app_bar_widget.dart';
import 'package:sky_weather/features/weather_feature/presentation/widgets/drawer_widget.dart';
import 'package:sky_weather/features/weather_feature/presentation/widgets/forecastdays_widget.dart';
import 'package:sky_weather/features/weather_feature/presentation/widgets/search_screen_widget.dart';
import 'package:sky_weather/features/weather_feature/presentation/widgets/sunrise_sunset_widget.dart';
import 'package:sky_weather/features/weather_feature/presentation/widgets/weather_details_widget.dart';
import 'package:sky_weather/features/weather_feature/presentation/widgets/weather_information_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //* get storage
  final box = GetStorage();

  //? init state
  @override
  void initState() {
    super.initState();

    //* load current weather data
    BlocProvider.of<WeatherBloc>(
      context,
    ).add(LoadCwEvent(box.read("cityName") ?? "تبریز"));

    //* load forecastdays weather data
    BlocProvider.of<WeatherBloc>(
      context,
    ).add(LoadFwEvent(box.read("cityName") ?? "تبریز"));

    //* load weather quality data
    BlocProvider.of<WeatherBloc>(
      context,
    ).add(LoadWqEvent(box.read("cityName") ?? "تبریز"));
  }

  @override
  Widget build(BuildContext context) {
    //* focus node
    final FocusNode focusNode = FocusNode();

    // widget tree
    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: Scaffold(
        //* body of page
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //* app bar
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AppBarWidget(focusNode: focusNode),
                ),

                //* weather bloc
                BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state.cwStatus is CwLoading) {
                      //? on loading current weather data
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.75,
                        child: LoadingWidget(),
                      );
                    } else if (state.cwStatus is CwError) {
                      //? on error current weather data
                      return OnErrorWidget();
                    } else if (state.cwStatus is CwCompleted) {
                      //* cast
                      final CwCompleted cwCompleted =
                          state.cwStatus as CwCompleted;

                      //* current weather entity
                      CurrentWeatherEntity currentWeatherEntity =
                          cwCompleted.currentWeatherEntity;

                      //? on completed current weather data
                      return box.read("cityName") == null
                          //* search screen
                          ? Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: const SearchScreenWidget(),
                          )
                          : Column(
                            children: [
                              //* weather details
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                ),
                                child: WeatherDetailsWidget(
                                  currentWeatherEntity: currentWeatherEntity,
                                ),
                              ),

                              //* sunrise and sunset
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 30,
                                ),
                                child: SunriseSunsetWidget(
                                  currentWeatherEntity: currentWeatherEntity,
                                ),
                              ),

                              //* forecastdays weather
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 20,
                                ),
                                child: ForecastdaysWidget(),
                              ),

                              //* weather information
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 20,
                                ),
                                child: WeatherInformationWidget(
                                  currentWeatherEntity: currentWeatherEntity,
                                ),
                              ),

                              //* air quality
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 20,
                                ),
                                child: AirQualityWidget(),
                              ),

                              //* end of page
                              SizedBox(
                                height: 50,
                                child: Center(child: txt("End of screen :)")),
                              ),
                            ],
                          );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),

        //* drawer of page
        drawer: DrawerWidget(),
      ),
    );
  }
}
