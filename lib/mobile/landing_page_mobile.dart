import 'package:flutter/material.dart';
import 'package:paulina_knop/components.dart';

/// The main widget for displaying the landing page on mobile devices.
class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({Key? key}) : super(key: key);

  @override
  _LandingPageMobileState createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
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
        body: ListView(
          children: [
            // Introduction section
            const CircleAvatar(
              radius: 117.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 113.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 110.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/image-circle.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: const SansBold("Hello I'm", 15.0),
                      ),
                      const SansBold("Paulina Knop", 40.0),
                      const Sans("Flutter developer", 20.0),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: const [
                          Icon(Icons.email),
                          Icon(Icons.call),
                          Icon(Icons.location_pin),
                        ],
                      ),
                      const SizedBox(width: 40.0),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: const [
                          Sans("paulinaknop@gmail.com", 15.0),
                          Sans("+48 942 564 985", 15.0),
                          Sans("13/3, Szczecin, Poland", 15.0),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 90.0),
            // About me section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SansBold("About me", 35.0),
                  const Sans(
                    "Hello! I'm Paulina Knop I specialize in flutter development",
                    15.0,
                  ),
                  const Sans(
                    "I strive to ensure astounding performance with state of the art security for Android, iOS, Web, Mac, Linux",
                    15.0,
                  ),
                  const SizedBox(height: 10.0),
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
            const SizedBox(height: 60.0),
            // What I do section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SansBold("What I do?", 35.0),
                AnimatedCard(
                  imagePath: "assets/webL.png",
                  text: "Web development",
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/app.png",
                  text: "App development",
                  fit: BoxFit.contain,
                  reverse: true,
                  width: 300.0,
                ),
                SizedBox(height: 35.0),
                AnimatedCard(
                  imagePath: "assets/firebase.png",
                  text: "Back-end development",
                  width: 300.0,
                ),
                SizedBox(height: 60.0),
                // Contact section
                ContactFormMobile(),
                SizedBox(height: 20.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
