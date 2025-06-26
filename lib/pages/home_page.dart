import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';
import '../widgets/home_page_helper_widgets.dart';
import '../widgets/custom_widgets.dart';
import 'dart:developer' as developer;
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;

  void _navigate(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        developer.log('HomePage: Page loaded successfully', name: 'HomePage');
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  final isMobile = screenWidth < 600;
  final isTablet = screenWidth >= 600 && screenWidth < 1024;
  final isSmallScreen = screenWidth < 400;

  // List of client logos with optional text
  final List<Map<String, dynamic>> clients = [
    {'image': 'assets/images/clients/kvda.jpg', 'text': null},
    {'image': 'assets/images/clients/sweden.jpg', 'text': null},
    {'image': 'assets/images/clients/italy.jpg', 'text': null},
    {'image': 'assets/images/clients/usa.jpg', 'text': null},
    {'image': 'assets/images/clients/navfac.jpg', 'text': null},
    {'image': 'assets/images/clients/portugal.jpg', 'text': null},
    {'image': 'assets/images/clients/iadc.jpg', 'text': null},
  ];

  // Complete business units data
  final List<Map<String, dynamic>> businessUnits = [
    {
      'name': 'Construction',
      'icon': LucideIcons.building,
      'title': 'Construction',
      'description': 'Infrastructure and management',
      'route': '/construction-detail',
      'iconColor': const Color(0xFF2563EB),
      'bgColor': const Color(0xFFEFF6FF),
      'hoverBgColor': const Color(0xFFDBEAFE),
    },
    {
      'name': 'Agribusiness',
      'title': 'Agribusiness',
      'icon': LucideIcons.sprout,
      'description': 'Apps, irrigation, and training',
      'route': '/agribusiness',
      'iconColor': const Color(0xFF16A34A),
      'bgColor': const Color(0xFFD1FAE5),
      'hoverBgColor': const Color(0xFFA7F3D0),
    },
    {
      'name': 'Oil & Gas Services',
      'icon': LucideIcons.droplets,
      'title': 'Oil & Gas Services',
      'description': 'Safety and consulting',
      'route': '/oil-gas',
      'iconColor': const Color(0xFFF97316),
      'bgColor': const Color(0xFFFFF7ED),
      'hoverBgColor': const Color(0xFFFED7AA),
    },
    {
      'name': 'IT Division',
      'icon': LucideIcons.globe,
      'title': 'IT Division',
      'description': 'CMMS and digital solutions',
      'route': '/it-division',
      'iconColor': const Color(0xFF9333EA),
      'bgColor': const Color(0xFFF5E8FF),
      'hoverBgColor': const Color(0xFFE9D5FF),
    },
  ];

  return AppScaffold(
    body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: isMobile ? screenHeight * 0.8 : screenHeight * 0.7),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/company_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              color: Colors.black.withOpacity(0.6),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 16.0 : 24.0,
                horizontal: isMobile ? screenWidth * 0.05 : screenWidth * 0.03,
              ),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 1000),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        'Leading Construction, Agribusiness, Oil & Gas Services, and IT Solutions',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: isMobile ? 15 : 18,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: const Color(0xFFF9FAFB),
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.04,
              horizontal: isSmallScreen ? screenWidth * 0.02 : screenWidth * 0.04,
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1400),
              child: Column(
                children: [
                  Text(
                    'Our Business Units',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: const Color(0xFF111827),
                          fontSize: isMobile ? 20 : 24,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Comprehensive solutions across multiple sectors',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: isMobile ? 14 : 16,
                          color: const Color(0xFF4B5563),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: isSmallScreen ? 300 : isMobile ? 400 : isTablet ? 360 : 300,
                      childAspectRatio: isSmallScreen ? 1.8 : isMobile ? 1.4 : isTablet ? 1.5 : 1.2,
                      crossAxisSpacing: isSmallScreen ? screenWidth * 0.02 : screenWidth * 0.03,
                      mainAxisSpacing: isSmallScreen ? screenHeight * 0.01 : screenHeight * 0.02,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    clipBehavior: Clip.hardEdge,
                    itemCount: businessUnits.length,
                    itemBuilder: (context, index) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 300),
                        child: HomePageHelperWidgets.businessUnitCard(
                          context: context,
                          name: businessUnits[index]['name'] as String,
                          icon: businessUnits[index]['icon'] as IconData,
                          title: businessUnits[index]['title'] as String,
                          description: businessUnits[index]['description'] as String,
                          route: businessUnits[index]['route'] as String,
                          iconColor: businessUnits[index]['iconColor'] as Color,
                          bgColor: businessUnits[index]['bgColor'] as Color,
                          hoverBgColor: businessUnits[index]['hoverBgColor'] as Color,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomButton(
                    text: 'Explore Our Business Units',
                    onPressed: () => _navigate(context, '/business-units'),
                    icon: LucideIcons.arrowRight,
                    isLarge: isMobile || isTablet,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.06,
              horizontal: screenWidth * 0.04,
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
              child: Column(
                children: [
                  Text(
                    'Featured Projects',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: const Color(0xFF111827),
                          fontSize: isMobile ? 20 : 24,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Showcasing our commitment to excellence',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: isMobile ? 14 : 16,
                          color: const Color(0xFF4B5563),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  GridView.count(
                    crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                    shrinkWrap: true,
                    crossAxisSpacing: screenWidth * 0.03,
                    mainAxisSpacing: screenHeight * 0.03,
                    physics: const NeverScrollableScrollPhysics(),
                    clipBehavior: Clip.hardEdge,
                    children: [
                      HomePageHelperWidgets.projectCard(
                        context: context,
                        icon: LucideIcons.coffee,
                        title: 'Coffee Core',
                        description: 'Mobile application serving over 5,000+ coffee farmers with agricultural management tools.',
                        gradient: const LinearGradient(
                          colors: [Color(0xFFA855F7), Color(0xFF9333EA)],
                        ),
                        route: '/coffee-core',
                      ),
                      HomePageHelperWidgets.projectCard(
                        context: context,
                        icon: LucideIcons.droplets,
                        title: 'Sigor Wei Wei',
                        description: 'Major civil works for a large-scale irrigation scheme in a remote region, including installation of 29 km of underground PVC and HDPE pipelines to irrigate over 325 hectares.',
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFB923C), Color(0xFFF97316)],
                        ),
                        route: '/infrastructure',
                      ),
                      HomePageHelperWidgets.projectCard(
                        context: context,
                        icon: LucideIcons.home,
                        title: 'United States Embassy - Rosslyn Ridge Renov.',
                        description: 'Multi-phase renovation of 30+ residential units with modern upgrades.',
                        gradient: const LinearGradient(
                          colors: [Color(0xFF10B981), Color(0xFF065F46)],
                        ),
                        route: '/construction',
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomButton(
                    text: 'View All Projects',
                    onPressed: () => _navigate(context, '/projects'),
                    isLarge: isMobile || isTablet,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.06,
              horizontal: screenWidth * 0.04,
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
              child: Column(
                children: [
                  Text(
                    'Our Valued Clients',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: const Color(0xFF111827),
                          fontSize: isMobile ? 20 : 24,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Trusted by leading organizations across industries',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: isMobile ? 14 : 16,
                          color: const Color(0xFF4B5563),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: isMobile ? 140 : 220,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.33,
                      enableInfiniteScroll: true,
                    ),
                    items: clients.map((client) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  client['image'] as String,
                                  fit: BoxFit.contain,
                                  height: isMobile ? 100 : 150,
                                  width: isMobile ? 100 : 150,
                                ),
                                if (client['text'] != null) ...[
                                  const SizedBox(width: 0),
                                  Flexible(
                                    child: Text(
                                      client['text'] as String,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: Colors.black,
                                            fontSize: isMobile ? 12 : 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1E40AF), Color(0xFF065F46)],
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? screenHeight * 0.06 : screenHeight * 0.08,
              horizontal: screenWidth * 0.04,
            ),
            child: Container(
              constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
              child: Column(
                children: [
                  Text(
                    'Ready to Collaborate?',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: isMobile ? 20 : 24,
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Let\'s build a sustainable future together.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: isMobile ? 14 : 16,
                          color: const Color(0xFFBFDBFE),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Wrap(
                    spacing: 16.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.center,
                    children: [
                      CustomButton(
                        text: 'Get Quote',
                        onPressed: () => _navigate(context, '/contact'),
                        isLarge: isMobile || isTablet,
                      ),
                      CustomButton(
                        text: 'Contact Us',
                        onPressed: () => _navigate(context, '/contact'),
                        isOutline: true,
                        isLarge: isMobile || isTablet,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          const Footer(),
        ],
      ),
    ),
  );
}
}
