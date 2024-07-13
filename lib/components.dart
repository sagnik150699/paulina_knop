import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

// Logger instance for debugging purposes
final Logger logger = Logger();

// Text editing controllers for managing input fields in forms
final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

// A StatefulWidget for creating navigation tabs on the web
class TabsWeb extends StatefulWidget {
  final String title;  // Title of the tab
  final String route;  // Route to navigate to when the tab is clicked

  const TabsWeb({Key? key, required this.title, required this.route}) : super(key: key);

  @override
  _TabsWebState createState() => _TabsWebState();
}

// State class for TabsWeb
class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;  // Boolean to track if the tab is selected

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the specified route when the tab is clicked
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.roboto(
            shadows: [
              Shadow(
                color: Colors.black,
                offset: Offset(0, -8),
              ),
            ],
            fontSize: 25.0,
            color: Colors.transparent,
            decoration: TextDecoration.underline,
            decorationThickness: 2,
            decorationColor: Colors.tealAccent,
          )
              : GoogleFonts.roboto(color: Colors.black, fontSize: 20.0),
          child: Text(widget.title),
        ),
      ),
    );
  }
}

// A stateless widget to create a list of navigation tabs for the web
class TabsWebList extends StatelessWidget {
  const TabsWebList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Spacer(flex: 3),
        TabsWeb(title: "Home", route: '/'),
        Spacer(),
        TabsWeb(title: "Works", route: '/works'),
        Spacer(),
        TabsWeb(title: "Blog", route: '/blog'),
        Spacer(),
        TabsWeb(title: "About", route: '/about'),
        Spacer(),
        TabsWeb(title: 'Contact', route: '/contact'),
        Spacer(),
      ],
    );
  }
}

// A stateless widget for creating navigation tabs on mobile devices
class TabsMobile extends StatelessWidget {
  final String text;  // Text to display on the tab
  final String route;  // Route to navigate to when the tab is clicked

  const TabsMobile({Key? key, required this.text, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
      onPressed: () {
        // Navigate to the specified route when the tab is clicked
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}

// Function to create an icon button for launching URLs
Widget urlLauncher(String imgPath, String url) {
  return IconButton(
    icon: SvgPicture.asset(imgPath, color: Colors.black, width: 35),
    onPressed: () async {
      // Launch the specified URL
      await launchUrl(Uri.parse(url));
    },
  );
}

// A stateless widget for creating a drawer with profile information and social media links on the web
class DrawersWeb extends StatelessWidget {
  const DrawersWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/image.png"),
            ),
          ),
          const SizedBox(height: 15.0),
          const SansBold("Paulina Knop", 30.0),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg", "https://www.instagram.com/tomcruise/"),
              urlLauncher("assets/twitter.svg", "https://www.twitter.com/tomcruise"),
              urlLauncher("assets/github.svg", "https://github.com/sagnik150699/paulina_knop"),
            ],
          ),
        ],
      ),
    );
  }
}

// A stateless widget for creating a drawer with navigation tabs and social media links on mobile devices
class DrawersMobile extends StatelessWidget {
  const DrawersMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.black),
              ),
              child: Image.asset(
                'assets/profile2-circle.png',
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          const TabsMobile(text: "Home", route: '/'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Works", route: '/works'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Blog", route: '/blog'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "About", route: '/about'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Contact", route: '/contact'),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg", "https://www.instagram.com/tomcruise/"),
              urlLauncher("assets/twitter.svg", "https://www.twitter.com/tomcruise"),
              urlLauncher("assets/github.svg", "https://github.com/sagnik150699/paulina_knop"),
            ],
          ),
        ],
      ),
    );
  }
}

// A stateless widget for displaying bold text using the Sans font
class SansBold extends StatelessWidget {
  final String text;  // Text to display
  final double size;  // Font size

  const SansBold(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

// A stateless widget for displaying text using the Sans font
class Sans extends StatelessWidget {
  final String text;  // Text to display
  final double size;  // Font size

  const Sans(this.text, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size),
    );
  }
}

// A stateless widget for displaying text using the Abel font with customizable properties
class AbelCustom extends StatelessWidget {
  final String text;  // Text to display
  final double size;  // Font size
  final Color? color;  // Text color
  final FontWeight? fontWeight;  // Font weight

