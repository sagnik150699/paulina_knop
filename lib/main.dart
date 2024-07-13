import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paulina_knop/routes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

/// The main entry point of the application.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  // Initialize Firebase with the default platform options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Generate routes for navigation
      onGenerateRoute: Routes.generateRoute,
      initialRoute: '/',
    );
  }
}
