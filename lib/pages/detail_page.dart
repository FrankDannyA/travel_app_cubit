import 'package:flutter/material.dart';
import 'package:travel_app_cubit/misc/colors.dart';
import 'package:travel_app_cubit/widgets/app_large_text.dart';
import 'package:travel_app_cubit/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage("img/mountain.jpeg"),
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
                    onPressed: () {},
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    //title | price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Yosemite",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text: "\$250",
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
                            text: "USA, California",
                            color: AppColors.textColor1)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
