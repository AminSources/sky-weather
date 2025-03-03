import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sky_weather/core/constants/colors.dart';
import 'package:sky_weather/features/weather_feature/presentation/bloc/weather_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AppBarWidget extends StatelessWidget {
  final FocusNode focusNode;
  const AppBarWidget({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    //* text controllers
    final TextEditingController searchController = TextEditingController();

    // widget tree
    return Row(
      children: [
        //* menu button
        CircleAvatar(
          radius: 25,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Center(
            child: IconButton(
              onPressed: () {
                //? open drawer
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu_rounded, color: greyColor),
            ),
          ),
        ),

        //* search bar
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 50,
              child: TextField(
                controller: searchController,
                focusNode: focusNode,
                style: TextStyle(fontFamily: "vazir"),
                decoration: InputDecoration(hintText: "Search location"),
                onSubmitted: (value) {
                  //? search location
                  searchLocation(context, searchController);
                },
              ),
            ),
          ),
        ),

        //* menu button
        CircleAvatar(
          radius: 25,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: Center(
            child: IconButton(
              onPressed: () {
                //? search location
                searchLocation(context, searchController);
              },
              icon: Icon(Icons.search_rounded, color: greyColor),
            ),
          ),
        ),
      ],
    );
  }

  //? on tap search button
  void searchLocation(context, searchController) {
    //* get storage
    final box = GetStorage();

    if (searchController.text.isNotEmpty) {
      //* load current weather data
      BlocProvider.of<WeatherBloc>(
        context,
      ).add(LoadCwEvent(searchController.text));

      //* load forecastdays weather data
      BlocProvider.of<WeatherBloc>(
        context,
      ).add(LoadFwEvent(searchController.text));

      //* load weather quality data
      BlocProvider.of<WeatherBloc>(
        context,
      ).add(LoadWqEvent(searchController.text));

      //* save city name
      box.write("cityName", searchController.text);
    } else {
      //? show snackbar
      showTopSnackBar(
        Overlay.of(context),
        displayDuration: Duration(milliseconds: 400),
        CustomSnackBar.error(
          message: "Please enter a valid location to search for weather",
        ),
      );
    }
  }
}
