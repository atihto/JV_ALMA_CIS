import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:jv_alma_cis/widgets/header.dart';
import 'package:jv_alma_cis/widgets/custom_button.dart';
import 'package:jv_alma_cis/widgets/custom_card.dart';
import 'package:jv_alma_cis/widgets/footer.dart';
import 'package:jv_alma_cis/routing/router.dart';

class CareersPage extends StatelessWidget {
  const CareersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return AppScaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hero Section
            ClipRRect(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: isMobile ? screenHeight * 0.7 : screenHeight * 0.6,
                ),
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
                  vertical: isMobile ? screenHeight * 0.06 : screenHeight * 0.08,
                  horizontal: screenWidth * 0.04,
                ),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Careers at JV ALMA C.I.S',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                                fontSize: isMobile ? 24 : 32,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Join our team to shape the future of East Africa',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFFBFDBFE),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          'Be part of innovation and impact',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFFBFDBFE),
                                fontSize: isMobile ? 12 : 14,
                                fontWeight: FontWeight.w600,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Rest of the content remains the same...
            // Intro Section
            Container(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? screenHeight * 0.03 : screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: Column(
                  children: [
                    Text(
                      'Careers at JV ALMA C.I.S',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: const Color(0xFF111827),
                            fontSize: isMobile ? 24 : 32,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Join us at JV ALMA C.I.S and become part of a leading global team in Construction, Agribusiness,Oil & Gas Services and Technology Solutions.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFF4B5563),
                            fontSize: isMobile ? 14 : 16,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Expertise, creativity, and commitment to excellence are our core values.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFF111827),
                            fontSize: isMobile ? 14 : 16,
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'These principles are deeply embedded in our culture, shaping our vision, driving our actions, and elevating the standards by which we contribute to the success of our clients and partners.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFF4B5563),
                            fontSize: isMobile ? 14 : 16,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            // Core Values
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: CustomCard(
                  content: Padding(
                    padding: EdgeInsets.all(isMobile ? screenWidth * 0.06 : screenWidth * 0.04),
                    child: Column(
                      children: [
                        Text(
                          'Our Core Values',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: const Color(0xFF1F2937),
                                fontSize: isMobile ? 20 : 24,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'The foundation of our culture',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFF4B5563),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        GridView.count(
                          crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                          shrinkWrap: true,
                          crossAxisSpacing: screenWidth * 0.03,
                          mainAxisSpacing: screenHeight * 0.02,
                          childAspectRatio: isMobile ? 1.3 : isTablet ? 1.2 : 1.1,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _ValueCard(
                              icon: LucideIcons.target,
                              title: 'Expertise',
                              description: 'Technical proficiency in all we do.',
                              iconColor: const Color(0xFF2563EB),
                              fontSize: isMobile ? 12 : 14,
                              isMobile: isMobile,
                            ),
                            _ValueCard(
                              icon: LucideIcons.lightbulb,
                              title: 'Creativity',
                              description: 'Innovative problem-solving.',
                              iconColor: const Color(0xFF2563EB),
                              fontSize: isMobile ? 12 : 14,
                              isMobile: isMobile,
                            ),
                            _ValueCard(
                              icon: LucideIcons.trendingUp,
                              title: 'Excellence',
                              description: 'Commitment to quality.',
                              iconColor: const Color(0xFF2563EB),
                              fontSize: isMobile ? 12 : 14,
                              isMobile: isMobile,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Open Positions
            Container(
              color: const Color(0xFFF9FAFB),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: CustomCard(
                  content: Padding(
                    padding: EdgeInsets.all(isMobile ? screenWidth * 0.06 : screenWidth * 0.04),
                    child: Column(
                      children: [
                        Text(
                          'Open Positions',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: const Color(0xFF1F2937),
                                fontSize: isMobile ? 20 : 24,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          "We're always looking for talent",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFF4B5563),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        CustomCard(
                          hoverEffect: false,
                          content: Padding(
                            padding: EdgeInsets.all(isMobile ? screenWidth * 0.06 : screenWidth * 0.04),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    LucideIcons.users,
                                    size: 40,
                                    color: Color(0xFF2563EB),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.015),
                                Text(
                                  'No Current Openings',
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF1F2937),
                                        fontSize: isMobile ? 14 : 16,
                                      ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  'Send your resume for future opportunities.',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: const Color(0xFF4B5563),
                                        fontSize: isMobile ? 12 : 14,
                                      ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Call to Action
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1E40AF), Color(0xFF065F46)],
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Ready to Make a Difference?',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Colors.white,
                            fontSize: isMobile ? 20 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Join a team that values expertise, creativity, and excellence. Contact us to explore future opportunities.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFFEFF6FF),
                            fontSize: isMobile ? 14 : 16,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CustomButton(
                      text: 'Get in Touch',
                      onPressed: () => Navigator.of(context).pushNamed('/contact'),
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

class _ValueCard extends StatelessWidget {
  const _ValueCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.iconColor,
    required this.fontSize,
    required this.isMobile,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;
  final double fontSize;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomCard(
      hoverEffect: false,
      content: Padding(
        padding: EdgeInsets.all(isMobile ? 12 : 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                icon,
                size: 32,
                color: iconColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F2937),
                    fontSize: fontSize,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF4B5563),
                    fontSize: fontSize - 2,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
