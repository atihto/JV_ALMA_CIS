import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';
import '../widgets/custom_widgets.dart';
import 'dart:developer' as developer;

class BusinessUnitsPage extends StatefulWidget {
  const BusinessUnitsPage({super.key});

  @override
  State<BusinessUnitsPage> createState() => _BusinessUnitsPageState();
}

class _BusinessUnitsPageState extends State<BusinessUnitsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        developer.log('BusinessUnitsPage: Page loaded successfully', name: 'BusinessUnitsPage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context, isMobile, isTablet),
            _buildBusinessUnitsGrid(context, isMobile, isTablet),
            _buildWhyChooseUsSection(context, isMobile, isTablet),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile, bool isTablet) {
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
                'Comprehensive solutions across construction, agribusiness, oil & gas services, and information technology sectors.',
                style: TextStyle(
                  fontSize: isMobile ? 16 : isTablet ? 18 : 20,
                  color: Colors.white.withValues(alpha: 0.9),
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

  Widget _buildBusinessUnitsGrid(BuildContext context, bool isMobile, bool isTablet) {
    final businessUnits = [
      {
        'icon': LucideIcons.building2,
        'title': 'Construction',
        'description': 'Comprehensive construction services including residential, commercial, and infrastructure development projects.',
        'features': [
          'Residential Construction',
          'Commercial Buildings',
          'Infrastructure Development',
          'Project Management',
          'Quality Assurance',
        ],
        'route': '/construction-detail',
        'color': const Color(0xFF1E293B),
      },
      {
        'icon': LucideIcons.sprout,
        'title': 'Agribusiness',
        'description': 'Modern agricultural solutions, irrigation, training, and digital farming technologies.',
        'features': [
          'Capacity Building and Community Empowerment Programs',
          'Digital Agriculture Solutions',
          'Kilimo Mkononi Platform',
          'Coffee Core Platform'
          'Sustainable Farming, Irrigation Systems',
          'Agricultural Consulting',
        ],
        'route': '/agribusiness',
        'color': const Color(0xFF059669),
      },
      {
        'icon': LucideIcons.droplets,
        'title': 'Oil & Gas Services',
        'description': 'Professional inspection services and strategic partnerships in the energy sector.',
        'features': [
          'Oil Inspection Services',
          'Quality Control',
          'Strategic Partnerships',
          'Energy Consulting',
          'Compliance Management',
        ],
        'route': '/oil-gas',
        'color': const Color(0xFFDC2626),
      },
      {
        'icon': LucideIcons.monitor,
        'title': 'IT Division',
        'description': 'Cutting-edge software solutions including NyumbaSmart - CMMS software, Coffee Core and Kilimo Mkononi management systems.',
        'features': [
          'NyumbaSmart - CMMS Software',
          'Coffee Core Platform',
          'Kilimo Mkononi Platform'
          'Custom Software Development',
          'System Integration',
          'Technical Support',
        ],
        'route': '/it-division',
        'color': const Color(0xFF7C3AED),
      },
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : isTablet ? 32 : 48,
        vertical: isMobile ? 48 : isTablet ? 64 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount;
              double childAspectRatio;
              
              if (isMobile) {
                crossAxisCount = 1;
                childAspectRatio = 0.8;
              } else if (isTablet) {
                crossAxisCount = 2;
                childAspectRatio = 0.9;
              } else {
                crossAxisCount = 2;
                childAspectRatio = 1.0;
              }

              return GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                childAspectRatio: childAspectRatio,
                crossAxisSpacing: 32,
                mainAxisSpacing: 32,
                children: businessUnits.map((unit) {
                  return _buildBusinessUnitCard(
                    context,
                    unit,
                    isMobile,
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBusinessUnitCard(BuildContext context, Map<String, dynamic> unit, bool isMobile) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 20 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: (unit['color'] as Color).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                unit['icon'] as IconData,
                size: 32,
                color: unit['color'] as Color,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              unit['title'] as String,
              style: TextStyle(
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              unit['description'] as String,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF374151),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Key Services:',
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 12),
            ...((unit['features'] as List<String>).take(3).map((feature) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.checkCircle,
                      size: 16,
                      color: unit['color'] as Color,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feature,
                        style: TextStyle(
                          fontSize: isMobile ? 13 : 15,
                          color: const Color(0xFF374151),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })),
            const Spacer(),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Learn More',
                onPressed: () {
                  developer.log('BusinessUnitsPage: Navigating to ${unit['route']}', name: 'BusinessUnitsPage');
                  if (mounted) {
                    Navigator.pushNamed(context, unit['route'] as String).catchError((e) {
                      developer.log('BusinessUnitsPage: Navigation error: $e', name: 'BusinessUnitsPage');
                      return null;
                    });
                  }
                },
                isLarge: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWhyChooseUsSection(BuildContext context, bool isMobile, bool isTablet) {
    final reasons = [
      {
        'icon': LucideIcons.award,
        'title': 'Proven Excellence',
        'description': 'Over 7+ years of delivering high-quality projects across multiple sectors.',
      },
      {
        'icon': LucideIcons.users,
        'title': 'Expert Team',
        'description': 'Skilled professionals with deep industry knowledge and experience.',
      },
      {
        'icon': LucideIcons.lightbulb,
        'title': 'Innovation Focus',
        'description': 'Cutting-edge solutions that leverage the latest technologies and best practices.',
      },
      {
        'icon': LucideIcons.hand,
        'title': 'Trusted Partnerships',
        'description': 'Strong relationships with clients, suppliers, and industry partners.',
      },
    ];

    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FAFC),
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
                'Why Choose JV ALMA C.I.S?',
                style: TextStyle(
                  fontSize: isMobile ? 24 : isTablet ? 28 : 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount;
                  double childAspectRatio;
                  
                  if (isMobile) {
                    crossAxisCount = 1;
                    childAspectRatio = 1.5;
                  } else if (isTablet) {
                    crossAxisCount = 2;
                    childAspectRatio = 1.3;
                  } else {
                    crossAxisCount = 4;
                    childAspectRatio = 1.0;
                  }

                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: childAspectRatio,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                    children: reasons.map((reason) {
                      return Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              reason['icon'] as IconData,
                              size: 32,
                              color: const Color(0xFF1E293B),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              reason['title'] as String,
                              style: TextStyle(
                                fontSize: isMobile ? 16 : 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF0F172A),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              reason['description'] as String,
                              style: TextStyle(
                                fontSize: isMobile ? 14 : 16,
                                color: const Color(0xFF374151),
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
