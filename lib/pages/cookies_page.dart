import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/footer.dart';

class CookiesPage extends StatelessWidget {
  const CookiesPage({super.key});

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
            // Hero Section
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF), Color(0xFF065F46)],
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
                      'Cookie Policy',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: isMobile ? 24 : 32,
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'We use cookies to enhance your browsing experience.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFFBFDBFE),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            // Cookie Policy Details
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? screenHeight * 0.03 : screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Cookie Policy',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF1F2937),
                          ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'We use cookies to improve functionality and analyze site usage.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF4B5563),
                          ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    _CookieSection(
                      title: 'Essential Cookies',
                      description: 'Required for basic site functionality, such as session management.',
                      isMobile: isMobile,
                    ),
                    _CookieSection(
                      title: 'Analytics Cookies',
                      description: 'Help us understand how visitors interact with our website.',
                      isMobile: isMobile,
                    ),
                    _CookieSection(
                      title: 'Marketing Cookies',
                      description: 'Used to deliver targeted advertisements.',
                      isMobile: isMobile,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      'Managing Cookies',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF111827),
                          ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'You can manage your cookie preferences through your browser settings.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF4B5563),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            // Call to Action
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
                      'Manage Your Preferences',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Adjust your cookie settings to control your data.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CustomButton(
                      text: 'Cookie Settings',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cookie settings updated!')),
                        );
                      },
                      isLarge: isMobile || isTablet,
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

class _CookieSection extends StatelessWidget {
  final String title;
  final String description;
  final bool isMobile;

  const _CookieSection({
    required this.title,
    required this.description,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: isMobile ? 16 : 18,
                  color: const Color(0xFF1F2937),
                ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? 14 : 16,
                  color: const Color(0xFF4B5563),
                ),
          ),
        ],
      ),
    );
  }
}