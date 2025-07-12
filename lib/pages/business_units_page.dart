import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import 'dart:developer' as developer;

class BusinessUnitsPage extends StatelessWidget {
  const BusinessUnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context, isMobile, isTablet, screenWidth, screenHeight),
            _buildBusinessUnitsSection(context, isMobile, isTablet, screenWidth, screenHeight),
            _buildWhyChooseUsSection(context, isMobile, isTablet, screenWidth, screenHeight),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile, bool isTablet, double screenWidth, double screenHeight) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F172A),
            Color(0xFF1E293B),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : isTablet ? 32 : 48,
        vertical: isMobile ? 48 : isTablet ? 64 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Our Business Units',
                style: TextStyle(
                  fontSize: isMobile ? 28 : isTablet ? 36 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                'Delivering innovative solutions across construction, agribusiness, oil & gas, and information technology.',
                style: TextStyle(
                  fontSize: isMobile ? 16 : isTablet ? 18 : 20,
                  color: Colors.white.withOpacity(0.9),
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusinessUnitsSection(BuildContext context, bool isMobile, bool isTablet, double screenWidth, double screenHeight) {
    final businessUnits = [
      {
        'icon': LucideIcons.building,
        'title': 'Construction',
        'description': 'Comprehensive civil works including diplomatic and residential projects, infrastructure development projects, and facility maintenance management.',
        'route': '/construction-detail',
      },
      {
        'icon': LucideIcons.sprout,
        'title': 'Agribusiness',
        'description': 'Our agribusiness division empowers farmers with modern agricultural solutions, infrastructure, training and smart digital farming tools like CoffeeCore and KilimoMkononi, promoting sustainable agriculture and food security.',
        'route': '/agribusiness',
      },
      {
        'icon': LucideIcons.droplets,
        'title': 'Oil & Gas',
        'description': 'We provide specialized inspection services and regulatory compliance for the oil and gas industry.',
        'route': '/oil-gas',
      },
      {
        'icon': LucideIcons.globe,
        'title': 'Information Technology',
        'description': 'Our IT division, provides cuttiing-edge software solutions including NyumbaSmart CMMS, streamline facility management and asset maintenance for businesses in Kenya and CoffeeCore and KilimoMkononi agricultural applications.',
        'route': '/it-division',
      },
    ];

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.05,
        horizontal: screenWidth * 0.04,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isMobile ? screenWidth : 1200),
          child: Column(
            children: [
              Text(
                'Our Core Divisions',
                style: TextStyle(
                  fontSize: isMobile ? 24 : isTablet ? 28 : 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Explore our diverse portfolio of services across multiple industries',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: const Color(0xFF64748B),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.04),
              
              // Mobile Layout
              if (isMobile)
                Column(
                  children: businessUnits.map((unit) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: _businessUnitCard(
                        context: context,
                        icon: unit['icon'] as IconData,
                        title: unit['title'] as String,
                        description: unit['description'] as String,
                        route: unit['route'] as String,
                        isMobile: isMobile,
                        isTablet: isTablet,
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      ),
                    );
                  }).toList(),
                )
              
              // Desktop/Tablet Layout
              else
                Column(
                  children: [
                    // First Row
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: _businessUnitCard(
                              context: context,
                              icon: businessUnits[0]['icon'] as IconData,
                              title: businessUnits[0]['title'] as String,
                              description: businessUnits[0]['description'] as String,
                              route: businessUnits[0]['route'] as String,
                              isMobile: isMobile,
                              isTablet: isTablet,
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _businessUnitCard(
                              context: context,
                              icon: businessUnits[1]['icon'] as IconData,
                              title: businessUnits[1]['title'] as String,
                              description: businessUnits[1]['description'] as String,
                              route: businessUnits[1]['route'] as String,
                              isMobile: isMobile,
                              isTablet: isTablet,
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Second Row
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: _businessUnitCard(
                              context: context,
                              icon: businessUnits[2]['icon'] as IconData,
                              title: businessUnits[2]['title'] as String,
                              description: businessUnits[2]['description'] as String,
                              route: businessUnits[2]['route'] as String,
                              isMobile: isMobile,
                              isTablet: isTablet,
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _businessUnitCard(
                              context: context,
                              icon: businessUnits[3]['icon'] as IconData,
                              title: businessUnits[3]['title'] as String,
                              description: businessUnits[3]['description'] as String,
                              route: businessUnits[3]['route'] as String,
                              isMobile: isMobile,
                              isTablet: isTablet,
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _businessUnitCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required String route,
    required bool isMobile,
    required bool isTablet,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Container(
      constraints: BoxConstraints(
        minHeight: isMobile ? 280 : 320,
        maxHeight: isMobile ? 350 : 400,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Icon(
            icon,
            size: isMobile ? 40 : 48,
            color: const Color(0xFF1E293B),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 20 : 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0F172A),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 12 : 16),
          
          // Description - Flexible to take available space
          Flexible(
            child: Text(
              description,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF374151),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
              maxLines: isMobile ? 6 : 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          // Spacer to push button to bottom
          const SizedBox(height: 16),
          
          // Button
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                developer.log('BusinessUnits: Attempting to navigate to $route for $title', name: 'BusinessUnitsPage');
                try {
                  Navigator.pushNamed(context, route).then((_) {
                    developer.log('BusinessUnits: Successfully navigated to $route', name: 'BusinessUnitsPage');
                  }).catchError((error) {
                    developer.log('BusinessUnits: Navigation failed to $route: $error', name: 'BusinessUnitsPage');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Unable to open $title page. Please try again.'),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  });
                } catch (e) {
                  developer.log('BusinessUnits: Exception during navigation to $route: $e', name: 'BusinessUnitsPage');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error opening $title page'),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E293B),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Learn More',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhyChooseUsSection(BuildContext context, bool isMobile, bool isTablet, double screenWidth, double screenHeight) {
    final whyChooseUs = [
      {
        'icon': LucideIcons.award,
        'title': 'Proven Excellence',
        'description': 'Decades of experience delivering top-quality projects across industries.',
      },
      {
        'icon': LucideIcons.lightbulb,
        'title': 'Innovation-Driven',
        'description': 'Leveraging cutting-edge technology to solve complex challenges.',
      },
      {
        'icon': LucideIcons.leaf,
        'title': 'Sustainable Solutions',
        'description': 'Committed to environmentally responsible and sustainable practices.',
      },
      {
        'icon': LucideIcons.users,
        'title': 'Client-Centric Approach',
        'description': 'Building strong partnerships with a focus on client needs.',
      },
    ];

    return Container(
      color: const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.05,
        horizontal: screenWidth * 0.04,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isMobile ? screenWidth : 1200),
          child: Column(
            children: [
              Text(
                'Why Choose Us',
                style: TextStyle(
                  fontSize: isMobile ? 24 : isTablet ? 28 : 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Our commitment to quality and innovation sets us apart',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: const Color(0xFF64748B),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.04),
              
              // Mobile: Single column
              if (isMobile)
                Column(
                  children: whyChooseUs.map((reason) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: _whyChooseUsCard(
                        icon: reason['icon'] as IconData,
                        title: reason['title'] as String,
                        description: reason['description'] as String,
                        isMobile: isMobile,
                        isTablet: isTablet,
                        screenWidth: screenWidth,
                      ),
                    );
                  }).toList(),
                )
              
              // Desktop/Tablet: Grid
              else
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: isTablet ? 2.5 : 2.2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: whyChooseUs.map((reason) {
                    return _whyChooseUsCard(
                      icon: reason['icon'] as IconData,
                      title: reason['title'] as String,
                      description: reason['description'] as String,
                      isMobile: isMobile,
                      isTablet: isTablet,
                      screenWidth: screenWidth,
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _whyChooseUsCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isMobile,
    required bool isTablet,
    required double screenWidth,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isMobile ? 36 : 40,
            color: const Color(0xFF1E293B),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0F172A),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Flexible(
            child: Text(
              description,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF374151),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
