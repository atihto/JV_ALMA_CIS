import 'package:firebase_core/firebase_core.dart'; // Add Firebase Core
import 'firebase_options.dart'; // Import generated Firebase options
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/business_units_page.dart';
import 'pages/contact_page.dart';
import 'pages/news_page.dart';
//import 'pages/projects_page.dart';
//import 'pages/references_page.dart';
import 'pages/careers_page.dart';
import 'pages/certificates_page.dart';
import 'pages/privacy_policy_page.dart';
import 'pages/cookies_page.dart';
import 'pages/map_page.dart';
import 'detail/construction/construction_detail.dart';
import 'detail/agribusiness/agribusiness_detail.dart';
import 'detail/oil/oil_gas_services_detail.dart';
import 'detail/it/it_division_detail.dart';
import 'detail/it/cmms_page.dart';
import 'detail/it/alma_works_page.dart';
import 'detail/it/coffee_core_page.dart';
import 'detail/it/kilimo_mkononi_landing_page.dart';
import 'detail/it/kilimo_mkononi_enterprise_page.dart';
import 'detail/it/kilimo_mkononi_education_page.dart';
import 'dart:developer' as developer;

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Initialize Firebase with platform-specific options
  );
  usePathUrlStrategy(); // Keep your URL strategy for clean URLs
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JV ALMA C.I.S',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E293B),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
          displayMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
          displaySmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
          headlineLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
          headlineSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1E293B),
          ),
          titleLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E293B),
          ),
          titleMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E293B),
          ),
          titleSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E293B),
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            color: Color(0xFF374151),
          ),
          bodyMedium: TextStyle(
            fontSize: 13,
            color: Color(0xFF4B5563),
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B7280),
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        cardTheme: const CardThemeData(  // no const needed if you have dynamic values, but const is fine here
  color: Colors.white,
        ),
      ),
      onGenerateRoute: (settings) {
        developer.log('MyApp: Generating route for ${settings.name}', name: 'MyApp');
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const HomePage());
          case '/about':
            return MaterialPageRoute(builder: (_) => const AboutPage());
          case '/business-units':
            return MaterialPageRoute(builder: (_) => const BusinessUnitsPage());
          case '/contact':
            return MaterialPageRoute(builder: (_) => const ContactPage());
          case '/news':
            return MaterialPageRoute(builder: (_) => const NewsPage());
          /*case '/projects':
            return MaterialPageRoute(builder: (_) => const ProjectsPage());
          case '/references':
            return MaterialPageRoute(builder: (_) => const ReferencesPage());*/
          case '/careers':
            return MaterialPageRoute(builder: (_) => const CareersPage());
          case '/certificates':
            return MaterialPageRoute(builder: (_) => const CertificatesPage());
          case '/privacy-policy':
            return MaterialPageRoute(builder: (_) => const PrivacyPolicyPage());
          case '/cookies':
            return MaterialPageRoute(builder: (_) => const CookiesPage());
          case '/map':
            return MaterialPageRoute(builder: (_) => const MapPage(address: ''));
          case '/construction-detail':
            return MaterialPageRoute(builder: (_) => const ConstructionDetail());
          case '/agribusiness':
            return MaterialPageRoute(builder: (_) => const AgribusinessDetail());
          case '/oil-gas':
            return MaterialPageRoute(builder: (_) => const OilAndGasServicesDetail());
          case '/it-division':
            return MaterialPageRoute(builder: (_) => const ITDivisionDetail());
          case '/cmms':
            return MaterialPageRoute(builder: (_) => const CmmsPage());
          case '/alma-works':
            return MaterialPageRoute(builder: (_) => const AlmaWorksPage());
          case '/coffee-core':
            return MaterialPageRoute(builder: (_) => const CoffeeCorePage());
          case '/kilimo-mkononi':
            return MaterialPageRoute(builder: (_) => const KilimoMkononiLandingPage());
          case '/kilimo-mkononi-enterprise':
            return MaterialPageRoute(builder: (_) => const KilimoMkononiEnterprisePage());
          case '/kilimo-mkononi-education':
            return MaterialPageRoute(builder: (_) => const KilimoMkononiEducationPage());
          default:
            developer.log('Unknown route: ${settings.name}', name: 'MyApp');
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                appBar: AppBar(title: const Text('Page Not Found')),
                body: const Center(
                  child: Text('404 - Page Not Found'),
                ),
              ),
            );
        }
      },
    );
  }
}