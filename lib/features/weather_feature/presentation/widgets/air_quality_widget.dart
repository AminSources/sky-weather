import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_weather/core/constants/colors.dart';
import 'package:sky_weather/core/utils/aqi_progressbar_color_converter.dart';
import 'package:sky_weather/core/utils/aqi_status_converter.dart';
import 'package:sky_weather/core/widgets/loading_widget.dart';
import 'package:sky_weather/core/widgets/on_error_widget.dart';
import 'package:sky_weather/core/widgets/txt.dart';
import 'package:sky_weather/features/weather_feature/domain/entities/weather_quality_entity.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/status/wq_status.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/weather_bloc.dart';

class AirQualityWidget extends StatelessWidget {
  const AirQualityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.wqStatus is WqLoading) {
              return SizedBox(height: 135, child: LoadingWidget());
            } else if (state.wqStatus is WqError) {
              return OnErrorWidget();
            } else if (state.wqStatus is WqCompleted) {
              //* cast
              WqCompleted wqCompleted = state.wqStatus as WqCompleted;

              //* weather quality entity
              WeatherQualityEntity weatherQualityEntity =
                  wqCompleted.weatherQualityEntity;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //* title
                  txt("Air Quality", size: 18, fontWeight: FontWeight.bold),

                  //* aqi
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: txt(
                      "${weatherQualityEntity.data!.aqi} AQI - ${convertAqitoStatus(weatherQualityEntity.data!.aqi!)}",
                      size: 20,
                    ),
                  ),

                  //* quality bar
                  Expanded(
                    child: Row(
                      children: [
                        //* air quality
                        Container(
                          width: weatherQualityEntity.data!.aqi!.toDouble(),
                          height: 3,
                          decoration: BoxDecoration(
                            color: weatherQualityProgressBarColor(
                              weatherQualityEntity.data!.aqi!,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        //* empty bar
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Container(
                              height: 2,
                              decoration: BoxDecoration(
                                color: greyColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
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
