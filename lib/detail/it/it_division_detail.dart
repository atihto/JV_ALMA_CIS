import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/business_unit_section.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import '../../widgets/subsection.dart';

class ITDivisionDetail extends StatelessWidget {
  const ITDivisionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                vertical: isMobile ? 40 : 80,
                horizontal: 16,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        LucideIcons.arrowLeft,
                        color: Colors.white,
                        size: isMobile ? 20 : 24,
                      ),
                      onPressed: () {
                        debugPrint('ITDivisionDetail: Navigating back to /business-units');
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/business-units',
                          (route) => false,
                        );
                      },
                      tooltip: 'Back to Business Units',
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
                        child: Column(
                          children: [
                            Text(
                              'IT Division',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: isMobile ? 24 : 32,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Comprehensive solutions across the IT sector, powered by cutting-edge technology and innovation.',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: const Color(0xFFBFDBFE),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: isMobile ? 16 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: const Color(0xFFF9FAFB),
                    child: const BusinessUnitSection(
                      title: 'IT Division',
                      icon: LucideIcons.globe,
                      iconColor: Color(0xFF9333EA),
                      description:
                          'Our in-house IT division develops cutting-edge software solutions that power our operations across all business units. From facility management systems to agricultural mobile applications, we create technology that drives efficiency and innovation.',
                      children: [
                        Subsection(
                          title: 'NyumbaSmart - CMMS Software/App',
                          icon: LucideIcons.database,
                          description:
                              'NyumbaSmart, Proprietary facility management software, designed for sensitive building management operations.',
                          sectionKey: 'cmms',
                          badge: 'Building Solution',
                          features: [
                            'Asset tracking and monitoring',
                            'Preventive maintenance scheduling',
                            'Work order management',
                          ],
                        ),
                        Subsection(
                          title: 'Kilimo Mkononi App',
                          icon: LucideIcons.smartphone,
                          description:
                              'Comprehensive mobile application helping thousands of farmers across Kenya with agricultural management and market access.',
                          sectionKey: 'kilimo-mkononi',
                          badge: 'Multi Crop Farming Solution',
                          features: [
                            'Farming tips and best practices',
                            'Weather forecasting integration',
                            'Soil and pest management',
                            'Cost control tracking',
                          ],
                        ),
                        Subsection(
                          title: 'Coffee Core Platform',
                          icon: LucideIcons.cloud,
                          description:
                              'Dedicated platform connecting coffee farmers with cooperatives for better market access and quality control.',
                          sectionKey: 'coffee-core',
                          badge: 'Coffee Farmers Network',
                          features: [
                            'Coffee-specific farming guidance',
                            'Cooperative integration system',
                            'Yield tracking and management',
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E40AF), Color(0xFF065F46)],
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 32 : 64,
                horizontal: 16,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
                child: Column(
                  children: [
                    Text(
                      'Ready to Get Started?',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Colors.white,
                            fontSize: isMobile ? 24 : 32,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Contact us today to discuss how our comprehensive business units can help bring your project to life with innovation and excellence.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: isMobile ? 8 : 16,
                      runSpacing: isMobile ? 8 : 16,
                      alignment: WrapAlignment.center,
                      children: [
                        CustomButton(
                          text: 'Request Quote',
                          onPressed: () => Navigator.pushNamed(context, '/contact'),
                        ),
                        CustomButton(
                          text: 'Schedule Consultation',
                          onPressed: () => Navigator.pushNamed(context, '/contact'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const Footer(),
          ],
        ),
      ),
    );
  }
}