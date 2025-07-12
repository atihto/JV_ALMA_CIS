import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import '../it/cmms_page.dart';

class ConstructionDetail extends StatelessWidget {
  const ConstructionDetail({super.key});

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
                        debugPrint('ConstructionDetail: Navigating back to /business-units');
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
                              'Construction & Facility Management',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: isMobile ? 24 : 32,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Comprehensive solutions across construction and facility management sectors, powered by cutting-edge technology and decades of expertise.',
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
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 16 : 24,
                horizontal: isMobile ? 12 : 16,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildConstructionSection(context, screenWidth, isMobile),
                    const SizedBox(height: 24),
                    _buildFacilitySection(context, screenWidth, isMobile),
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

  Widget _buildConstructionSection(BuildContext context, double screenWidth, bool isMobile) {
    return Container(
      color: const Color(0xFFF9FAFB),
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  LucideIcons.building2,
                  size: 28,
                  color: Colors.blue[700],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Construction Services',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: isMobile ? 20 : 24,
                      color: const Color(0xFF1F2937),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildConstructionContent(context, screenWidth, isMobile),
        ],
      ),
    );
  }

  Widget _buildConstructionContent(BuildContext context, double screenWidth, bool isMobile) {
    const List<Map<String, String>> features = [
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

    final List<Map<String, dynamic>> projects = [
      {
        'title': 'United States Embassy - American Center Renov, Nairobi.',
        'client': 'Embassy of United States in Kenya',
        'period': 'Sep 2021 – May 2022',
        'description': 'Comprehensive renovation and interior redesign of the ground floor of the Embassy of the United States in Kenya, transforming it into a modern, multifunctional space. The scope included reconfiguration of key areas such as the Maker Lab, Education USA Workroom, Main Program Space, and Staff Offices.',
        'testimonial': '"Our team delivered an innovative and adaptable space that reflects American values while embracing local culture—a seamless fusion of design and function." — Piergiorgio Di Carmine JV ALMA C.I.S.',
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
        'testimonial': '"JV ALMA C.I.S. performed reliably and professionally, meeting all regulatory standards and delivering a high-quality result we would trust again." — Wencke Jacobsen, Contract Specialist, RPSO Frankfurt',
        'imagePaths': [
          'assets/images/construction/rosslyn_ridge_1.jpg',
          'assets/images/construction/rosslyn_ridge_2.jpg',
          'assets/images/construction/rosslyn_ridge_3.jpg',
        ],
      },
      {
        'title': 'United States - Medical Research Unit Renov, Kisumu.',
        'client': 'NAVFAC',
        'period': 'Sep 2018 – Mar 2021',
        'description': 'Comprehensive renovation of a medical research facility including removal of the existing roof structure and upgrade of electrical and mechanical systems under challenging pandemic conditions.',
        'testimonial': '"The contractor exceeded expectations during an extremely challenging period, delivering consistent quality and strong coordination." — Brian Tiu, NAVFAC EURAFCENT',
        'imagePaths': [
          'assets/images/construction/medical_research_1.jpg',
        ],
      },
      {
        'title': 'Italian Ambassador\'s Residence Renov, Nairobi.',
        'client': 'Italian Embassy Nairobi',
        'period': 'May 2024 - December 2024',
        'description': 'Comprehensive renovation of the Italian Ambassador\'s Residence in Karura Close, with a strong focus on modernizing and optimizing building systems for energy efficiency.',
        'testimonial': '"JV ALMA C.I.S provided a detailed and professional assessment, setting a clear path for renovation tailored to the building\'s age and structural needs." — Paolo Rotilli',
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
        ],
      },
      {
        'title': 'Swedish Ambassador\'s Residence Renov, Nairobi.',
        'client': 'Embassy of Sweden',
        'period': 'Ongoing',
        'description': 'Ongoing upgrade of the electrical and lighting systems at the Swedish Ambassador\'s Residence in Nairobi, with a strong emphasis on safety, energy efficiency, and modern design.',
        'testimonial': '',
        'imagePaths': [
          'assets/images/construction/swedish_embassy.jpg',
        ],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our construction services deliver large-scale infrastructure and specialized diplomatic missions across Kenya, ensuring precision, sustainability, and compliance with international standards.',
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
        Column(
          children: features.map((feature) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8),
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
          itemCount: projects.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ProjectCard(
              project: projects[index],
              isMobile: isMobile,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFacilitySection(BuildContext context, double screenWidth, bool isMobile) {
    return Container(
      color: const Color(0xFFF9FAFB),
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  LucideIcons.database,
                  size: 28,
                  color: Colors.purple[700],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Facility Management Services',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: isMobile ? 20 : 24,
                      color: const Color(0xFF1F2937),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildFacilityContent(context, screenWidth, isMobile),
        ],
      ),
    );
  }

  Widget _buildFacilityContent(BuildContext context, double screenWidth, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Facility management (FM) involves the coordination of space, infrastructure, and services to ensure that buildings and facilities operate efficiently and safely. It encompasses maintenance, operations, and strategic planning to support the core functions of an organization.\n\nOur approach integrates our proprietary NyumbaSmart - Computerized Maintenance Management System (CMMS), developed by our IT Division, to streamline these processes.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 12 : 14,
                color: const Color(0xFF4B5563),
              ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: InkWell(
            onTap: () {
              debugPrint('FacilityManagementPage: Navigating to CMMSPage');
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CmmsPage()));
            },
            child: Row(
              children: [
                Icon(
                  LucideIcons.database,
                  color: const Color(0xFF16A34A),
                  size: isMobile ? 20 : 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NyumbaSmart - Computerized Maintenance Management System (CMMS)',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 12 : 14,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Automate work orders, track assets, and schedule maintenance\nEnhance efficiency with our CMMS solution.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: isMobile ? 11 : 13,
                              color: const Color(0xFF4B5563),
                            ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  LucideIcons.chevronRight,
                  color: const Color(0xFF6B7280),
                  size: isMobile ? 16 : 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  final bool isMobile;

  const _ProjectCard({
    required this.project,
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
          maxLines: 2,
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
                if (_shouldCenterImage(project))
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        (project['imagePaths'] as List<String>)[0],
                        height: isMobile ? 200 : 300,
                        width: isMobile ? 320 : 480,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: isMobile ? 200 : 300,
                          width: isMobile ? 320 : 480,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(LucideIcons.imageOff, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  SizedBox(
                    height: isMobile ? 200 : 300,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: (project['imagePaths'] as List<String>).map((imagePath) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                imagePath,
                                height: isMobile ? 200 : 300,
                                width: isMobile ? 320 : 480,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Container(
                                  height: isMobile ? 200 : 300,
                                  width: isMobile ? 320 : 480,
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

  bool _shouldCenterImage(Map<String, dynamic> project) {
    return (project['imagePaths'] as List<String>).length == 1;
  }
}