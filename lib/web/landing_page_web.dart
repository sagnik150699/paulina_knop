import 'package:flutter/material.dart';
import 'package:paulina_knop/components.dart';

/// The main widget for displaying the landing page on web devices.
class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({Key? key}) : super(key: key);

  @override
  _LandingPageWebState createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    // Get the height and width of the device
    var heightDevice = MediaQuery.of(context).size.height;
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
          // First section: Introduction
          Container(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    const SizedBox(height: 15.0),
                    const SansBold("Paulina Knop", 55.0),
                    const Sans("Flutter developer", 30.0),
                    const SizedBox(height: 15.0),
                    Row(
                      children: const [
                        Icon(Icons.email),
                        SizedBox(width: 20.0),
                        Sans("paulinaknop@gmail.com", 15.0),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: const [
                        Icon(Icons.call),
                        SizedBox(width: 20.0),
                        Sans("+48 942 564 985", 15.0),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: const [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20.0),
                        Sans("13/3, Szczecin, Poland", 15.0),
                      ],
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/image-circle.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Second section: About me
          Container(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/web.jpg", height: widthDevice / 1.9),
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
                      "I strive to ensure astounding performance with state of the art security for Android, iOS, Web, Mac, Linux, and Windows.",
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
              ],
            ),
          ),
          // Third section: What I do
          Container(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SansBold("What I do?", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    AnimatedCard(
                      imagePath: "assets/webL.png",
                      text: "Web development",
                    ),
                    AnimatedCard(
                      imagePath: "assets/app.png",
                      text: "App development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePath: "assets/firebase.png",
                      text: "Back-end development",
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Fourth section: Contact form
          const SizedBox(height: 15.0),
          const ContactFormWeb(),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
