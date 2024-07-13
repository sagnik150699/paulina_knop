import 'package:flutter/material.dart';

import '../components.dart';

/// The main widget for displaying the about section on mobile devices.
class AboutMobile extends StatefulWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Extend the body behind the app bar
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
        ),
        // Drawer for navigation
        endDrawer: const DrawersMobile(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              // Introduction section
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/profile2-circle.png",
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SansBold("About me", 35.0),
                    const SizedBox(height: 10.0),
                    const Sans(
                      "Hello! I'm Paulina Knop. I specialize in Flutter development",
                      15.0,
                    ),
                    const Sans(
                      "I strive to ensure astounding performance with state of the art security for Android, iOS, Web, Mac, and Linux.",
                      15.0,
                    ),
                    const SizedBox(height: 15.0),
                    Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        tealContainer("Flutter"),
                        tealContainer("Firebase"),
                        tealContainer("Android"),
                        tealContainer("Windows"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),

              // Web development section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AnimatedCard(
                    imagePath: "assets/webL.png",
                    width: 200.0,
                  ),
                  const SizedBox(height: 30.0),
                  const SansBold("Web development", 20.0),
                  const SizedBox(height: 10.0),
                  const Sans(
                    "I'm here to build your presence online with state-of-the-art web apps.",
                    15.0,
                  ),
                ],
              ),

              // App development section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  const AnimatedCard(
                    imagePath: "assets/app.png",
                    width: 200.0,
                    reverse: true,
                  ),
                  const SizedBox(height: 30.0),
                  const SansBold("App development", 20.0),
                  const SizedBox(height: 10.0),
                  const Sans(
                    "Do you need a high-performance, responsive, and beautiful app? Don't worry, I've got you covered.",
                    15.0,
                  ),
                ],
              ),

              // Back-end development section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0),
                  const AnimatedCard(
                    imagePath: "assets/firebase.png",
                    width: 200.0,
                  ),
                  const SizedBox(height: 30.0),
                  const SansBold("Back-end development", 20.0),
                  const SizedBox(height: 10.0),
                  const Sans(
                    "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that.",
                    15.0,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
