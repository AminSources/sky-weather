import 'package:flutter/material.dart';
import 'package:sky_weather/core/constants/colors.dart';
import 'package:sky_weather/core/widgets/txt.dart';

class OnErrorWidget extends StatelessWidget {
  const OnErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //* warning icon
          Icon(Icons.warning_rounded, color: redColor, size: 30),

          //* text
          txt("Couldn't load weather Data."),
        ],
      ),
    );
  }
}
