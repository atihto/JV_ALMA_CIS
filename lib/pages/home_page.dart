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
      {'image': 'assets/images/clients/total.jpg', 'text': null},
    ];

    // Complete business units data
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
                        maxCrossAxisExtent: isSmallScreen ? 300 : isMobile ? 400 : isTablet ? 320 : 280, // Smaller on tablet
                        childAspectRatio: isSmallScreen ? 1.6 : isMobile ? 1.3 : isTablet ? 1.5 : 1.5, // Match mobile/desktop compactness
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
                        return ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 320), // Match tablet maxCrossAxisExtent
                          child: InkWell(
                            onTap: () => _navigate(context, unit['route'] as String),
                            child: Container(
                              padding: EdgeInsets.all(isMobile ? 12 : 16),
                              decoration: BoxDecoration(
                                color: unit['bgColor'] as Color,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    unit['icon'] as IconData,
                                    color: unit['iconColor'] as Color,
                                    size: isMobile ? 40 : 48,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    unit['title'] as String,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontSize: isMobile ? 16 : 17,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF111827),
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 6),
                                  Expanded(
                                    child: Text(
                                      unit['description'] as String,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            fontSize: isMobile ? 12 : 13,
                                            color: const Color(0xFF4B5563),
                                          ),
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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