import 'package:flutter/material.dart';
import 'package:paulina_knop/components.dart';

/// The main widget for displaying the about section on web devices.
class AboutWeb extends StatefulWidget {
  const AboutWeb({Key? key}) : super(key: key);

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    // Get the width of the device
    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      // Drawer for navigation
      drawer: const DrawersWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          size: 25.0,
          color: Colors.black,
        ),
        title: const TabsWebList(),
      ),
      body: ListView(
        children: [
          // About me section
          SizedBox(
            height: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SansBold("About me", 40.0),
                    const SizedBox(height: 15.0),
                    const Sans(
                      "Hello! I'm Paulina Knop. I specialize in flutter development.",
                      15.0,
                    ),
                    const Sans(
                      "I strive to ensure astounding performance with state of the art security for Android, iOS, Web, Mac, Linux and Windows.",
                      15.0,
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        tealContainer("Flutter"),
                        const SizedBox(width: 7.0),
                        tealContainer("Firebase"),
                        const SizedBox(width: 7.0),
                        tealContainer("Android"),
                        const SizedBox(width: 7.0),
                        tealContainer("iOS"),
                        const SizedBox(width: 7.0),
                        tealContainer("Windows"),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140.0,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "assets/profile2-circle.png",
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),

          // Web development section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AnimatedCard(
                imagePath: "assets/webL.png",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: const [
                    SansBold("Web development", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                      "I'm here to build your presence online with state of the art web apps.",
                      15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),

          // App development section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: const [
                    SansBold("App development", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                      "Do you need a high-performance, responsive and beautiful app? Don't worry, I've got you covered.",
                      15.0,
                    ),
                  ],
                ),
              ),
              const AnimatedCard(
                imagePath: "assets/app.png",
                height: 250.0,
                width: 250.0,
                reverse: true,
              ),
            ],
          ),
          const SizedBox(height: 20.0),

          // Back-end development section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AnimatedCard(
                imagePath: "assets/firebase.png",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: const [
                    SansBold("Back-end development", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                      "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that.",
                      15.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
