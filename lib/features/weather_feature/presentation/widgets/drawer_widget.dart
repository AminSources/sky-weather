import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_weather/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:sky_weather/core/widgets/txt.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 225,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* title
            txt("Sky Weather", size: 20, fontWeight: FontWeight.bold),

            //* toggle theme
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* option name
                  txt("Dark Theme", size: 15),

                  //* switch button
                  Transform.scale(
                    scale: 0.8, // Adjust the scale factor to change the size
                    child: BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, state) {
                        return Switch(
                          value: state.isDark,
                          onChanged: (value) {
                            //? toggle theme
                            context.read<ThemeBloc>().add(
                              ChangeThemeEvent(value),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            //* contact us
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: GestureDetector(
                onTap: () {
                  //? open contact us page
                  launchUrl(Uri.parse("https://aminsources.github.io/"));
                },
                child: txt("Contact us", size: 15),
              ),
            ),

            // spacer
            Spacer(),

            //* app details
            txt("v03.12.13.2"),
            txt("AminSources"),
          ],
        ),
      ),
    );
  }
}
