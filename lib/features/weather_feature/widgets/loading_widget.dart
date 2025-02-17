import 'package:flutter/material.dart';
import 'package:sky_weather_app/core/constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  final bool? isSmallWidget;
  const LoadingWidget({super.key, this.isSmallWidget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          isSmallWidget == true
              ? 100
              : MediaQuery.sizeOf(context).height * 0.75,
      child: Center(
        child: CircularProgressIndicator(
          color: blueColor,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
