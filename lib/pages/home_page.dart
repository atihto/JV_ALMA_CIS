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

  void _navigate(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  double _getResponsiveFontSize(double screenWidth, {double baseSize = 16}) {
    return baseSize * (screenWidth / 600).clamp(0.8, 1.2);
  }

  double _getChildAspectRatio(double screenWidth, double screenHeight) {
    if (screenWidth < 400) return 1.5; // Small mobile, much shorter
    if (screenWidth < 600) return 1.5; // Mobile, much shorter
    if (screenWidth < 1024) return 1.2; // Tablet, unchanged
    return 1.8; // Desktop, much shorter
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

    final List<Map<String, dynamic>> clients = [
      {'image': 'assets/images/clients/kvda.jpg', 'text': null},
      {'image': 'assets/images/clients/sweden.jpg', 'text': null},
      {'image': 'assets/images/clients/italy.jpg', 'text': null},
      {'image': 'assets/images/clients/usa.jpg', 'text': null},
      {'image': 'assets/images/clients/navfac.jpg', 'text': null},
      {'image': 'assets/images/clients/portugal.jpg', 'text': null},
      {'image': 'assets/images/clients/iadc.jpg', 'text': null},
      {'image': 'assets/images/clients/total.jpg', 'text': null},
    ];

    final List<Map<String, dynamic>> businessUnits = [
      {
        'name': 'Construction',
        'icon': LucideIcons.building,
        'title': 'Construction',
        'description': 'Civil Works & Systems',
        'route': '/construction-detail',
        'iconColor': const Color(0xFF2563EB),
        'bgColor': const Color(0xFFEFF6FF),
        'hoverBgColor': const Color(0xFFDBEAFE),
      },
      {
        'name': 'Agribusiness',
        'title': 'Agribusiness',
        'icon': LucideIcons.sprout,
        'description': 'Infrastructure, Training and Digitization',
        'route': '/agribusiness',
        'iconColor': const Color(0xFF16A34A),
        'bgColor': const Color(0xFFD1FAE5),
        'hoverBgColor': const Color(0xFFA7F3D0),
      },
      {
        'name': 'Oil & Gas Services',
        'icon': LucideIcons.droplets,
        'title': 'Oil & Gas Services',
        'description': 'Inspection and Regulatory Compliance',
        'route': '/oil-gas',
        'iconColor': const Color(0xFFF97316),
        'bgColor': const Color(0xFFFFF7ED),
        'hoverBgColor': const Color(0xFFFED7AA),
      },
      {
        'name': 'IT Division',
        'icon': LucideIcons.globe,
        'title': 'IT Division',
        'description': 'Digital Solutions',
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
                          'For Construction, Agribusiness, Oil & Gas Services, and IT Solutions',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: _getResponsiveFontSize(screenWidth, baseSize: 18),
                              ),
                          textAlign: TextAlign.center,
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
                            fontSize: _getResponsiveFontSize(screenWidth, baseSize: 24),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Comprehensive solutions across multiple sectors',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: _getResponsiveFontSize(screenWidth, baseSize: 16),
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: isSmallScreen ? 300 : isMobile ? 400 : isTablet ? 320 : 280,
                            childAspectRatio: _getChildAspectRatio(screenWidth, screenHeight),
                            crossAxisSpacing: isSmallScreen ? screenWidth * 0.02 : screenWidth * 0.03,
                            mainAxisSpacing: isSmallScreen ? screenHeight * 0.01 : screenHeight * 0.02,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 16),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          clipBehavior: Clip.hardEdge,
                          itemCount: businessUnits.length,
                          itemBuilder: (context, index) {
                            final unit = businessUnits[index];
                            return HomePageHelperWidgets.businessUnitCard(
                              context: context,
                              name: unit['name'] as String,
                              icon: unit['icon'] as IconData,
                              title: unit['title'] as String,
                              description: unit['description'] as String,
                              route: unit['route'] as String,
                              iconColor: unit['iconColor'] as Color,
                              bgColor: unit['bgColor'] as Color,
                              hoverBgColor: unit['hoverBgColor'] as Color,
                            );
                          },
                        );
                      },
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
                            fontSize: _getResponsiveFontSize(screenWidth, baseSize: 24),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Trusted by leading organizations across industries',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: _getResponsiveFontSize(screenWidth, baseSize: 16),
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: isMobile ? 160 : 240,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.33,
                        enableInfiniteScroll: true,
                      ),
                      items: clients.map((client) {
                        final isEnlarged = client['image'] == 'assets/images/clients/sweden.jpg' ||
                            client['image'] == 'assets/images/clients/portugal.jpg';
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
                                    height: isEnlarged ? (isMobile ? 120 : 180) : (isMobile ? 100 : 150),
                                    width: isEnlarged ? (isMobile ? 120 : 180) : (isMobile ? 100 : 150),
                                  ),
                                  if (client['text'] != null) ...[
                                    const SizedBox(width: 0),
                                    Flexible(
                                      child: Text(
                                        client['text'] as String,
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                              color: Colors.black,
                                              fontSize: _getResponsiveFontSize(screenWidth, baseSize: 16),
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
                            fontSize: _getResponsiveFontSize(screenWidth, baseSize: 24),
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Let\'s build a sustainable future together.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: _getResponsiveFontSize(screenWidth, baseSize: 16),
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