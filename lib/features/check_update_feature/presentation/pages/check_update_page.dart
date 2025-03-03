import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_weather/core/widgets/loading_widget.dart';
import 'package:sky_weather/core/widgets/on_error_widget.dart';
import 'package:sky_weather/features/check_update_feature/domain/entities/check_update_entity.dart';
import 'package:sky_weather/features/check_update_feature/presentation/bloc/check_update_bloc.dart';
import 'package:sky_weather/features/check_update_feature/presentation/bloc/status/cu_status.dart';
import 'package:sky_weather/features/check_update_feature/presentation/widgets/update_widget.dart';
import 'package:sky_weather/features/weather_feature/presentation/pages/weather_page.dart';

class CheckUpdatePage extends StatefulWidget {
  const CheckUpdatePage({super.key});

  @override
  State<CheckUpdatePage> createState() => _CheckUpdatePageState();
}

class _CheckUpdatePageState extends State<CheckUpdatePage> {
  //? init state
  @override
  void initState() {
    super.initState();

    //* call check update
    BlocProvider.of<CheckUpdateBloc>(context).add(LoadCuEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocBuilder<CheckUpdateBloc, CheckUpdateState>(
          builder: (context, state) {
            if (state.cuStatus is CuLoading) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: LoadingWidget(),
              );
            } else if (state.cuStatus is CuError) {
              return OnErrorWidget();
            } else if (state.cuStatus is CuCompleted) {
              //* cast
              CuCompleted cuCompleted = state.cuStatus as CuCompleted;

              //* check update entity
              CheckUpdateEntity checkUpdateEntity =
                  cuCompleted.checkUpdateEntity;

              if (checkUpdateEntity.version! != "03.12.13.2") {
                return UpdateWidget();
              } else {
                return WeatherPage();
              }
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
