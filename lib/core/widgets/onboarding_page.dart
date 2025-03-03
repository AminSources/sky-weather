import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sky_weather/core/bloc/onboarding_bloc/onboarding_bloc.dart';
import 'package:sky_weather/core/constants/colors.dart';
import 'package:sky_weather/core/widgets/txt.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    //* pictures
    List<String> images = ["weather.png", "search.png", "presentation.png"];

    //* title
    List<String> title = ["Weather Details", "Search City", "Beautiful View"];

    //* description
    List<String> description = [
      "Current weather, forecast and air quality, all in one place.",
      "Search for any location around the world.",
      "Beautiful and simple user interface for everyone.",
    ];

    //* page controller
    PageController controller = PageController();

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            //* page indicator
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: blueColor,
                  dotColor: greyColor,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 5,
                ),
              ),
            ),

            //* page view
            SizedBox(
              width: double.infinity,
              height: 600,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //* picture
                        SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.asset(
                            "lib/assets/images/${images[index]}",
                          ),
                        ),

                        //* title
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: txt(
                            title[index],
                            size: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        //* description
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: txt(
                            description[index],
                            size: 16,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            //* next button
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.page == 2) {
                      //? push weather page
                      Navigator.pushReplacementNamed(context, "/checkupdate");

                      //* save onboarding is pass
                      GetStorage box = GetStorage();
                      box.write("onboarding", true);
                    } else {
                      //? go next page
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );

                      //? change page index
                      context.read<OnboardingBloc>().add(
                        OnboardingChangePageEvent(),
                      );
                    }
                  },
                  child: BlocBuilder<OnboardingBloc, int>(
                    builder:
                        (context, state) => txt(
                          state == 2 ? "Get Started" : "Next",
                          size: 16,
                          color: whiteColor,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
