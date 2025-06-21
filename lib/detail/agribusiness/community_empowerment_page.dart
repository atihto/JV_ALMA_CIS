import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/responsive_utils.dart';
import 'program_signup.dart';

class CommunityEmpowermentPage extends StatelessWidget {
  const CommunityEmpowermentPage({super.key});

  static const List<Map<String, String>> _features = [
    {
      'title': 'Training Young Professionals',
      'description': 'Training in multidisciplinary skills (engineering, agribusiness, irrigation design) with academic partnerships.'
    },
    {
      'title': 'Community Organization',
      'description': 'Forming self-help groups (e.g., Kiptolelyo SHG) to transition to coordinated, economically viable units.'
    },
    {
      'title': 'Leadership Development',
      'description': 'Building local management boards for irrigation schemes to enable collective economic decisions.'
    },
    {
      'title': 'Promoting Sustainability',
      'description': 'Encouraging self-reliance, co-investment, loan repayment, and shared infrastructure ownership.'
    },
  ];

  static const Map<String, dynamic> _content = {
    'description': 'JV ALMACIS approaches capacity building as a transformative process designed to equip individuals and communities with the skills, knowledge, and structures needed to drive their own development. In the context of rural agribusiness, this involves:',
    'coreServices': [
      {
        'title': 'Community Engagement',
        'description': '• Formation of cooperatives and self-help groups\n• Capacity-building and practical training programs\n• Market linkage and business support initiatives',
        'imagePaths': [
          'assets/images/agribusiness/community_empowerment_1.jpg',
          'assets/images/agribusiness/community_empowerment_2.jpg',
        ],
      },
      {
        'title': 'Soil Health and Controlled Use of Pesticides',
        'description': '• Soil sampling and analysis to support fertility management\n• Recommendations for responsible fertilizer and pesticide use\n• Tailored nutrient application plans based on farm-specific data',
        'imagePaths': [
          'assets/images/agribusiness/soil_health_1.jpg',
          'assets/images/agribusiness/soil_health_2.jpg',
        ],
      },
      {
        'title': 'Data Processing',
        'description': '• Collection and analysis of real-time field data\n• Crop and pest tracking for precision farming\n• Integration of mobile technology to support informed decisions',
        'imagePaths': [
          'assets/images/agribusiness/data_processing.jpg',
        ],
      },
      {
        'title': 'Value Chain Enhancement',
        'description': '• Support for branding and packaging of farm products\n• Techniques and training for value addition and post-harvest processing',
        'imagePaths': [
          'assets/images/agribusiness/value_chain_1.jpg',
          'assets/images/agribusiness/value_chain_2.jpg',
        ],
      },
      {
        'title': 'Agribusiness Education in Schools',
        'description': '• Initiatives to embed agribusiness concepts in early education\n• Practical agriculture clubs to cultivate entrepreneurship\n• Youth engagement strategies to reduce rural-urban migration',
        'imagePaths': [
          'assets/images/agribusiness/agribusiness_in_schools_1.jpg',
          'assets/images/agribusiness/agribusiness_in_schools_2.jpg',
        ],
      },
      {
        'title': 'Training Programs',
        'description': '• Training young professionals in multidisciplinary skills (engineering, agribusiness, irrigation design) through technical modules delivered in partnership with academic institutions.',
        'imagePaths': [
          'assets/images/agribusiness/training_1.jpg',
          'assets/images/agribusiness/training_2.jpg',
        ],
      },
      {
        'title': 'Leadership Development',
        'description': '•	Building leadership within communities by forming local management boards for irrigation schemes and empowering them to make economic decisions collectively.\n •	Promoting sustainability by emphasizing self-reliance over aid-dependence ("beyond the mentality of grants")—encouraging co-investment, structured loan repayment, and shared ownership of infrastructure.',
        'imagePaths': [
          'assets/images/agribusiness/building_leadership.jpg',
          'assets/images/agribusiness/sustainability.jpg',
        ],
      },
      {
        'title': 'Formation of Self-Help Groups',
        'description': '•	Organizing communities into formal groups, such as self-help groups (e.g., Kiptolelyo SHG), to transition from fragmented subsistence farming to coordinated, economically viable units.',
        'imagePaths': [
           'assets/images/agribusiness/group_cert.jpg',
        ],
      },
    ],
  };

