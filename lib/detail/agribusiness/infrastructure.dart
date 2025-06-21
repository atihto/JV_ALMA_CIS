import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/responsive_utils.dart';
import '../../detail/agribusiness/program_signup.dart';

class InfrastructurePage extends StatelessWidget {
  const InfrastructurePage({super.key});

  static const List<Map<String, String>> _features = [
    {
      'title': 'Water Storage and Distribution',
      'description': 'Designing and installing elevated water tanks and pipelines for irrigation.'
    },
    {
      'title': 'Solar-Powered Systems',
      'description': 'Implementing solar energy for sustainable irrigation and pumping.'
    },
    {
      'title': 'Irrigation Network Expansion',
      'description': 'Developing extensive irrigated farmland to boost agricultural output.'
    },
  ];

  static const List<Map<String, dynamic>> _projects = [
    {
      'funded by': 'Italian Agency for Cooperation Development (AICS)',
      'title': 'Sigor Wei Wei Integrated Irrigation Scheme – West Pokot, Kenya',
      'client': 'Kerio Valley Development Authority (KVDA)',
      'period': 'June 2017 – July 2020',
      'description': 'Major civil works for a large-scale irrigation scheme in a remote region, including installation of 29 km of underground PVC and HDPE pipelines to irrigate over 325 hectares. The project also involved bush clearing of 600 hectares, construction and rehabilitation of 32 km of farm roads and five Irish bridges, refurbishment of 290 ha of existing irrigation systems, and construction of fully furnished accommodation and support facilities.',
      'testimonial': '“JV ALMA C.I.S. delivered extensive infrastructure in a complex rural setting, significantly boosting the region’s agricultural productivity.” — Eng. Daniel Kimutai, KVDA',
      'imagePaths': [
        'assets/images/agribusiness/sigor_1.jpg',
        'assets/images/agribusiness/sigor_2.jpg',
        'assets/images/agribusiness/sigor_3.jpg',
        'assets/images/agribusiness/sigor_4.jpg',
      ],
    },
    {
      'title': 'Solar-Powered Irrigation Scheme – Kapluk, Baringo, Kenya',
      'client': 'Italian Agency for Cooperation Development (AICS)',
      'period': 'June 2021 – May 2023',
      'description': 'Design-build execution of a solar-powered irrigation system. The scope included survey and design of the distribution network and related pump system, 10,000-liter tanks, hydrants, and all associated valves. The project engaged the local community extensively, providing employment opportunities while ensuring technical supervision and quality control.',
      'testimonial': '“As a farmer and resident of Kapluk, I saw firsthand how JV ALMACIS worked with our community—not just to build an irrigation system, but to build our confidence and capacity. Thanks to their commitment, we now have water, jobs, and a future.” — Simion Yator, Kiptolelyo Self Help Group Chairman.',
      'imagePaths': [
        'assets/images/agribusiness/kapluk_1.jpg',
        'assets/images/agribusiness/kapluk_2.jpg',
        'assets/images/agribusiness/kapluk_3.jpg',
      ],
    },
    {
      'title': 'Makueni Irrigation Scheme',
      'client': 'Greenland Farm',
      'period': '',
      'description': 'Solar-powered irrigation system and agri-enterprise pilot in Makueni County. Beyond construction, JV ALMACIS introduced organic farming methods and trained farmers on sustainable practices. The project catalyzed local agri-enterprise and reduced chemical inputs for improved livelihoods.',
      'testimonial': '“As Greenland Farm, we witnessed how JV ALMACIS combined innovation with hands-on support—delivering not just infrastructure, but real impact. With their guidance, we\'ve adopted sustainable practices, improved our yields, and built stronger ties with the market.” — Greenland Farm Management',
      'imagePaths': [
        'assets/images/agribusiness/makueni_1.jpg',
        'assets/images/agribusiness/makueni_2.jpg',
      ],
    },
  ];

  void _showSignupDialog(BuildContext context) {
    debugPrint('CapacityBuildingPage: Opening signup dialog');
    showDialog(
      context: context,
      builder: (context) => const ProgramSignupPage(),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    debugPrint('CapacityBuildingPage: Launching URL $url');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('CapacityBuildingPage: Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;
    final isTablet = screenWidth >= ResponsiveUtils.mobileBreakpoint &&
        screenWidth <= ResponsiveUtils.tabletBreakpoint;
    debugPrint('CapacityBuildingPage: Building with screenWidth=$screenWidth');

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      'Ready to Build Infrastructure in Your Community?',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Join our programs to transform your community.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 12 : 14,
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: 'Register for Programs',
                          onPressed: () => _showSignupDialog(context),
                          isOutline: true,
                        ),
                        const SizedBox(width: 12),
                        CustomButton(
                          text: 'Contact Us',
                          onPressed: () {
                            debugPrint('CapacityBuildingPage: Navigating to /contact');
                            Navigator.pushNamed(context, '/contact');
                          },
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
                  LucideIcons.bookOpen,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: Chip(
                  label: const Text('Infrastructure'),
                  backgroundColor: Colors.green[50],
                  labelStyle: TextStyle(
                    color: Colors.green[700],
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
                    LucideIcons.bookOpen,
                    size: isTablet ? 40 : 48,
                    color: Colors.grey[400],
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Chip(
                    label: const Text('Infrastructure'),
                    backgroundColor: Colors.green[50],
                    labelStyle: TextStyle(
                      color: Colors.green[700],
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
    final isTablet = screenWidth >= ResponsiveUtils.mobileBreakpoint &&
        screenWidth <= ResponsiveUtils.tabletBreakpoint;

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
            debugPrint('CapacityBuildingPage: Attempting to navigate back');
            try {
              Navigator.pop(context);
            } catch (e) {
              debugPrint('CapacityBuildingPage: Navigation error: $e');
              Navigator.pushNamed(context, '/agribusiness');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to go back, redirected to Agribusiness')),
              );
            }
          },
          tooltip: 'Back to Agribusiness',
        ),
        Text(
          'Infrastructure',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 20 : 24,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'JV Alma CIS Kenya’s infrastructure programs empower rural communities through targeted development and sustainable solutions.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                fontSize: isMobile ? 14 : 16,
              ),
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
                  height: isMobile ? 180 : 240,
                  child: (project['imagePaths'] as List<String>).length == 1
                      ? Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              project['imagePaths'][0],
                              height: isMobile ? 180 : 240,
                              width: isMobile ? 300 : 400,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: isMobile ? 180 : 240,
                                width: isMobile ? 300 : 400,
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Icon(LucideIcons.imageOff, color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: (project['imagePaths'] as List<String>).map((imagePath) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    imagePath,
                                    height: isMobile ? 180 : 240,
                                    width: isMobile ? 300 : 400,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      height: isMobile ? 180 : 240,
                                      width: isMobile ? 300 : 400,
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
            ),
          ),
        ],
      ),
    );
  }
}