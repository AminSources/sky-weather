import 'package:flutter/material.dart';
import 'package:sky_weather/core/widgets/txt.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateWidget extends StatelessWidget {
  const UpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //* image
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset("lib/assets/images/update.png"),
        ),

        //* title
        txt("New version is available!", size: 22, fontWeight: FontWeight.bold),

        //* buttons
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //* update button
              SizedBox(
                width: 150,
                height: 45,
                child: ElevatedButton(
                  child: txt("Update", size: 15),
                  onPressed: () {
                    //? open update page
                    launchUrl(
                      Uri.parse(
                        "https://github.com/AminSources/sky-weather/releases/tag/v03.12.13.2",
                      ),
                    );
                  },
                ),
              ),

              //* skip button
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: SizedBox(
                  width: 125,
                  height: 45,
                  child: OutlinedButton(
                    child: txt("Skip", size: 15),
                    onPressed: () {
                      //? push weather page
                      Navigator.pushReplacementNamed(context, "/weather");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
