import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart'; 

class AgribusinessDetail extends StatelessWidget {
  const AgribusinessDetail({super.key});

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
        'description': '• Building leadership within communities by forming local management boards for irrigation schemes and empowering them to make economic decisions collectively.\n • Promoting sustainability by emphasizing self-reliance over aid-dependence ("beyond the mentality of grants")—encouraging co-investment, structured loan repayment, and shared ownership of infrastructure.',
        'imagePaths': [
          'assets/images/agribusiness/building_leadership.jpg',
          'assets/images/agribusiness/sustainability.jpg',
        ],
      },
      {
        'title': 'Formation of Self-Help Groups',
        'description': '• Organizing communities into formal groups, such as self-help groups (e.g., Kiptolelyo SHG), to transition from fragmented subsistence farming to coordinated, economically viable units.',
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
        'imagePaths': [
          'assets/images/agribusiness/training_2.jpg',
        ],
      },
      {
        'name': 'Moi University & JV ALMACIS',
        'signatories': [
          '• Piergiorgio Di Carmine – CEO, JV ALMACIS',
          '• Dr. Kefa Chepkwony – Representative, Moi University',
        ],
        'impact': 'Through a 4-month agribusiness training program, Moi University trained students, developed business models, and coordinated local engagement. The MoU strengthens academic-practical collaboration and builds youth capacity for rural innovation.',
        'imagePaths': [
          'assets/images/agribusiness/training_1.jpg',
        ],
      },
    ],
  };

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
                  colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF), Color(0xFF065F46)],
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
                        debugPrint('AgribusinessDetail: Navigating back to /business-units');
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
                              'Agribusiness',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: isMobile ? 24 : 32,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'End-to-end solutions for rural transformation, integrating advanced infrastructure, capacity building, and digital tools to enhance agricultural productivity and sustainability.',
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: isMobile ? 16 : 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Overview Section
                  Container(
                    color: const Color(0xFFF9FAFB),
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              LucideIcons.sprout,
                              size: isMobile ? 24 : 28,
                              color: const Color(0xFF16A34A),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Overview',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: isMobile ? 20 : 24,
                                    color: const Color(0xFF1F2937),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'JV ALMACIS delivers comprehensive solutions for rural transformation, combining large-scale infrastructure development, community empowerment, and innovative digital agriculture tools. Our approach enhances productivity, builds resilient livelihoods, and promotes sustainable growth in underserved regions.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: isMobile ? 12 : 14,
                                color: const Color(0xFF4B5563),
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Sections with Icon and Title on Left, Content on Right
                  Container(
                    color: const Color(0xFFF9FAFB),
                    child: Column(
                      children: [
                        // Infrastructure Section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: isMobile ? 80 : 120,
                              padding: const EdgeInsets.only(right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    LucideIcons.bookOpen,
                                    size: isMobile ? 24 : 28,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Infrastructure',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontSize: isMobile ? 14 : 16,
                                          color: const Color(0xFF1F2937),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Infrastructure',
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            fontSize: isMobile ? 20 : 24,
                                            color: const Color(0xFF1F2937),
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'JV ALMACIS Kenya’s infrastructure programs empower rural communities through targeted development and sustainable solutions.',
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
                                      children: const [
                                        ListTile(
                                          leading: Icon(Icons.check, size: 14, color: Color(0xFF16A34A)),
                                          title: Text('Water Storage and Distribution', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                          subtitle: Text('Designing and installing elevated water tanks and pipelines for irrigation.', style: TextStyle(fontSize: 14)),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.check, size: 14, color: Color(0xFF16A34A)),
                                          title: Text('Solar-Powered Systems', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                          subtitle: Text('Implementing solar energy for sustainable irrigation and pumping.', style: TextStyle(fontSize: 14)),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.check, size: 14, color: Color(0xFF16A34A)),
                                          title: Text('Irrigation Network Expansion', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                          subtitle: Text('Developing extensive irrigated farmland to boost agricultural output.', style: TextStyle(fontSize: 14)),
                                        ),
                                      ],
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
                                        child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                          child: ExpansionTile(
                                            title: Text(
                                              _projects[index]['title'],
                                              style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF2563EB), fontSize: isMobile ? 14 : 16),
                                            ),
                                            tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                            childrenPadding: const EdgeInsets.all(12),
                                            children: [
                                              ConstrainedBox(
                                                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SingleChildScrollView(
                                                      scrollDirection: Axis.horizontal,
                                                      child: Row(
                                                        children: (_projects[index]['imagePaths'] as List<String>).map((imagePath) => Padding(
                                                              padding: const EdgeInsets.only(right: 8),
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
                                                                    child: const Center(child: Icon(LucideIcons.imageOff, color: Colors.grey)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ))
                                                            .toList(),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Text(
                                                      'Client: ${_projects[index]['client']}',
                                                      style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563), fontWeight: FontWeight.bold),
                                                    ),
                                                    if (_projects[index]['funded by'] != null) ...[
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        'Funded by: ${_projects[index]['funded by']}',
                                                        style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563)),
                                                      ),
                                                    ],
                                                    if (_projects[index]['period'].isNotEmpty) ...[
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        'Period: ${_projects[index]['period']}',
                                                        style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563)),
                                                      ),
                                                    ],
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      _projects[index]['description'],
                                                      style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563)),
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Text(
                                                      'Testimonial',
                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 14 : 16, color: const Color(0xFF1F2937)),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      _projects[index]['testimonial'],
                                                      style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563), fontStyle: FontStyle.italic),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Community Section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: isMobile ? 80 : 120,
                              padding: const EdgeInsets.only(right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    LucideIcons.users,
                                    size: isMobile ? 24 : 28,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Community Development and Capacity Building',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontSize: isMobile ? 14 : 16,
                                          color: const Color(0xFF1F2937),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Community Empowerment and Capacity Building',
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
                                    Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      child: ExpansionTile(
                                        title: Text(
                                          'Core Services',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF2563EB), fontSize: isMobile ? 14 : 16),
                                        ),
                                        tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        childrenPadding: const EdgeInsets.all(12),
                                        children: [
                                          ConstrainedBox(
                                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ...(_content['coreServices'] as List<Map<String, dynamic>>).map(
                                                  (service) => Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        service['title'],
                                                        style: TextStyle(fontSize: isMobile ? 14 : 16, color: const Color(0xFF1F2937), fontWeight: FontWeight.bold),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      SingleChildScrollView(
                                                        scrollDirection: Axis.horizontal,
                                                        child: Row(
                                                          children: (service['imagePaths'] as List<String>).map((imagePath) => Padding(
                                                                padding: const EdgeInsets.only(right: 8),
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
                                                                      child: const Center(child: Icon(LucideIcons.imageOff, color: Colors.grey)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ))
                                                              .toList(),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        service['description'],
                                                        style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563)),
                                                      ),
                                                      const SizedBox(height: 12),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Card(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      child: ExpansionTile(
                                        title: Text(
                                          _partnerships['title'],
                                          style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFF2563EB), fontSize: isMobile ? 14 : 16),
                                        ),
                                        tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        childrenPadding: const EdgeInsets.all(12),
                                        children: [
                                          ConstrainedBox(
                                            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ...(_partnerships['partnerships'] as List<Map<String, dynamic>>).map(
                                                  (partnership) => Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        partnership['name'],
                                                        style: TextStyle(fontSize: isMobile ? 14 : 16, color: const Color(0xFF1F2937), fontWeight: FontWeight.bold),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      SingleChildScrollView(
                                                        scrollDirection: Axis.horizontal,
                                                        child: Row(
                                                          children: (partnership['imagePaths'] as List<String>).map((imagePath) => Padding(
                                                                padding: const EdgeInsets.only(right: 8),
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
                                                                      child: const Center(child: Icon(LucideIcons.imageOff, color: Colors.grey)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ))
                                                              .toList(),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        partnership['impact'],
                                                        style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563)),
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        'Signatories:',
                                                        style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563), fontWeight: FontWeight.bold),
                                                      ),
                                                      ...((partnership['signatories'] as List<String>).map(
                                                        (signatory) => Text(
                                                          signatory,
                                                          style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563)),
                                                        ),
                                                      )),
                                                      const SizedBox(height: 12),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Digitization Section
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: isMobile ? 80 : 120,
                              padding: const EdgeInsets.only(right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    LucideIcons.globe,
                                    size: isMobile ? 24 : 28,
                                    color: Colors.grey[400],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Digitization In Agriculture',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          fontSize: isMobile ? 14 : 16,
                                          color: const Color(0xFF1F2937),
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Digitization in Agriculture',
                                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                            fontSize: isMobile ? 20 : 24,
                                            color: const Color(0xFF1F2937),
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'JV ALMACIS leverages digital innovation to empower farmers with mobile-based tools for crop management, market access, and financial planning.',
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            fontSize: isMobile ? 12 : 14,
                                            color: const Color(0xFF4B5563),
                                          ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Applications',
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                            fontSize: isMobile ? 14 : 16,
                                            color: const Color(0xFF1F2937),
                                          ),
                                    ),
                                    const SizedBox(height: 8),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '1. KilimoMkononi Mobile Application',
                                          style: TextStyle(fontSize: isMobile ? 12 : 14, fontWeight: FontWeight.bold, color: const Color(0xFF1F2937)),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Grow, Protect, Prosper\nKilimoMkononi empowers smallholder farmers by delivering crop-specific advice, market price forecasts, 5-day weather updates, soil health recommendations, pest/disease management, and financial tracking tools—all via a user-friendly mobile interface. It supports better decision-making and higher yields for crops like maize, beans, carrots, and tomatoes.',
                                          style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563)),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          '2. CoffeeCore Application',
                                          style: TextStyle(fontSize: isMobile ? 12 : 14, fontWeight: FontWeight.bold, color: const Color(0xFF1F2937)),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Sow – Safeguard – Soar\nDesigned specifically for coffee farmers and cooperatives, CoffeeCore offers farm management tools, real-time market prices, soil and weather data, pest solutions, and financial oversight. It streamlines cooperative coordination while promoting sustainable coffee farming and data-driven decisions from seed to sale.',
                                          style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E40AF), Color(0xFF065F46)],
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 32 : 64,
                horizontal: 16,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
                child: Column(
                  children: [
                    Text(
                      'Ready to Get Started?',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Colors.white,
                            fontSize: isMobile ? 24 : 32,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Contact us today to discuss how our comprehensive business units can help bring your project to life with innovation and excellence.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: isMobile ? 8 : 16,
                      runSpacing: isMobile ? 8 : 16,
                      alignment: WrapAlignment.center,
                      children: [
                        CustomButton(
                          text: 'Request Quote',
                          onPressed: () => Navigator.pushNamed(context, '/contact'),
                        ),
                        CustomButton(
                          text: 'Schedule Consultation',
                          onPressed: () => Navigator.pushNamed(context, '/contact'),
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
}