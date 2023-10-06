import 'package:flutter/material.dart';

import '../components.dart';

class WorksMobile extends StatefulWidget {
  const WorksMobile({Key? key}) : super(key: key);

  @override
  State<WorksMobile> createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        endDrawer: DrawersMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 35.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/works.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  SansBold("Works", 35.0),
                  SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: "assets/portfolio_screenshot.PNG",
                    fit: BoxFit.contain,
                    height: 150.0,
                    width: 300.0,
                  ),
                  SizedBox(height: 30.0),
                  SansBold("Portfolio", 20.0),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Sans(
                        "Deployed on Android, IOS and Web, the portfolio project was truly an achievement. I used Flutter to develop the beautiful and responsive UI and Firebase for the back-end.",
                        15.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
