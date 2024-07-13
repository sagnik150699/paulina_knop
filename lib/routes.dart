import 'package:flutter/material.dart';
import 'package:paulina_knop/common/blog.dart';
import 'package:paulina_knop/mobile/about_mobile.dart';
import 'package:paulina_knop/mobile/contact_mobile.dart';
import 'package:paulina_knop/mobile/works_mobile.dart';
import 'package:paulina_knop/web/about_web.dart';
import 'package:paulina_knop/web/landing_page_web.dart';
import 'package:paulina_knop/web/works_web.dart';

import 'mobile/landing_page_mobile.dart';
import 'web/contact_web.dart';

/// The class responsible for generating routes based on the provided route settings.
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const LandingPageWeb();
              } else {
                return const LandingPageMobile();
              }
            },
          ),
        );
      case '/contact':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const ContactWeb();
              } else {
                return const ContactMobile();
              }
            },
          ),
        );
      case '/about':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const AboutWeb();
              } else {
                return const AboutMobile();
              }
            },
          ),
        );
      case '/blog':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Blog(),
        );
      case '/works':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const WorksWeb();
              } else {
                return const WorksMobile();
              }
            },
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const LandingPageWeb();
              } else {
                return const LandingPageMobile();
              }
            },
          ),
        );
    }
  }
}
