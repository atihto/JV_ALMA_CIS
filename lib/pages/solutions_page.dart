/*import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class SolutionsPage extends StatelessWidget {
  const SolutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const mobileBreakpoint = 600.0;
    final isMobile = screenWidth < mobileBreakpoint;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: isMobile ? 60 : 80), // Space for the fixed header
                Container(
                  padding: EdgeInsets.all(isMobile ? 16.0 : 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Our Solutions',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              fontSize: isMobile ? 32 : 48,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Tailored solutions across construction, agribusiness, and oil & gas.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: isMobile ? 16 : 20,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      _buildSection(
                        context,
                        title: 'Construction Solutions',
                        content:
                            'Innovative building techniques and sustainable designs.',
                        isMobile: isMobile,
                      ),
                      _buildSection(
                        context,
                        title: 'Agribusiness Solutions',
                        content:
                            'Technology-driven farming and community empowerment programs.',
                        isMobile: isMobile,
                      ),
                      _buildSection(
                        context,
                        title: 'Oil & Gas Solutions',
                        content:
                            'Safety and efficiency-focused services for energy sectors.',
                        isMobile: isMobile,
                      ),
                      _buildSection(
                        context,
                        title: 'Contact Us',
                        content:
                            'Learn more by emailing info@jvalmacis.com or calling +1-555-123-4567.',
                        isMobile: isMobile,
                      ),
                    ],
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required String title, required String content, required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 14 : 18,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}*/