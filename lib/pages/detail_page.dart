import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_cubit/cubit/app_cubit.dart';
import 'package:travel_app_cubit/cubit/app_cubit_states.dart';
import 'package:travel_app_cubit/misc/colors.dart';
import 'package:travel_app_cubit/widgets/app_button.dart';
import 'package:travel_app_cubit/widgets/app_large_text.dart';
import 'package:travel_app_cubit/widgets/app_text.dart';
import 'package:travel_app_cubit/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;

      return Scaffold(
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              //background image
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  height: 350,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/${detail.place.img}"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),

              //app bar elements
              Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              //detail view elements
              Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title | price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: detail.place.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: "\$" + detail.place.price.toString(),
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),

                      //locatiom
                      Row(
                        children: [
                          Icon(Icons.place_rounded, color: AppColors.mainColor),
                          const SizedBox(width: 5),
                          AppText(
                            text: detail.place.location,
                            color: AppColors.textColor1,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      //star wiget
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < detail.place.stars
                                    ? AppColors.starColor
                                    : AppColors.textColor1,
                              );
                            }),
                          ),
                          const SizedBox(width: 10),
                          AppText(
                              text: detail.place.stars.toString(),
                              color: AppColors.textColor2),
                        ],
                      ),

                      //number of people
                      const SizedBox(height: 30),
                      AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text: "Number of people in your group",
                        color: AppColors.mainTextColor,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: AppButton(
                                size: 50,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),

                      //description
                      AppLargeText(
                        text: "Description",
                        size: 20,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(height: 10),
                      AppText(
                        text: detail.place.description,
                        color: AppColors.mainTextColor,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 30,
                child: Row(
                  children: [
                    AppButton(
                      size: 60,
                      color: AppColors.textColor1,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.textColor1,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    const SizedBox(width: 20),
                    ResponsiveButton(
                      isResponsive: true,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
