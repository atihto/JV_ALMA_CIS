// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/responsive_utils.dart';

class KilimoMkononiLandingPage extends StatelessWidget {
  const KilimoMkononiLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;

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
                  colors: [
                    Color(0xFF0F172A),
                    Color(0xFF1E293B),
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 32 : 64,
                horizontal: isMobile ? 16 : 24,
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
                        debugPrint('KilimoMkononiLandingPage: Navigating back');
                        Navigator.pop(context);
                      },
                      tooltip: 'Back',
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 1000),
                        child: Column(
                          children: [
                            Icon(
                              LucideIcons.sprout,
                              size: isMobile ? 48 : 64,
                              color: const Color(0xFF10B981),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Kilimo Mkononi',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    fontSize: isMobile ? 28 : 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Farming in the Palm of Your Hand',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontSize: isMobile ? 16 : 20,
                                    color: const Color(0xFFBFDBFE),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 700),
                              child: Text(
                                'Choose the platform that fits your needs - whether you\'re a professional farmer looking to optimize your operations or an educator bringing agricultural learning to your students.',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: isMobile ? 14 : 16,
                                      color: const Color(0xFF94A3B8),
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Platform Selection Cards
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 24 : 48,
                horizontal: isMobile ? 16 : 24,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: isMobile
                    ? Column(
                        children: [
                          _buildPlatformCard(
                            context,
                            isMobile,
                            title: 'Kilimo Mkononi Enterprise',
                            subtitle: 'For Farmers & Agricultural Businesses',
                            description:
                                'Professional farming solutions with market insights, weather forecasting, pest management, and financial tracking tools.',
                            icon: LucideIcons.wheat,
                            gradient: const LinearGradient(
                              colors: [Color(0xFF065F46), Color(0xFF047857)],
                            ),
                            highlights: [
                              'Real-time market prices',
                              'Comprehensive pest & disease management',
                              'Farm Management Financial planning tools',
                              'Expert farming guidance',
                              'Comprehensive field data input & analysis',
                            ],
                            route: '/kilimo-mkononi-enterprise',
                            buttonText: 'Explore Enterprise',
                            badge: 'Available Now',
                          ),
                          const SizedBox(height: 24),
                          _buildPlatformCard(
                            context,
                            isMobile,
                            title: 'Kilimo Mkononi Education',
                            subtitle: 'For Schools & Educational Institutions',
                            description:
                                'Interactive agricultural learning platform with quizzes, simulations, and built-in student protection features.',
                            icon: LucideIcons.graduationCap,
                            gradient: const LinearGradient(
                              colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
                            ),
                            highlights: [
                              'Safe, verified user system',
                              'Interactive quizzes & simulations',
                              'Teacher-created content',
                              'Progress tracking & reporting',
                            ],
                            route: '/kilimo-mkononi-education',
                            buttonText: 'Learn About Education',
                            badge: 'Coming Soon',
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildPlatformCard(
                              context,
                              isMobile,
                              title: 'Kilimo Mkononi Enterprise',
                              subtitle: 'For Farmers & Agricultural Businesses',
                              description:
                                  'Professional farming solutions with market insights, weather forecasting, pest management, and financial tracking tools.',
                              icon: LucideIcons.wheat,
                              gradient: const LinearGradient(
                                colors: [Color(0xFF065F46), Color(0xFF047857)],
                              ),
                              highlights: [
                               'Real-time market prices',
                              'Comprehensive pest & disease management',
                              'Farm Management Financial planning tools',
                              'Expert farming guidance',
                              'Comprehensive field data input & analysis',
                              ],
                              route: '/kilimo-mkononi-enterprise',
                              buttonText: 'Explore Enterprise',
                              badge: 'Available Now',
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: _buildPlatformCard(
                              context,
                              isMobile,
                              title: 'Kilimo Mkononi Education',
                              subtitle: 'For Schools & Educational Institutions',
                              description:
                                  'Interactive agricultural learning platform with quizzes, simulations, and built-in student protection features.',
                              icon: LucideIcons.graduationCap,
                              gradient: const LinearGradient(
                                colors: [Color(0xFF7C3AED), Color(0xFF2563EB)],
                              ),
                              highlights: [
                                'Safe, verified user system',
                                'Interactive quizzes & simulations',
                                'Teacher-created content',
                                'Progress tracking & reporting',
                              ],
                              route: '/kilimo-mkononi-education',
                              buttonText: 'Learn About Education',
                              badge: 'Coming Soon',
                            ),
                          ),
                        ],
                      ),
              ),
            ),

            // Shared Features Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF9FAFB),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 32 : 48,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    children: [
                      Text(
                        'Shared Core Features',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: isMobile ? 20 : 28,
                              color: const Color(0xFF1F2937),
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Both platforms are built on the same powerful foundation of agricultural knowledge and tools.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: isMobile ? 14 : 16,
                              color: const Color(0xFF6B7280),
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      _buildSharedFeaturesGrid(context, isMobile),
                    ],
                  ),
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

  Widget _buildPlatformCard(
    BuildContext context,
    bool isMobile, {
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required Gradient gradient,
    required List<String> highlights,
    required String route,
    required String buttonText,
    required String badge,
  }) {
    final bool isComingSoon = badge == 'Coming Soon';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Header with Gradient
          Container(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(icon, color: Colors.white, size: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isComingSoon ? Colors.white.withOpacity(0.2) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        badge,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isComingSoon ? Colors.white : const Color(0xFF047857),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: isMobile ? 20 : 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 13 : 14,
                        color: Colors.white.withOpacity(0.9),
                      ),
                ),
              ],
            ),
          ),

          // Card Body
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 13 : 15,
                        color: const Color(0xFF4B5563),
                        height: 1.6,
                      ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Key Highlights',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: isMobile ? 13 : 14,
                        color: const Color(0xFF1F2937),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                ...highlights.map((highlight) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          LucideIcons.checkCircle2,
                          size: 16,
                          color: Color(0xFF10B981),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            highlight,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontSize: isMobile ? 12 : 14,
                                  color: const Color(0xFF6B7280),
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('KilimoMkononiLandingPage: Navigating to $route');
                      Navigator.pushNamed(context, route);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isComingSoon ? const Color(0xFF7C3AED) : const Color(0xFF047857),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 14 : 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonText,
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(LucideIcons.arrowRight, size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSharedFeaturesGrid(BuildContext context, bool isMobile) {
    final features = [
      {
        'icon': LucideIcons.cloudSun,
        'title': 'Weather Forecasting',
        'description': '5-day forecasts for better planning',
      },
      {
        'icon': LucideIcons.trendingUp,
        'title': 'Market Insights',
        'description': 'Real-time agricultural market data',
      },
      {
        'icon': LucideIcons.bug,
        'title': 'Pest & Disease Management',
        'description': 'Identification and control strategies',
      },
      {
        'icon': LucideIcons.sprout,
        'title': 'Farming Guidance',
        'description': 'Expert tips for multiple crops',
      },
      {
        'icon': LucideIcons.leafyGreen,
        'title': 'Filed Data input ',
        'description': 'Testing and fertility recommendations',
      },
      {
        'icon': LucideIcons.calculator,
        'title': 'Financial Farm Management Tracking',
        'description': 'Manage cost of production, revenues and loans',
      },
      {
        'icon': LucideIcons.bookOpen,
        'title': 'Agricultural Manuals',
        'description': 'Comprehensive farming resources',
      },
    ];

    return Wrap(
      spacing: isMobile ? 12 : 24,
      runSpacing: isMobile ? 12 : 24,
      children: features.map((feature) {
        return SizedBox(
          width: isMobile ? (MediaQuery.of(context).size.width - 40) / 2 : 180,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Column(
              children: [
                Icon(
                  feature['icon'] as IconData,
                  size: isMobile ? 28 : 32,
                  color: const Color(0xFF10B981),
                ),
                const SizedBox(height: 8),
                Text(
                  feature['title'] as String,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F2937),
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  feature['description'] as String,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: isMobile ? 10 : 12,
                        color: const Color(0xFF6B7280),
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}