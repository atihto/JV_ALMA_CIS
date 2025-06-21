import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/responsive_utils.dart';

class ConstructionPage extends StatelessWidget {
  const ConstructionPage({super.key});

  static const List<Map<String, String>> _features = [
    {
      'title': 'Construction Projects',
      'description': 'Specialized upgrades for embassies and infrastructure with a focus on security and precision.',
    },
    {
      'title': 'Facility Management',
      'description': 'Comprehensive services enhanced by proprietary CMMS software for operational efficiency.',
    },
    {
      'title': 'CMMS Integration',
      'description': 'Advanced maintenance management with real-time asset tracking and preventive scheduling.',
    },
  ];

  static const List<Map<String, dynamic>> _projects = [
    {
      'title': 'United States Embassy - American Center Renov, Nairobi.',
      'client': 'Embassy of United States in Kenya',
      'period': 'Sep 2021 – May 2022',
      'description': 'Comprehensive renovation and interior redesign of the ground floor of the Embassy of the United States in Kenya, transforming it into a modern, multifunctional space. The scope included reconfiguration of key areas such as the Maker Lab, Education USA Workroom, Main Program Space, and Staff Offices.',
      'testimonial': '“Our team delivered an innovative and adaptable space that reflects American values while embracing local culture—a seamless fusion of design and function.” — Piergiorgio Di Carmine JV ALMA',
      'imagePaths': [
        'assets/images/construction/american_center_1.jpg',
        'assets/images/construction/american_center_2.jpg',
        'assets/images/construction/american_center_3.jpg',
      ],
    },
    {
      'title': 'United States Embassy - Rosslyn Ridge Renov, Nairobi.',
      'client': 'Embassy of United States, Nairobi',
      'period': 'Sep 2018 – Sep 2023',
      'description': 'Multi-phase renovation across more than 30 residential single units including structural upgrades and modern exterior finishes for long-term resilience and performance.',
      'testimonial': '“ALMA C.I.S. performed reliably and professionally, meeting all regulatory standards and delivering a high-quality result we would trust again.” — Wencke Jacobsen, Contract Specialist, RPSO Frankfurt',
      'imagePaths': [
        'assets/images/construction/rosslyn_ridge_1.jpg',
        'assets/images/construction/rosslyn_ridge_2.jpg',
        'assets/images/construction/rosslyn_ridge_3.jpg',
      ],
    },
    {
      'title': 'United States Embassy - Medical Research Unit Renov, Kisumu.',
      'client': 'NAVFAC',
      'period': 'Sep 2018 – Mar 2021',
      'description': 'Comprehensive renovation of a medical research facility including removal of the existing roof structure and upgrade of electrical and mechanical systems under challenging pandemic conditions.',
      'testimonial': '“The contractor exceeded expectations during an extremely challenging period, delivering consistent quality and strong coordination.” — Brian Tiu, NAVFAC EURAFCENT',
      'imagePaths': [
        'assets/images/construction/medical_research_1.jpg',
      ],
    },
    {
      'title': 'Italian Amb. Residence Renov, Nairobi.',
      'client': 'Italian Embassy Nairobi',
      'period': 'Unknown',
      'description': 'Comprehensive renovation of the Italian Ambassador’s Residence in Karura Close, with a strong focus on modernizing and optimizing building systems for energy efficiency.',
      'testimonial': '“JV ALMACIS provided a detailed and professional assessment, setting a clear path for renovation tailored to the building’s age and structural needs.” — Paolo Rotilli',
      'imagePaths': [
        'assets/images/construction/italian_embassy.jpg',
      ],
    },
    {
      'title': 'Portuguese Embassy Renov, Nairobi.',
      'client': 'Embassy of Portugal',
      'period': 'Mar 2025 – Aug 2025',
      'description': 'Adaptive renovation to transform an existing structure into a modern consular section for the Portuguese Embassy. The project involves full conversion of former spaces into biometric enrollment, visa production, and reception offices.',
      'testimonial': '',
      'imagePaths': [
        'assets/images/construction/portugese_embassy_1.jpg',
        'assets/images/construction/portugese_embassy_2.jpg',
        'assets/images/construction/portugese_embassy_3.jpg',
      ],
    },
    {
      'title': 'Swedish Amb. Residence Renov, Nairobi.',
      'client': 'Embassy of Sweden',
      'period': 'Ongoing',
      'description': 'Ongoing upgrade of the electrical and lighting systems at the Swedish Ambassador’s Residence in Nairobi, with a strong emphasis on safety, energy efficiency, and modern design.',
      'testimonial': '',
      'imagePaths': [
        'assets/images/construction/swedish_embassy.jpg',
      ],
    },
  ];

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    debugPrint('ConstructionPage: Launching URL $url');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('ConstructionPage: Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth <= ResponsiveUtils.tabletBreakpoint;
    debugPrint('ConstructionPage: Building with screenWidth=$screenWidth');

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isMobile)
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF), Color(0xFF065F46)],
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: screenWidth * 0.9),
                    child: Column(
                      children: [
                        Text(
                          'Construction Services',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Part of our Infrastructure Services',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFFBFDBFE),
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF), Color(0xFF065F46)],
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 24 : 48,
                  horizontal: isMobile ? 8 : 16,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: Column(
                      children: [
                        Text(
                          'Construction Services',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: isMobile ? 24 : 32,
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Part of our Infrastructure Services',
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
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 16 : 24,
                horizontal: isMobile ? 12 : 16,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: isMobile
                    ? _buildMobileLayout(context, screenWidth)
                    : _buildDesktopTabletLayout(context, screenWidth, isTablet),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E40AF), Color(0xFF065F46)],
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 16 : 24,
                horizontal: 16,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 896),
                child: Column(
                  children: [
                    Text(
                      'Ready to Build Your Infrastructure Project?',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Contact us to discuss how our infrastructure and diplomatic facility solutions can help realize your vision.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 12 : 14,
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: 'Contact Us',
                      onPressed: () {
                        debugPrint('ConstructionPage: Navigating to /contact from CTA');
                        Navigator.pushNamed(context, '/contact');
                      },
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

  Widget _buildMobileLayout(BuildContext context, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenWidth,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Center(
                child: Icon(
                  LucideIcons.building2,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: Chip(
                  label: const Text('Construction'),
                  backgroundColor: Colors.blue[50],
                  labelStyle: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        _buildContent(context, screenWidth, true),
      ],
    );
  }

  Widget _buildDesktopTabletLayout(BuildContext context, double screenWidth, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            width: isTablet ? screenWidth * 0.3 : screenWidth * 0.3,
            height: isTablet ? 100 : 120,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    LucideIcons.building2,
                    size: isTablet ? 40 : 48,
                    color: Colors.grey[400],
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Chip(
                    label: const Text('Construction'),
                    backgroundColor: Colors.blue[50],
                    labelStyle: TextStyle(
                      color: Colors.blue[700],
                      fontSize: isTablet ? 8 : 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 8 : 16),
            child: _buildContent(context, screenWidth, false),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context, double screenWidth, bool isMobile) {
    final isTablet = screenWidth >= 600 && screenWidth <= ResponsiveUtils.tabletBreakpoint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            LucideIcons.arrowLeft,
            color: Colors.blue[900],
            size: isMobile ? 14 : 16,
          ),
          onPressed: () {
            debugPrint('ConstructionPage: Navigating back');
            Navigator.pop(context); // Changed to pop the current route
          },
          tooltip: 'Back to Construction Detail',
        ),
        Text(
          'Construction Services',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 20 : 24,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Our construction services deliver large-scale infrastructure and specialized diplomatic projects across Kenya, ensuring precision, sustainability, and compliance with international standards.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 12 : 14,
                color: const Color(0xFF4B5563),
              ),
        ),
        const SizedBox(height: 12),
        Text(
          'Key Features',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: isMobile ? 8 : 12,
          runSpacing: 12,
          children: _features.map((feature) {
            return SizedBox(
              width: isMobile ? screenWidth * 0.9 : screenWidth * (isTablet ? 0.45 : 0.25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check,
                    size: 14,
                    color: Color(0xFF16A34A),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feature['title']!,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 12 : 14,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          feature['description']!,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: isMobile ? 12 : 14,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Text(
          'Projects',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _projects.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ProjectCard(
              project: _projects[index],
              onLaunchUrl: _launchUrl,
              isMobile: isMobile,
            ),
          ),
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  final Future<void> Function(String) onLaunchUrl;
  final bool isMobile;

  const _ProjectCard({
    required this.project,
    required this.onLaunchUrl,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ExpansionTile(
        title: Text(
          project['title'],
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2563EB),
                fontSize: isMobile ? 12 : 14,
              ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        childrenPadding: const EdgeInsets.all(12),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: isMobile ? 200 : 300, // Increased height
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: (project['imagePaths'] as List<String>).length == 1
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                      children: (project['imagePaths'] as List<String>).map((imagePath) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              imagePath,
                              height: isMobile ? 200 : 300, // Increased height
                              width: isMobile ? 320 : 480, // Increased width
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: isMobile ? 200 : 300, // Increased height
                                width: isMobile ? 320 : 480, // Increased width
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Icon(LucideIcons.imageOff, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Client: ${project['client']}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 12 : 14,
                        color: const Color(0xFF4B5563),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Period: ${project['period']}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 12 : 14,
                        color: const Color(0xFF4B5563),
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  project['description'],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 12 : 14,
                        color: const Color(0xFF4B5563),
                      ),
                ),
                if (project['testimonial'] != '') ...[
                  const SizedBox(height: 12),
                  Text(
                    'Testimonial',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 14 : 16,
                          color: const Color(0xFF1F2937),
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    project['testimonial'],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: isMobile ? 12 : 14,
                          color: const Color(0xFF4B5563),
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}