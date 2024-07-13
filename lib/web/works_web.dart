import 'package:flutter/material.dart';
import 'package:paulina_knop/components.dart';

/// The main widget for displaying the works section on the web.
class WorksWeb extends StatefulWidget {
  const WorksWeb({Key? key}) : super(key: key);

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    // Get the width of the device
    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      // Drawer for navigation
      drawer: const DrawersWeb(),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/works.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: const TabsWebList(),
            ),
          ];
        },
        body: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 30.0),
                const SansBold("Works", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const AnimatedCard(
                      imagePath: "assets/portfolio_screenshot.PNG",
                      height: 200.0,
                      width: 300.0,
                    ),
                    SizedBox(
                      width: widthDevice / 3,
                      child: Column(
                        children: const [
                          SansBold("Portfolio", 30.0),
                          SizedBox(height: 15.0),
                          Sans(
                            "Deployed on Android, IOS and Web, the portfolio project was truly an achievement. I used Flutter to develop the beautiful and responsive UI and Firebase for the back-end.",
                            15.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
