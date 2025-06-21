import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final testimonials = [
      {
        'quote':
            '"I can now analyze pests and diseases affecting my farm from the comfort of my home. JV ALMA CIS agronomists offer real-time insights on the remedies to take when my crop has been affected."',
        'author': 'Gideon',
        'location': 'Farmer in Wote, Makueni County',
      },
      {
        'quote':
            '"We would like to applaud JV ALMA CIS for their effort in ensuring the success of the project. Through the use of technology, our yields have increased and food scarcity is now a thing of the past."',
        'author': 'Job Kibet',
        'location': 'Farmer in Kapluk, Baringo County',
      },
      {
        'quote':
            '"I can not say enough about what a positive and valuable experience working with JV ALMA CIS, and having our own fabulous intern has been for the farm and me personally."',
        'author': 'Oseo Geofrey',
        'location': '',
      },
    ];

    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Header(onMenuPressed: () => scaffoldKey.currentState?.openDrawer()),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: isMobile ? screenHeight * 0.4 : screenHeight * 0.5,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF)],
                  ),
                ),
                padding: EdgeInsets.all(isMobile ? 16 : 24),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'About JV Alma CIS',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                                fontSize: isMobile ? 24 : 28,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          'Building sustainable futures across East Africa',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFFBFDBFE),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Wrap(
                          spacing: screenWidth * 0.03,
                          runSpacing: screenHeight * 0.015,
                          alignment: WrapAlignment.center,
                          children: [
                            Chip(
                              label: Text(
                                'Est. 2019',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Colors.white,
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              backgroundColor: Colors.black.withOpacity(0.3),
                            ),
                            Chip(
                              label: Text(
                                'Nairobi Headquarters',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Colors.white,
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              backgroundColor: Colors.black.withOpacity(0.3),
                            ),
                            Chip(
                              label: Text(
                                'Multi-Sector Expertise',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Colors.white,
                                      fontSize: isMobile ? 14 : 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              backgroundColor: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.03,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: CustomCard(
                  content: Padding(
                    padding: EdgeInsets.all(isMobile ? 12 : 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Our Story',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: const Color(0xFF1F2937),
                                fontSize: isMobile ? 20 : 24,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          'JV Alma CIS Kenya brings Italian expertise to East Africa since 2019.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFF4B5563),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          'We deliver projects for international clients across construction, agribusiness, and oil & gas services, adhering to all applicable codes and standards. Its agribusiness work supports food security through rural development and smart farming tools like CoffeeCore and KilimoMkononi. The company also provides regional inspection services in the oil & gas sector and offers a custom CMMS platform for facility maintenance and asset management.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFF4B5563),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomButton(
                          text: 'Get in Touch',
                          onPressed: () => Navigator.pushNamed(context, '/contact'),
                          icon: LucideIcons.arrowRight,
                          isLarge: isMobile || isTablet,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomCard(
                          hoverEffect: false,
                          content: Padding(
                            padding: EdgeInsets.all(isMobile ? 12 : 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Our Mission',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: const Color(0xFF1F2937),
                                        fontSize: isMobile ? 18 : 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                Text(
                                  'To empower communities through innovative technology and partnerships.',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: const Color(0xFF4B5563),
                                        fontSize: isMobile ? 12 : 14,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenHeight * 0.015),
                                Wrap(
                                  spacing: screenWidth * 0.03,
                                  runSpacing: screenHeight * 0.015,
                                  children: [
                                    _StatCard(
                                      title: '5+',
                                      subtitle: 'Years in Kenya',
                                      fontSize: isMobile ? 12 : 14,
                                    ),
                                    _StatCard(
                                      title: '15+',
                                      subtitle: 'Major Projects',
                                      fontSize: isMobile ? 12 : 14,
                                    ),
                                    _StatCard(
                                      title: '1000+',
                                      subtitle: 'Lives Impacted',
                                      fontSize: isMobile ? 12 : 14,
                                    ),
                                    _StatCard(
                                      title: '5+',
                                      subtitle: 'Key Partners',
                                      fontSize: isMobile ? 12 : 14,
                                    ),
                                  ],
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
            Container(
              color: const Color(0xFFF9FAFB),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.03,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: CustomCard(
                  content: Padding(
                    padding: EdgeInsets.all(isMobile ? 12 : 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          'The principles that guide everything we do',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFF4B5563),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        GridView.count(
                          crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                          shrinkWrap: true,
                          crossAxisSpacing: screenWidth * 0.03,
                          mainAxisSpacing: screenHeight * 0.02,
                          childAspectRatio: isMobile ? 2.5 : isTablet ? 2.4 : 2.3,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _ValueCard(
                              icon: LucideIcons.target,
                              title: 'Excellence',
                              description: 'Delivering quality that exceeds expectations.',
                              iconColor: const Color(0xFF3B82F6),
                              fontSize: isMobile ? 12 : 14,
                              isMobile: isMobile,
                            ),
                            _ValueCard(
                              icon: LucideIcons.users,
                              title: 'Collaboration',
                              description: 'Working closely with partners for shared goals.',
                              iconColor: const Color(0xFF16A34A),
                              fontSize: isMobile ? 12 : 14,
                              isMobile: isMobile,
                            ),
                            _ValueCard(
                              icon: LucideIcons.lightbulb,
                              title: 'Innovation',
                              description: 'Embracing technology for sustainable value.',
                              iconColor: const Color(0xFF9333EA),
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
            Container(
              color: const Color(0xFFF9FAFB),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.03,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: CustomCard(
                  content: Padding(
                    padding: EdgeInsets.all(isMobile ? 12 : 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Leadership Team',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: const Color(0xFF1F2937),
                                fontSize: isMobile ? 20 : 24,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          'Experienced professionals driving our success',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFF4B5563),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        GridView.count(
                          crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                          shrinkWrap: true,
                          crossAxisSpacing: screenWidth * 0.03,
                          mainAxisSpacing: screenHeight * 0.02,
                          childAspectRatio: isMobile ? 2.5 : isTablet ? 2.4 : 2.3,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            _LeadershipCard(
                              initials: 'PD',
                              name: 'Piergiorgio Di Carmine',
                              title: 'Managing Director',
                              description: 'Leading international project management.',
                              gradient: const LinearGradient(
                                colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
                              ),
                              fontSize: isMobile ? 12 : 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color: const Color(0xFFF9FAFB),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.03,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'What People Say About Us',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: const Color(0xFF1F2937),
                            fontSize: isMobile ? 20 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Hear from our community about the impact of our work',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFF4B5563),
                            fontSize: isMobile ? 14 : 16,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    GridView.count(
                      crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                      shrinkWrap: true,
                      crossAxisSpacing: screenWidth * 0.03,
                      mainAxisSpacing: screenHeight * 0.03,
                      childAspectRatio: isMobile ? 1.8 : isTablet ? 2.0 : 2.2,
                      physics: const NeverScrollableScrollPhysics(),
                      children: testimonials
                          .map((testimonial) => _TestimonialCard(
                                quote: testimonial['quote'] as String,
                                author: testimonial['author'] as String,
                                location: testimonial['location'] as String,
                                fontSize: isMobile ? 12 : 14,
                                isMobile: isMobile,
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E40AF), Color(0xFF1E3A8A)],
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? screenHeight * 0.03 : screenHeight * 0.04,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1200),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Ready to Work Together?',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontSize: isMobile ? 20 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Discover how we can bring your vision to life.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFFBFDBFE),
                            fontSize: isMobile ? 14 : 16,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Wrap(
                      spacing: 16.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.center,
                      children: [
                        CustomButton(
                          text: 'Contact Us',
                          onPressed: () => Navigator.pushNamed(context, '/contact'),
                          isLarge: isMobile || isTablet,
                        ),
                        CustomButton(
                          text: 'View Our Projects',
                          onPressed: () => Navigator.pushNamed(context, '/projects'),
                          isOutline: true,
                          isLarge: isMobile || isTablet,
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
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double fontSize;

  const _StatCard({required this.title, required this.subtitle, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                    fontSize: fontSize,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF4B5563),
                    fontSize: fontSize * 0.8,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _ValueCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;
  final double fontSize;
  final bool isMobile;

  const _ValueCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.iconColor,
    required this.fontSize,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      hoverEffect: true,
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: isMobile ? 20 : 24, color: iconColor),
            const SizedBox(height: 6),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF1F2937),
                    fontSize: fontSize,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF4B5563),
                    fontSize: fontSize * 0.8,
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

class _LeadershipCard extends StatelessWidget {
  final String initials;
  final String name;
  final String title;
  final String description;
  final LinearGradient gradient;
  final double fontSize;

  const _LeadershipCard({
    required this.initials,
    required this.name,
    required this.title,
    required this.description,
    required this.gradient,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      hoverEffect: false,
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: gradient,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  initials,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: fontSize * 0.9,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                    fontSize: fontSize,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF6B7280),
                    fontSize: fontSize * 0.8,
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF4B5563),
                    fontSize: fontSize * 0.8,
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

class _TestimonialCard extends StatelessWidget {
  final String quote;
  final String author;
  final String location;
  final double fontSize;
  final bool isMobile;

  const _TestimonialCard({
    required this.quote,
    required this.author,
    required this.location,
    required this.fontSize,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      hoverEffect: false,
      content: Padding(
        padding: EdgeInsets.all(isMobile ? 10 : 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.quote,
              size: isMobile ? 18 : 20,
              color: const Color(0xFF3B82F6),
            ),
            const SizedBox(height: 6),
            Flexible(
              child: Text(
                quote,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF4B5563),
                      fontSize: fontSize * 0.9,
                      fontStyle: FontStyle.italic,
                      height: 1.4,
                    ),
                maxLines: isMobile ? 5 : 6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              author,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF1F2937),
                    fontSize: fontSize * 0.9,
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              location,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF6B7280),
                    fontSize: fontSize * 0.7,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}