  const AbelCustom({
    Key? key,
    required this.text,
    required this.size,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}

// A stateless widget for creating a form field with a label and validation
class TextForm extends StatelessWidget {
  final String text;  // Label text
  final double containerWidth;  // Width of the form field container
  final String hintText;  // Hint text to display in the form field
  final int? maxLines;  // Maximum number of lines for the form field
  final TextEditingController controller;  // Controller for managing the form field input
  final String? Function(String?)? validator;  // Validator function for form field validation

  const TextForm({
    Key? key,
    required this.text,
    required this.containerWidth,
    required this.hintText,
    this.maxLines,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text, 16.0),
        const SizedBox(height: 5),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            validator: validator,
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

// A stateful widget for creating an animated card with an image and optional text
class AnimatedCard extends StatefulWidget {
  final String imagePath;  // Path to the image to display on the card
  final String? text;  // Optional text to display on the card
  final BoxFit? fit;  // BoxFit for the image
  final bool? reverse;  // Boolean to indicate if the animation should reverse
  final double? height;  // Height of the image
  final double? width;  // Width of the image

  const AnimatedCard({
    Key? key,
    required this.imagePath,
    this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

// State class for AnimatedCard
class _AnimatedCardState extends State<AnimatedCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? const Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : const Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height ?? 200.0,
                width: widget.width ?? 200.0,
                fit: widget.fit,
              ),
              const SizedBox(height: 10.0),
              if (widget.text != null) SansBold(widget.text!, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

// Class for adding data to Firestore
class AddDataFirestore {
  final CollectionReference response = FirebaseFirestore.instance.collection('messages');

  // Method for adding response data to Firestore
  Future<bool> addResponse(String firstName, String lastName, String email, String phoneNumber, String message) async {
    try {
      await response.add({
        'first name': firstName,
        'last name': lastName,
        'email': email,
        'phone number': phoneNumber,
        'message': message,
      });
      logger.d("Success");
      return true;
    } catch (error) {
      logger.d(error);
      return false;
    }
  }
}

// Function to display an error dialog
Future<void> DialogError(BuildContext context, String title) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: SansBold(title, 20.0),
    ),
  );
}

// A stateful widget for creating a contact form for the web
class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({Key? key}) : super(key: key);

  @override
  _ContactFormWebState createState() => _ContactFormWebState();
}

// State class for ContactFormWeb
class _ContactFormWebState extends State<ContactFormWeb> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 30.0),
          const SansBold("Contact me", 40.0),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextForm(
                    text: "First Name",
                    containerWidth: 350.0,
                    hintText: "Please type first name",
                    controller: _firstNameController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "First name is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15.0),
                  TextForm(
                    text: "Email",
                    containerWidth: 350.0,
                    hintText: "Please type email address",
                    controller: _emailController,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextForm(
                    text: "Last Name",
                    containerWidth: 350.0,
                    hintText: "Please type last name",
                    controller: _lastNameController,
                  ),
                  const SizedBox(height: 15.0),
                  TextForm(
                    text: "Phone number",
                    containerWidth: 350.0,
                    hintText: "Please type phone number",
                    controller: _phoneController,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.5,
            hintText: "Please type your message",
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text!.isEmpty) {
                return "Message is required";
              }
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message sent successfully");
                } else {
                  DialogError(context, "Message failed to send");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: 200.0,
            color: Colors.tealAccent,
            child: const SansBold("Submit", 20.0),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

// A stateful widget for creating a contact form for mobile devices
class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({Key? key}) : super(key: key);

  @override
  _ContactFormMobileState createState() => _ContactFormMobileState();
}

// State class for ContactFormMobile
class _ContactFormMobileState extends State<ContactFormMobile> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          const SansBold("Contact me", 35.0),
          TextForm(
            text: "First name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type first name",
            controller: _firstNameController,
            validator: (text) {
              if (text!.isEmpty) {
                return "First name is required";
              }
              return null;
            },
          ),
          TextForm(
            text: "Last name",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type last name",
            controller: _lastNameController,
          ),
          TextForm(
            text: "Phone number",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type phone number",
            controller: _phoneController,
          ),
          TextForm(
            text: "Email",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type email address",
            controller: _emailController,
            validator: (text) {
              if (text!.isEmpty) {
                return "Email is required";
              }
              return null;
            },
          ),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.4,
            hintText: "Please type your message",
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text!.isEmpty) {
                return "Message is required";
              }
              return null;
            },
          ),
          MaterialButton(
            onPressed: () async {
              logger.d(_firstNameController.text);
              final addData = AddDataFirestore();
              if (formKey.currentState!.validate()) {
                if (await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                )) {
                  formKey.currentState!.reset();
                  DialogError(context, "Message sent successfully");
                } else {
                  DialogError(context, "Message failed to send");
                }
              }
            },
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: widthDevice / 2.2,
            color: Colors.tealAccent,
            child: const SansBold("Submit", 20.0),
          ),
        ],
      ),
    );
  }
}

// Function to create a container with teal border and text
Widget tealContainer(String text) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.tealAccent,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    padding: const EdgeInsets.all(7.0),
    child: Text(
      text,
      style: GoogleFonts.openSans(fontSize: 15.0),
    ),
  );
}
