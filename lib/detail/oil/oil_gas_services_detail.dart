import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';

class OilAndGasServicesDetail extends StatelessWidget {
  const OilAndGasServicesDetail({super.key});

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
                  colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF), Color(0xFF065F46)],
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
                        debugPrint('OilAndGasServicesDetail: Navigating back to /business-units');
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
                              'Oil & Gas Services',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: isMobile ? 24 : 32,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Comprehensive solution across the oil & gas services sector, powered by partenrships and decades of expertise.',
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
                            Container(
                              constraints: BoxConstraints(maxWidth: isMobile ? 300 : 400), 
                              child: Image.asset(
                                'assets/images/tic/tic_1.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              constraints: BoxConstraints(maxWidth: isMobile ? 300 : 600),
                              child: Image.asset(
                                'assets/images/tic/tic_2.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              constraints: BoxConstraints(maxWidth: isMobile ? 300 : 600),
                              child: Image.asset(
                                'assets/images/tic/tic_3.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              constraints: BoxConstraints(maxWidth: isMobile ? 300 : 600),
                              child: Image.asset(
                                'assets/images/tic/tic_4.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              constraints: BoxConstraints(maxWidth: isMobile ? 300 : 600),
                              child: Image.asset(
                                'assets/images/tic/tic_5.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              constraints: BoxConstraints(maxWidth: isMobile ? 300 : 600),
                              child: Image.asset(
                                'assets/images/tic/tic_6.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
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