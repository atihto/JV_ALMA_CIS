import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'pages/about_page.dart';
import 'pages/business_units_page.dart';
import 'pages/careers_page.dart';
import 'pages/certificates_page.dart';
import 'pages/contact_page.dart';
import 'pages/cookies_page.dart';
import 'pages/home_page.dart';
import 'pages/news_page.dart';
import 'pages/privacy_policy_page.dart';
import 'pages/projects_page.dart';
import 'pages/references_page.dart';
import 'detail/construction/construction_detail.dart';
import 'detail/agribusiness/agribusiness_detail.dart';
import 'detail/oil/oil_gas_services_detail.dart';
import 'detail/it/it_division_detail.dart';
import 'detail/construction/construction_page.dart';
import 'detail/construction/facility_management_page.dart';
import 'detail/agribusiness/infrastructure.dart';
import 'detail/agribusiness/community_empowerment_page.dart';
import 'detail/agribusiness/digitization_in_agriculture_page.dart';
import 'detail/it/cmms_page.dart';
import 'detail/it/coffee_core_page.dart';
import 'detail/it/kilimo_mkononi_page.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) => const Center(child: Text('Download page coming soon!'));
}

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: Text(
          'No current job openings. Please check back later or contact us for opportunities.',
          style: TextStyle(fontSize: 18, color: Color(0xFF4B5563)),
          textAlign: TextAlign.center,
        ),
      );
}

void main() {
  usePathUrlStrategy(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JV Alma CIS Kenya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: MediaQuery.of(context).size.width < 600 ? 24 : 32,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1F2937),
          ),
          headlineMedium: TextStyle(
            fontSize: MediaQuery.of(context).size.width < 600 ? 18 : 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1F2937),
          ),
          titleLarge: TextStyle(
            fontSize: MediaQuery.of(context).size.width < 600 ? 16 : 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1F2937),
          ),
          bodyLarge: TextStyle(
            fontSize: MediaQuery.of(context).size.width < 600 ? 14 : 16,
            color: const Color(0xFF4B5563),
          ),
          bodyMedium: TextStyle(
            fontSize: MediaQuery.of(context).size.width < 600 ? 12 : 14,
            color: const Color(0xFF4B5563),
          ),
          bodySmall: TextStyle(
            fontSize: MediaQuery.of(context).size.width < 600 ? 10 : 12,
            color: const Color(0xFF4B5563),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (_) => const HomePage();
            break;
          case '/about':
            builder = (_) => const AboutPage();
            break;
          case '/business-units':
            builder = (_) => const BusinessUnitsPage();
            break;
          case '/careers':
            builder = (_) => const CareersPage();
            break;
          case '/jobs':
            builder = (_) => const JobsPage();
            break;
          case '/certificates':
            builder = (_) => const CertificatesPage();
            break;
          case '/contact':
            builder = (_) => const ContactPage();
            break;
          case '/cookies':
            builder = (_) => const CookiesPage();
            break;
          case '/news':
            builder = (_) => const NewsPage();
            break;
          case '/privacy-policy':
            builder = (_) => const PrivacyPolicyPage();
            break;
          case '/projects':
            builder = (_) => const ProjectsPage();
            break;
          case '/references':
            builder = (_) => const ReferencesPage();
            break;
          case '/construction':
            builder = (_) => const ConstructionPage();
            break;
          case '/construction-detail':
            builder = (_) => const ConstructionDetail();
            break;
          case '/agribusiness':
            builder = (_) => const AgribusinessDetail();
            break;
          case '/oil-gas':
            builder = (_) => const OilAndGasServicesDetail();
            break;
          case '/it-division':
            builder = (_) => const ITDivisionDetail();
            break;
          case '/facility':
            builder = (_) => const FacilityManagementPage();
            break;
          case '/infrastructure':
            builder = (_) => const InfrastructurePage();
            break;
          case '/community-empowerment':
            builder = (_) => const CommunityEmpowermentPage();
            break;
          case '/digitization-in-agriculture':
            builder = (_) => const DigitizationInAgriculturePage();
            break;
          case '/cmms':
            builder = (_) => const CmmsPage();
            break;
          case '/coffee-core':
            builder = (_) => const CoffeeCorePage();
            break;
          case '/kilimo-mkononi':
            builder = (_) => const KilimoMkononiPage();
            break;
          case '/download':
            builder = (_) => const DownloadPage();
            break;
          default:
            debugPrint('MyApp: Unknown route: ${settings.name}');
            builder = (_) => const Scaffold(
                  body: Center(child: Text('Page not found')),
                );
        }
        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}