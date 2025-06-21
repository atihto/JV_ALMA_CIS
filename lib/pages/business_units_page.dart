import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/custom_button.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/home_page_helper_widgets.dart';

class BusinessUnitsPage extends StatelessWidget {
  const BusinessUnitsPage({super.key});

  void _navigate(BuildContext context, String route) {
    debugPrint('BusinessUnitsPage: Navigating to $route');
    Navigator.pushNamed(context, route).catchError((e) {
      debugPrint('BusinessUnitsPage: Navigation error to $route: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Navigation error: $e')),
      );
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Header(onMenuPressed: () => scaffoldKey.currentState?.openDrawer()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF), Color(0xFF065F46)],
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 60 : 80,
                  horizontal: 16,
                ),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 896),
                    child: Column(
                      children: [
                        Text(
                          'Our Business Units',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                                fontSize: isMobile ? 24 : 32,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Delivering specialized solutions in construction, agribusiness, oil & gas, and IT.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFFBFDBFE),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 32 : 48,
                  horizontal: screenWidth * 0.04,
                ),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 896),
                    child: Column(
                      children: [
                        Text(
                          'Explore Our Expertise',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: const Color(0xFF111827),
                                fontSize: isMobile ? 20 : 24,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'With a commitment to innovation and excellence, our four core divisions provide tailored solutions to meet diverse industry needs across East Africa and beyond.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFF4B5563),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: const Color(0xFFF9FAFB),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.04,
                  horizontal: screenWidth * 0.04,
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
                      GridView.count(
                        crossAxisCount: isMobile ? 1 : 4,
                        shrinkWrap: true,
                        crossAxisSpacing: screenWidth * 0.03,
                        mainAxisSpacing: screenHeight * 0.02,
                        childAspectRatio: isMobile ? 1.8 : 1.4,
                        physics: const NeverScrollableScrollPhysics(),
                        clipBehavior: Clip.hardEdge,
                        children: [
                          HomePageHelperWidgets.businessUnitCard(
                            context: context,
                            name: 'Construction',
                            icon: LucideIcons.building,
                            title: 'Construction',
                            description: 'Infrastructure and management',
                            route: '/construction-detail',
                            iconColor: const Color(0xFF2563EB),
                            bgColor: const Color(0xFFEFF6FF),
                            hoverBgColor: const Color(0xFFDBEAFE),
                          ),
                          HomePageHelperWidgets.businessUnitCard(
                            context: context,
                            name: 'Agribusiness',
                            icon: LucideIcons.sprout,
                            title: 'Agribusiness',
                            description: 'Apps, irrigation, and training',
                            route: '/agribusiness',
                            iconColor: const Color(0xFF16A34A),
                            bgColor: const Color(0xFFD1FAE5),
                            hoverBgColor: const Color(0xFFA7F3D0),
                          ),
                          HomePageHelperWidgets.businessUnitCard(
                            context: context,
                            name: 'Oil & Gas Services',
                            icon: LucideIcons.droplets,
                            title: 'Oil & Gas Services',
                            description: 'Safety and consulting',
                            route: '/oil-gas',
                            iconColor: const Color(0xFFF97316),
                            bgColor: const Color(0xFFFFF7ED),
                            hoverBgColor: const Color(0xFFFED7AA),
                          ),
                          HomePageHelperWidgets.businessUnitCard(
                            context: context,
                            name: 'IT Division',
                            icon: LucideIcons.globe,
                            title: 'IT Division',
                            description: 'CMMS and digital solutions',
                            route: '/it-division',
                            iconColor: const Color(0xFF9333EA),
                            bgColor: const Color(0xFFF3E8FF),
                            hoverBgColor: const Color(0xFFE9D5FF),
                          ),
                        ],
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
                  vertical: isMobile ? 40 : 72,
                  horizontal: 16,
                ),
                child: Container(
                  constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 896),
                  child: Column(
                    children: [
                      Text(
                        'Partner with Us',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Colors.white,
                              fontSize: isMobile ? 24 : 32,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Let’s collaborate to bring your vision to life with our industry-leading expertise.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontSize: isMobile ? 14 : 18,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: isMobile ? 8 : 16,
                        alignment: WrapAlignment.center,
                        children: [
                          CustomButton(
                            text: 'Request a Quote',
                            onPressed: () => _navigate(context, '/contact'),
                            isLarge: isMobile,
                            isOutline: false,
                          ),
                          CustomButton(
                            text: 'Book a Consultation',
                            onPressed: () => _navigate(context, '/contact'),
                            isLarge: isMobile,
                            isOutline: true,
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
      ),
    );
  }
}