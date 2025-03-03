import 'package:flutter/material.dart';
import 'package:sky_weather/core/widgets/txt.dart';

class SearchScreenWidget extends StatelessWidget {
  const SearchScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* picture
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset("lib/assets/images/search_city.png"),
        ),

        //* title
        txt("Please search for a city.", size: 20, fontWeight: FontWeight.bold),
      ],
    );
  }
}
