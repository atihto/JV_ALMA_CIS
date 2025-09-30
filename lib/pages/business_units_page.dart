import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/custom_card.dart' as card;
import 'dart:developer' as developer;

class BusinessUnitsPage extends StatelessWidget {
  const BusinessUnitsPage({super.key});

  double _getResponsiveFontSize(double screenWidth, {double baseSize = 16}) {
    return baseSize * (screenWidth / 600).clamp(0.8, 1.2);
  }

  double _getChildAspectRatio(double screenWidth, double screenHeight, {bool isWhyChooseUs = false}) {
    if (isWhyChooseUs) {
      if (screenWidth < 400) return 2.2; // Small mobile, shorter
      if (screenWidth < 600) return 2.2; // Mobile, shorter
      if (screenWidth < 1024) return 2.5; // Tablet, unchanged
      return 3.4; // Desktop, shorter
    }
    if (screenWidth < 400) return 1.4; // Small mobile, shorter
    if (screenWidth < 600) return 1.4; // Mobile, shorter
    if (screenWidth < 1024) return 1.1; // Tablet, unchanged
    return 1.7; // Desktop, shorter
  }

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
                  fontSize: _getResponsiveFontSize(screenWidth, baseSize: isMobile ? 28 : isTablet ? 36 : 48),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                'Delivering innovative solutions across construction, agribusiness, oil & gas, and information technology.',
                style: TextStyle(
                  fontSize: _getResponsiveFontSize(screenWidth, baseSize: isMobile ? 16 : isTablet ? 18 : 20),
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
        'color': const Color(0xFFEFF6FF),
        'hoverColor': const Color(0xFFDBEAFE),
      },
      {
        'icon': LucideIcons.sprout,
        'title': 'Agribusiness',
        'description': 'Our agribusiness division empowers farmers with modern agricultural solutions, infrastructure, training and smart digital farming tools like CoffeeCore and KilimoMkononi, promoting sustainable agriculture and food security.',
        'route': '/agribusiness',
        'color': const Color(0xFFD1FAE5),
        'hoverColor': const Color(0xFFA7F3D0),
      },
      {
        'icon': LucideIcons.droplets,
        'title': 'Oil & Gas',
        'description': 'We provide specialized inspection services and regulatory compliance for the oil and gas industry.',
        'route': '/oil-gas',
        'color': const Color(0xFFFFF7ED),
        'hoverColor': const Color(0xFFFED7AA),
      },
      {
        'icon': LucideIcons.globe,
        'title': 'Information Technology',
        'description': 'Our IT division provides cutting-edge software solutions including NyumbaSmart CMMS, streamlining facility management and asset maintenance for businesses in Kenya and CoffeeCore and KilimoMkononi agricultural applications.',
        'route': '/it-division',
        'color': const Color(0xFFF5E8FF),
        'hoverColor': const Color(0xFFE9D5FF),
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
                  fontSize: _getResponsiveFontSize(screenWidth, baseSize: isMobile ? 24 : isTablet ? 28 : 32),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Explore our diverse portfolio of services across multiple industries',
                style: TextStyle(
                  fontSize: _getResponsiveFontSize(screenWidth, baseSize: 18),
                  color: const Color(0xFF64748B),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.04),
              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 2,
                      childAspectRatio: _getChildAspectRatio(screenWidth, screenHeight),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: businessUnits.length,
                    itemBuilder: (context, index) {
                      final unit = businessUnits[index];
                      return BusinessUnitCard(
                        context: context,
                        icon: unit['icon'] as IconData,
                        title: unit['title'] as String,
                        description: unit['description'] as String,
                        route: unit['route'] as String,
                        color: unit['color'] as Color,
                        hoverColor: unit['hoverColor'] as Color,
                        isMobile: isMobile,
                        isTablet: isTablet,
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
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
                  fontSize: _getResponsiveFontSize(screenWidth, baseSize: isMobile ? 24 : isTablet ? 28 : 32),
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Our commitment to quality and innovation sets us apart',
                style: TextStyle(
                  fontSize: _getResponsiveFontSize(screenWidth, baseSize: 18),
                  color: const Color(0xFF64748B),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.04),
              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : 2,
                      childAspectRatio: _getChildAspectRatio(screenWidth, screenHeight, isWhyChooseUs: true),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: whyChooseUs.length,
                    itemBuilder: (context, index) {
                      final reason = whyChooseUs[index];
                      return _whyChooseUsCard(
                        icon: reason['icon'] as IconData,
                        title: reason['title'] as String,
                        description: reason['description'] as String,
                        isMobile: isMobile,
                        isTablet: isTablet,
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                      );
                    },
                  );
                },
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
    required double screenHeight,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = constraints.maxHeight;
        return card.CustomCard(
          hoverEffect: false,
          clipBehavior: Clip.hardEdge,
          content: Container(
            padding: EdgeInsets.all(isMobile ? 10 : isTablet ? 12 : 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: isMobile ? 28 : isTablet ? 32 : 32,
                      color: const Color(0xFF1E293B),
                    ),
                    SizedBox(width: isMobile ? 8 : 12),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: _getResponsiveFontSize(screenWidth, baseSize: isMobile ? 16 : isTablet ? 17 : 18),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 6 : 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: _getResponsiveFontSize(screenWidth, baseSize: isMobile ? 12 : isTablet ? 13 : 14),
                    color: const Color(0xFF374151),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BusinessUnitCard extends StatefulWidget {
  final BuildContext context;
  final IconData icon;
  final String title;
  final String description;
  final String route;
  final Color color;
  final Color hoverColor;
  final bool isMobile;
  final bool isTablet;
  final double screenWidth;
  final double screenHeight;

  const BusinessUnitCard({
    super.key,
    required this.context,
    required this.icon,
    required this.title,
    required this.description,
    required this.route,
    required this.color,
    required this.hoverColor,
    required this.isMobile,
    required this.isTablet,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  State<BusinessUnitCard> createState() => _BusinessUnitCardState();
}

class _BusinessUnitCardState extends State<BusinessUnitCard> {
  bool isHovered = false;

  double _getResponsiveFontSize(double screenWidth, {double baseSize = 16}) {
    return baseSize * (screenWidth / 600).clamp(0.8, 1.2);
  }

  double _getResponsiveIconSize(double cardHeight, {double baseSize = 32}) {
    return baseSize * (cardHeight / 250).clamp(0.7, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = constraints.maxHeight;
        return card.CustomCard(
          hoverEffect: true,
          clipBehavior: Clip.hardEdge,
          content: MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: InkWell(
              onTap: () {
                try {
                  Navigator.pushNamed(context, widget.route).then((_) {
                    developer.log('BusinessUnits: Successfully navigated to ${widget.route}', name: 'BusinessUnitsPage');
                  }).catchError((error) {
                    developer.log('BusinessUnits: Navigation failed to ${widget.route}: $error', name: 'BusinessUnitsPage');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Unable to open ${widget.title} page. Please try again.'),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  });
                } catch (e) {
                  developer.log('BusinessUnits: Exception during navigation to ${widget.route}: $e', name: 'BusinessUnitsPage');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error opening ${widget.title} page'),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }
              },
              splashColor: Colors.grey.withOpacity(0.2),
              hoverColor: widget.hoverColor,
              borderRadius: BorderRadius.circular(12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                transform: isHovered ? Matrix4.identity().scaled(1.02) : Matrix4.identity(),
                decoration: BoxDecoration(
                  color: isHovered ? widget.hoverColor : widget.color,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(isHovered ? 0.3 : 0.1),
                      blurRadius: isHovered ? 12 : 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(widget.isMobile ? 10 : widget.isTablet ? 12 : 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      widget.icon,
                      size: _getResponsiveIconSize(cardHeight, baseSize: widget.isMobile ? 28 : 32),
                      color: const Color(0xFF1E293B),
                    ),
                    SizedBox(height: widget.isMobile ? 6 : 8),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: _getResponsiveFontSize(widget.screenWidth, baseSize: widget.isMobile ? 16 : widget.isTablet ? 17 : 18),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0F172A),
                      ),
                    ),
                    SizedBox(height: widget.isMobile ? 6 : 8),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: _getResponsiveFontSize(widget.screenWidth, baseSize: widget.isMobile ? 12 : widget.isTablet ? 13 : 14),
                        color: const Color(0xFF374151),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}