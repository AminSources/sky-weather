import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/constants/colors.dart';
import 'package:sky_weather_app/core/widgets/txt.dart';

class FutureErrorWidget extends StatelessWidget {
  final String serviceName;
  const FutureErrorWidget({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135,
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: lightGreyColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* title
          Row(
            children: [
              //* icon
              Icon(Icons.error_rounded, color: redColor),

              //* text
              txt("ERROR!", color: redColor),
            ],
          ),

          SizedBox(height: 10),

          //* error description
          txt(
            "$serviceName unavailable in your city or Couldn't load data",
            size: 13,
          ),

          SizedBox(height: 5),

          //* fix ways
          txt("- check your city name and try again.", size: 12),
          txt("- check your connection.", size: 12),
        ],
      ),
    );
  }
}
