import 'package:flutter/material.dart';
import 'package:travel_app_cubit/misc/colors.dart';
import 'package:travel_app_cubit/widgets/app_large_text.dart';
import 'package:travel_app_cubit/widgets/app_text.dart';
import 'package:travel_app_cubit/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/" + images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                children: [
                  //text with button
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(
                        text: "Mountain",
                        size: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: AppText(
                          text:
                              "Mountain hikes give you an incredible sense of freedom along with endurance test",
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ResponsiveButton(
                        width: 120,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
