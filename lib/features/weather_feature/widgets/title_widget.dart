import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/widgets/txt.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: txt(title, size: 20, fontWeight: FontWeight.bold),
    );
  }
}
