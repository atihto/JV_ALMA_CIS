import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class ReferencesPage extends StatelessWidget {
  const ReferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final partners = [
      {
        'name': 'Alma CIS Italy',
        'fullName': 'Alma CIS - Parent Company',
        'category': 'Corporate Partnership',
        'description':
            'Our parent company based in Italy, providing international expertise and global standards.',
        'projects': [
          'International project standards',
          'Technology transfer',
          'Global best practices',
        ],
        'website': 'https://almacis.it/',
        'icon': LucideIcons.shieldCheck,
        'color': const Color(0xFF2563EB),
      },
      {
        'name': 'KALRO',
        'fullName': 'Kenya Agricultural & Livestock Research Organization',
        'category': 'Government Partnership',
        'description':
            'Strategic partnership with Kenya\'s premier agricultural research organization under the Ministry of Agriculture.',
        'projects': [
          'Community empowerment programs',
          'Youth training initiatives',
          'Sustainable farming practices',
        ],
        'website': 'https://www.kalro.org/',
        'icon': LucideIcons.sprout,
        'color': const Color(0xFF16A34A),
      },
      {
        'name': 'MOI University',
        'fullName': 'MOI University',
        'category': 'Government Partnership',
        'description':
            'Strategic partnership with a credited university in Kenya, Moi University for Training, Research and Development',
        'projects': [
          'Community empowerment programs',
          'Youth training initiatives',
        ],
        'website': 'https://www.mu.ac.ke/',
        'icon': LucideIcons.graduationCap,
        'color': const Color(0xFF2563EB),
      },
      {
        'name': 'TIC Group',
        'fullName': 'Technical Inspection Consortium',
        'category': 'Technical Partnership',
        'description':
            'Collaboration for advanced inspection technologies and international standards compliance in oil & gas sector.',
        'projects': [
          'Oil & gas facility inspections',
          'Safety compliance audits',
          'Technical assessments',
        ],
        'website': 'https://tic-inspectiongroup.com/en/',
        'icon': LucideIcons.wrench,
        'color': const Color(0xFFF97316),
      },
      {
        'name': 'Brisma Africa',
        'fullName': 'Brisma Africa Technical Solutions',
        'category': 'Regional Partnership',
        'description':
            'Joint projects for comprehensive oil and gas solutions across the East African region.',
        'projects': [
          'Regional oil & gas solutions',
          'Technical consulting',
        ],
        'website': 'https://brisma-africa.com/',
        'icon': LucideIcons.globe,
        'color': const Color(0xFFEA580C),
      },
      {
        'name': 'KENAFF',
        'fullName': 'Kenya National Farmers Federation',
        'category': 'Corporate Partnership',
        'description':
            'Strategic partnership with Kenya Farmers federation under the Ministry of Agriculture, to connect us with cooperatives that have a nest of farmers.',
        'projects': [
          'Solutions',
          'Technical consulting',
        ],
        'website': 'https://www.kenaff.org/',
        'icon': LucideIcons.globe,
        'color': const Color(0xFFEA580C),
      },
    ];

    final clients = [
      {
        'name': 'Swedish Embassy',
        'project': 'Facility Upgrades',
        'description':
            'Ongoing upgrade of the electrical and lighting systems at the Swedish Ambassador’s Residence in Nairobi, with a strong emphasis on safety, energy efficiency, and modern design.',
        'year': 'Ongoing',
        'category': 'Diplomatic',
      },
      {
        'name': 'Italian Embassy',
        'project': 'Residence Renovation',
        'description':
            'Complete remodeling of embassy residence with focus on security and diplomatic standards.',
        'year': '2020',
        'category': 'Construction',
      },
      {
        'name': 'United States Embassy - Rosslyn Ridge Compound, Nairobi',
        'project': 'Residential Housing Renovation',
        'description':
            'Multi-phase renovation across more than 30 residential single units including structural upgrades, new insulation systems, and modern exterior finishes for long-term resilience with performance',
        'year': 'September 2018 – September 2023',
        'category': 'Diplomatic',
      },
      {
        'name': 'Coffee Cooperatives',
        'project': 'Coffee Core App',
        'description':
            'Digital platform connecting 200+ coffee farmers with cooperatives for better market access.',
        'year': '2024-Present',
        'category': 'Agribusiness & IT Division',
      },
      {
        'name': 'Kenyan Farmers',
        'project': 'Kilimo Mkononi App',
        'description':
            'Mobile application serving over 5,000 farmers with agricultural management tools.',
        'year': '2024-Present',
        'category': 'Agribusiness & IT Division',
      },
      {
        'name': 'Facility Management Services',
        'project': 'Nyumba Smart - CMMS Software/App',
        'description':
            'A facility management maintenance tool to ease operations done in a facility.',
        'year': '2024-Present',
        'category': 'IT Division',
      },
    ];

    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(), // Assuming AppDrawer exists; adjust if needed
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
                    colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF), Color(0xFF065F46)],
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
                          'References & Partners',
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
                          'Building strong partnerships and delivering exceptional results for our clients across East Africa and beyond.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFFBFDBFE),
                                fontSize: isMobile ? 14 : 16,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1280),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Strategic Partners',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF1F2937),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Collaborating with leading organizations to deliver world-class solutions',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    GridView.count(
                      crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                      shrinkWrap: true,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: isMobile ? 2.0 : isTablet ? 1.5 : 1.2,
                      physics: const NeverScrollableScrollPhysics(),
                      children: partners.map((partner) {
                        return _PartnerCard(
                          name: partner['name'] as String,
                          fullName: partner['fullName'] as String,
                          category: partner['category'] as String,
                          description: partner['description'] as String,
                          projects: partner['projects'] as List<dynamic>,
                          website: partner['website'] as String,
                          icon: partner['icon'] as IconData,
                          color: partner['color'] as Color,
                          fontSize: isMobile ? 12 : 14,
                          isMobile: isMobile,
                        );
                      }).toList(),
                    ),
                  ],
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
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1280),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Client References',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF1F2937),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Trusted by leading organizations and institutions across multiple sectors',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    GridView.count(
                      crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                      shrinkWrap: true,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: isMobile ? 1.8 : isTablet ? 1.2 : 1.0,
                      physics: const NeverScrollableScrollPhysics(),
                      children: clients.map((client) {
                        return _ClientCard(
                          name: client['name'] as String,
                          project: client['project'] as String,
                          description: client['description'] as String,
                          year: client['year'] as String,
                          category: client['category'] as String,
                          fontSize: isMobile ? 12 : 14,
                          isMobile: isMobile,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.03,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1280),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Why Partner With Us?',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF1F2937),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'The advantages of working with JV Alma CIS Kenya',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    GridView.count(
                      crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                      shrinkWrap: true,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                      childAspectRatio: isMobile ? 1.8 : isTablet ? 1.2 : 1.0,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _BenefitCard(
                          icon: LucideIcons.award,
                          title: 'Proven Excellence',
                          description:
                              '15+ years of successful project delivery across multiple sectors with international quality standards.',
                          iconColor: const Color(0xFF2563EB),
                          fontSize: isMobile ? 12 : 14,
                          isMobile: isMobile,
                        ),
                        _BenefitCard(
                          icon: LucideIcons.users,
                          title: 'Strong Network',
                          description:
                              'Extensive partnerships with government agencies, international organizations, and industry leaders.',
                          iconColor: const Color(0xFF16A34A),
                          fontSize: isMobile ? 12 : 14,
                          isMobile: isMobile,
                        ),
                        _BenefitCard(
                          icon: LucideIcons.globe,
                          title: 'Global Standards',
                          description:
                              'International expertise through our Italian parent company combined with deep local market knowledge.',
                          iconColor: const Color(0xFFEA580C),
                          fontSize: isMobile ? 12 : 14,
                          isMobile: isMobile,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E40AF), Color(0xFF065F46)],
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
                      'Become Our Next Success Story',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontSize: isMobile ? 20 : 24,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Join our network of satisfied clients and strategic partners. Let’s discuss how we can work together.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: const Color(0xFFBFDBFE),
                            fontSize: isMobile ? 14 : 16,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Wrap(
                      spacing: 16.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.center,
                      children: [
                        CustomButton(
                          text: 'Start Partnership',
                          onPressed: () => Navigator.pushNamed(context, '/contact'),
                          isLarge: isMobile || isTablet,
                        ),
                        CustomButton(
                          text: 'Learn More About Us',
                          onPressed: () => Navigator.pushNamed(context, '/about'),
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

class _PartnerCard extends StatelessWidget {
  final String name;
  final String fullName;
  final String category;
  final String description;
  final List<dynamic> projects;
  final String website;
  final IconData icon;
  final Color color;
  final double fontSize;
  final bool isMobile;

  const _PartnerCard({
    required this.name,
    required this.fullName,
    required this.category,
    required this.description,
    required this.projects,
    required this.website,
    required this.icon,
    required this.color,
    required this.fontSize,
    required this.isMobile,
  });

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      content: Padding(
        padding: EdgeInsets.all(isMobile ? 8.0 : 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: isMobile ? 40.0 : 48.0,
                  height: isMobile ? 40.0 : 48.0,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: isMobile ? 18 : 24),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1F2937),
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        fullName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: fontSize * 0.8,
                              color: const Color(0xFF6B7280),
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Chip(
                  label: Text(category),
                  backgroundColor: Colors.grey[100],
                  labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: fontSize * 0.7,
                        color: const Color(0xFF4B5563),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize * 0.8,
                    color: const Color(0xFF4B5563),
                  ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              'Key Projects:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F2937),
                  ),
            ),
            const SizedBox(height: 4),
            ...projects.map((project) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2563EB),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          project,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: fontSize * 0.8,
                                color: const Color(0xFF4B5563),
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 6),
            InkWell(
              onTap: () => _launchUrl(website),
              child: Row(
                children: [
                  Text(
                    'Visit Website',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: fontSize * 0.8,
                          color: const Color(0xFF2563EB),
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    LucideIcons.externalLink,
                    size: fontSize * 0.8,
                    color: const Color(0xFF2563EB),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClientCard extends StatelessWidget {
  final String name;
  final String project;
  final String description;
  final String year;
  final String category;
  final double fontSize;
  final bool isMobile;

  const _ClientCard({
    required this.name,
    required this.project,
    required this.description,
    required this.year,
    required this.category,
    required this.fontSize,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      content: Padding(
        padding: EdgeInsets.all(isMobile ? 8.0 : 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1F2937),
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                Chip(
                  label: Text(category),
                  backgroundColor: Colors.grey[100],
                  labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: fontSize * 0.7,
                        color: const Color(0xFF4B5563),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              project,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2563EB),
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize * 0.8,
                    color: const Color(0xFF4B5563),
                  ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Text(
                    year,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: fontSize * 0.8,
                          color: const Color(0xFF6B7280),
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                Chip(
                  label: Text(year == 'Ongoing' ? 'Ongoing' : 'Completed'),
                  backgroundColor: year == 'Ongoing' ? const Color(0xFFF97316) : const Color(0xFFE5E7EB),
                  labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: fontSize * 0.7,
                        color: year == 'Ongoing' ? Colors.white : const Color(0xFF4B5563),
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BenefitCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;
  final double fontSize;
  final bool isMobile;

  const _BenefitCard({
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
      content: Padding(
        padding: EdgeInsets.all(isMobile ? 8.0 : 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: isMobile ? 32 : 48, color: iconColor),
            const SizedBox(height: 6),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                  ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize * 0.8,
                    color: const Color(0xFF4B5563),
                  ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}