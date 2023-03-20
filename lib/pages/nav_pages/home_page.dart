import 'package:flutter/material.dart';
import 'package:travel_app_cubit/misc/colors.dart';
import 'package:travel_app_cubit/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //AppBar
          Container(
            padding: const EdgeInsets.only(top: 70, left: 30),
            child: Row(
              children: [
                const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black38,
                ),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          //Title
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: AppLargeText(
              text: "Discover",
            ),
          ),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              isScrollable: true,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicator:
                  CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              tabs: const [
                Tab(text: "Place"),
                Tab(text: "Inspiration"),
                Tab(text: "Emotions"),
              ],
            ),
          ),
          Container(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                Text("First"),
                Text("Second"),
                Text("Third"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  Color color;
  double radius;

  CircleTabIndicator({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  Color color;
  double radius;

  _CirclePainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