  static const Map<String, dynamic> _partnerships = {
    'title': 'Partnership With Institutions',
    'partnerships': [
      {
        'name': 'KALRO & JV ALMACIS',
        'signatories': [
          '• Piergiorgio Di Carmine – CEO, JV ALMACIS',
          '• Dr. Eliud Kireger – Director General, KALRO',
          '• Patricia Ngutu – Corporation Secretary, KALRO',
        ],
        'impact': 'The MoU empowers KALRO to provide technical support, capacity building, irrigation supervision, soil/water analysis, and ESIA services. This partnership grounds JV ALMACIS’s field projects in scientific rigor, enhancing sustainability and agricultural productivity.',
      },
      {
        'name': 'Moi University & JV ALMACIS',
        'signatories': [
          '• Piergiorgio Di Carmine – CEO, JV ALMACIS',
          '• Dr. Kefa Chepkwony – Representative, Moi University',
        ],
        'impact': 'Through a 4-month agribusiness training program, Moi University trained students, developed business models, and coordinated local engagement. The MoU strengthens academic-practical collaboration and builds youth capacity for rural innovation.',
      },
    ],
  };

  void _showSignupDialog(BuildContext context) {
    debugPrint('CommunityEmpowermentPage: Opening signup dialog');
    showDialog(
      context: context,
      builder: (context) => const ProgramSignupPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;
    final isTablet = screenWidth >= ResponsiveUtils.mobileBreakpoint &&
        screenWidth <= ResponsiveUtils.tabletBreakpoint;
    debugPrint('CommunityEmpowermentPage: Building with screenWidth=$screenWidth');

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
                            debugPrint('CommunityEmpowermentPage: Navigating to /contact');
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
          height: 80, // Fixed height to prevent elongation
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Center(
                child: Icon(
                  LucideIcons.users,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: Chip(
                  label: const Text(
                    'Capacity Building and Community Empowerment',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
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
            height: isTablet ? 100 : 120, // Fixed height to prevent elongation
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    LucideIcons.users,
                    size: isTablet ? 40 : 48,
                    color: Colors.grey[400],
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Chip(
                    label: const Text(
                      'Capacity Building and Community Empowerment',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
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
            debugPrint('CommunityEmpowermentPage: Navigating back to /agribusiness');
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/agribusiness',
              (route) => false,
            );
          },
          tooltip: 'Back to Agribusiness',
        ),
        Text(
          'Capacity Building and Community Empowerment',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 20 : 24,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          _content['description'],
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
          'Core Services',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        ..._content['coreServices'].map((service) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service['title'],
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: isMobile ? 14 : 16,
                        color: const Color(0xFF1F2937),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  service['description'],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 12 : 14,
                        color: const Color(0xFF4B5563),
                      ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: isMobile ? 120 : 180,
                  child: (service['imagePaths'] as List<String>).length == 1
                      ? Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              service['imagePaths'][0],
                              height: isMobile ? 120 : 180,
                              width: isMobile ? 200 : 300,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                height: isMobile ? 120 : 180,
                                width: isMobile ? 200 : 300,
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
                            children: (service['imagePaths'] as List<String>).map((imagePath) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    imagePath,
                                    height: isMobile ? 120 : 180,
                                    width: isMobile ? 200 : 300,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      height: isMobile ? 120 : 180,
                                      width: isMobile ? 200 : 300,
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
              ],
            )),
        const SizedBox(height: 12),
        Text(
          _partnerships['title'],
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        ..._partnerships['partnerships'].map((partnership) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  partnership['name'],
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: isMobile ? 14 : 16,
                        color: const Color(0xFF1F2937),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (partnership['signatories'] as List<String>).map((signatory) => Text(
                        signatory,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: isMobile ? 12 : 14,
                              color: const Color(0xFF4B5563),
                            ),
                      )).toList(),
                ),
                const SizedBox(height: 8),
                Text(
                  'Impact:',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 12 : 14,
                        color: const Color(0xFF4B5563),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  partnership['impact'],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 12 : 14,
                        color: const Color(0xFF4B5563),
                      ),
                ),
                const SizedBox(height: 12),
              ],
            )),
      ],
    );
  }
}