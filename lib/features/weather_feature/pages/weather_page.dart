import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sky_weather_app/features/weather_feature/api/current_weather_api.dart';
import 'package:sky_weather_app/features/weather_feature/api/forecast_weather_api.dart';
import 'package:sky_weather_app/features/weather_feature/api/weather_quality_api.dart';
import 'package:sky_weather_app/features/weather_feature/models/current_weather_model.dart';
import 'package:sky_weather_app/features/weather_feature/models/forecast_weather_model.dart';
import 'package:sky_weather_app/features/weather_feature/models/weather_quality_model.dart';
import 'package:sky_weather_app/features/weather_feature/widgets/error_widget.dart';
import 'package:sky_weather_app/features/weather_feature/widgets/loading_widget.dart';
import 'package:sky_weather_app/features/weather_feature/widgets/search_widget.dart';
import 'package:sky_weather_app/features/weather_feature/widgets/sunrise_sunset_widget.dart';
import 'package:sky_weather_app/features/weather_feature/widgets/title_widget.dart';
import 'package:sky_weather_app/features/weather_feature/widgets/weather_details_widget.dart';
import 'package:sky_weather_app/features/weather_feature/widgets/weather_forecastdays_widget.dart';
import 'package:sky_weather_app/features/weather_feature/widgets/weather_info_widget.dart';
import 'package:sky_weather_app/features/weather_feature/widgets/weather_quality_progressbar_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<CurrentWeatherModel> currentWeatherFuture;
  late Future<List<ForecastWeatherModel>> forecastWeatherFuture;
  late Future<WeatherQualityModel> weatherQualityFuture;

  TextEditingController controller = TextEditingController();

  final box = GetStorage();

  String cityName = "تبریز";

  @override
  void initState() {
    super.initState();
    currentWeatherFuture = CurrentWeatherApi().getCurrentWeatherData(
      box.read("city") ?? cityName,
    );
    forecastWeatherFuture = ForecastWeatherApi().getForecastWeatherData(
      box.read("city") ?? cityName,
    );
    weatherQualityFuture = WeatherQualityApi().getWeatherQualityData(
      box.read("city") ?? cityName,
    );
  }

  @override
  Widget build(BuildContext context) {
    //* focus node
    FocusNode focusNode = FocusNode();

    // widget tree
    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //* search widget
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SearchWidget(
                    focusNode: focusNode,
                    controller: controller,
                    onTap: () {
                      setState(() {
                        currentWeatherFuture = CurrentWeatherApi()
                            .getCurrentWeatherData(controller.text);
                        forecastWeatherFuture = ForecastWeatherApi()
                            .getForecastWeatherData(controller.text);
                        weatherQualityFuture = WeatherQualityApi()
                            .getWeatherQualityData(controller.text);
                      });

                      //* save city name
                      box.write("city", controller.text);
                    },
                  ),
                ),

                FutureBuilder(
                  future: currentWeatherFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //* return widget
                      return Column(
                        children: [
                          //* weather info
                          SizedBox(
                            width: double.infinity,
                            height: 265,
                            child: WeatherInfoWidget(data: snapshot.data!),
                          ),

                          //* weather details
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 15,
                            ),
                            child: WeatherDetailsWidget(data: snapshot.data!),
                          ),

                          //* sunrise and sunset
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 15,
                            ),
                            child: SunriseSunsetWidget(data: snapshot.data!),
                          ),

                          //* weather forecast days
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 5,
                              top: 25,
                            ),
                            child: TitleWidget(title: "Forecast"),
                          ),

                          FutureBuilder(
                            future: forecastWeatherFuture,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return WeatherForecastdaysWidget(
                                  data: snapshot.data!,
                                );
                              } else if (snapshot.hasError) {
                                return FutureErrorWidget(
                                  serviceName: "Forecast",
                                );
                              } else {
                                return LoadingWidget(isSmallWidget: true);
                              }
                            },
                          ),

                          //* weather quality
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 25,
                              top: 25,
                            ),
                            child: TitleWidget(title: "Weather Quality"),
                          ),

                          FutureBuilder(
                            future: weatherQualityFuture,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return WeatherQualityProgressbarWidget(
                                  data: snapshot.data!,
                                );
                              } else if (snapshot.hasError) {
                                return FutureErrorWidget(
                                  serviceName: "Weather Quality",
                                );
                              } else {
                                return LoadingWidget(isSmallWidget: true);
                              }
                            },
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return FutureErrorWidget(serviceName: "Current Weather");
                    } else {
                      return LoadingWidget();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
