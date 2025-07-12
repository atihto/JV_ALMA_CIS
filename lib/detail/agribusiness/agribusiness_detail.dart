import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import 'dart:developer' as developer;

class AgribusinessDetail extends StatelessWidget {
  const AgribusinessDetail({super.key});

  static final List<Map<String, dynamic>> _projects = [
    {
      'funded by': 'Italian Agency for Cooperation Development (AICS)',
      'title': 'Sigor Wei Wei Integrated Irrigation Scheme – West Pokot, Kenya',
      'client': 'Kerio Valley Development Authority (KVDA)',
      'period': 'June 2017 – July 2020',
      'description': 'Major civil works for a large-scale irrigation scheme in a remote region, including installation of pipelines to irrigate over 325 hectares. The project also involved bush clearing and refurbishment of 290 ha of existing irrigation systems, and construction of warehouses and support facilities.',
      'testimonial': '"JV ALMA C.I.S. delivered extensive infrastructure in a complex rural setting, significantly boosting the region\'s agricultural productivity." — Eng. Daniel Kimutai, KVDA',
      'imagePaths': [
        {'path': 'assets/images/agribusiness/sigor_1.jpg', 'caption': 'Former President Uhuru Kenyatta During the launch of the project'},
        {'path': 'assets/images/agribusiness/sigor_2.jpg', 'caption': ''},
      ],
    },
    {
      'title': 'Solar-Powered Irrigation Scheme – Kapluk, Baringo, Kenya',
      'client': 'Italian Agency for Cooperation Development (AICS)',
      'period': 'June 2021 – May 2023',
      'description': 'Design-build execution of a solar-powered irrigation system. The scope included survey and design of the distribution network and related pump system, 10,000-liter tanks, hydrants, and all associated valves. The project engaged the local community extensively, providing employment opportunities while ensuring technical supervision and quality control.',
      'testimonial': '"As a farmer and resident of Kapluk, I saw firsthand how JV ALMA C.I.S worked with our community—not just to build an irrigation system, but to build our confidence and capacity. Thanks to their commitment, we now have water, jobs, and a future." — Simion Yator, Kiptolelyo Self Help Group Chairman.',
      'imagePaths': [
        {'path': 'assets/images/agribusiness/kapluk_1.jpg', 'caption': ''},
        {'path': 'assets/images/agribusiness/kapluk_2.jpg', 'caption': ''},
      ],
    },
    {
      'title': 'Makueni Irrigation Scheme',
      'client': 'Greenland Farm',
      'period': '',
      'description': 'Solar-powered irrigation system and agri-enterprise pilot in Makueni County. Beyond construction, JV ALMA C.I.S introduced organic farming methods and trained farmers on sustainable practices. The project catalyzed local agri-enterprise and reduced chemical inputs for improved livelihoods.',
      'testimonial': '"As Greenland Farm, we witnessed how JV ALMA C.I.S combined innovation with hands-on support—delivering not just infrastructure, but real impact. With their guidance, we\'ve adopted sustainable practices, improved our yields, and built stronger ties with the market." — Greenland Farm Management',
      'imagePaths': [
        {'path': 'assets/images/agribusiness/makueni_1.jpg', 'caption': ''},
        {'path': 'assets/images/agribusiness/makueni_2.jpg', 'caption': ''},
      ],
    },
  ];

  static final Map<String, dynamic> _content = {
    'description': 'JV ALMA C.I.S approaches capacity building as a transformative process designed to equip individuals and communities with the skills, knowledge, and structures needed to drive their own development. In the context of rural agribusiness, this involves:',
    'coreServices': [
      {
        'title': 'Training Programs',
        'description': '• Training young professionals in multidisciplinary skills (engineering, agribusiness, irrigation design) through technical modules delivered in partnership with academic institutions.',
        'imagePaths': [
          {'path': 'assets/images/agribusiness/training_2.jpg', 'caption': ''},
        ],
      },
      {
        'title': 'Formation of Self-Help Groups',
        'description': '• Organizing communities into formal groups, such as self-help groups (e.g., Kiptolelyo SHG), to transition from fragmented subsistence farming to coordinated, economically viable units.',
        'imagePaths': [
          {'path': 'assets/images/agribusiness/group_cert.jpg', 'caption': ''},
        ],
      },
      {
        'title': 'Promoting Sustainability',
        'description': '• Promoting sustainability by emphasizing self-reliance over aid-dependence ("beyond the mentality of grants")—encouraging co-investment, structured loan repayment, and shared ownership of infrastructure.',
        'imagePaths': [
          {'path': 'assets/images/agribusiness/sustainability.jpg', 'caption': ''},
        ],
      },
      {
        'title': 'Soil Health and Controlled Use of Pesticides',
        'description': '• Soil sampling and analysis to support fertility management\n• Recommendations for responsible fertilizer and pesticide use\n• Tailored nutrient application plans based on farm-specific data',
        'imagePaths': [
          {'path': 'assets/images/agribusiness/soil_health_1.jpg', 'caption': ''},
          {'path': 'assets/images/agribusiness/soil_health_2.jpg', 'caption': ''},
        ],
      },
      {
        'title': 'Data Processing',
        'description': '• Collection and analysis of real-time field data\n• Crop and pest tracking for precision farming\n• Integration of mobile technology to support informed decisions',
        'imagePaths': [
          {'path': 'assets/images/agribusiness/data_processing.jpg', 'caption': ''},
          {'path': 'assets/images/agribusiness/data_extraction.jpg', 'caption': ''},
        ],
      },
    ],
  };

  static final Map<String, dynamic> _partnerships = {
    'title': 'Partnership With Institutions',
    'partnerships': [
      {
        'name': 'KALRO & JV ALMA C.I.S',
        'signatories': [
          '• Piergiorgio Di Carmine – CEO, JV ALMA C.I.S',
          '• Dr. Eliud Kireger – Director General, KALRO',
          '• Patricia Ngutu – Corporation Secretary, KALRO',
        ],
        'impact': "The MoU empowers KALRO to provide technical support, capacity building, irrigation supervision, soil/water analysis, and ESIA services. This partnership grounds JV ALMA C.I.S's field projects in scientific rigor, enhancing sustainability and agricultural productivity.",
        'imagePaths': [
          {'path': 'assets/images/agribusiness/kalro_logo.jpg', 'caption': 'KALRO Logo'},
        ],
      },
      {
        'name': 'Moi University & JV ALMA C.I.S',
        'signatories': [
          '• Piergiorgio Di Carmine – CEO, JV ALMA C.I.S',
          '• Prof. Eng. Simiyu Sitati – Dean School of Engineering, Moi University',
        ],
        'impact': 'Through the agribusiness training program, Moi University trained students, developed business models, and coordinated local engagement. The MoU strengthens academic-practical collaboration and builds youth capacity for rural innovation.',
        'imagePaths': [
          {'path': 'assets/images/agribusiness/moi_logo.jpg', 'caption': 'Moi University Logo'},
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
                        developer.log('AgribusinessDetail: Navigating back to /business-units', name: 'AgribusinessDetail');
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
                              'End-to-end solutions for rural transformation, integrating advanced infrastructure, community development & capacity building, and digital tools to enhance agricultural productivity and sustainability.',
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
                  _buildOverviewSection(context, isMobile),
                  const SizedBox(height: 24),
                  // Infrastructure Section
                  _buildInfrastructureSection(context, isMobile),
                  const SizedBox(height: 24),
                  // Community Section
                  _buildCommunitySection(context, isMobile),
                  const SizedBox(height: 24),
                  // Digitization Section
                  _buildDigitizationSection(context, isMobile),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewSection(BuildContext context, bool isMobile) {
    return Container(
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
            'JV ALMA C.I.S delivers comprehensive solutions for rural transformation, combining large-scale infrastructure development, community development & capacity building, and innovative digital agriculture tools. Our approach enhances productivity, builds resilient livelihoods, and promotes sustainable growth in underserved regions.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? 12 : 14,
                  color: const Color(0xFF4B5563),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfrastructureSection(BuildContext context, bool isMobile) {
    return Container(
      color: const Color(0xFFF9FAFB),
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                LucideIcons.bookOpen,
                size: 28,
                color: Color(0xFF16A34A),
              ),
              const SizedBox(width: 8),
              Text(
                'Infrastructure',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: isMobile ? 20 : 24,
                      color: const Color(0xFF1F2937),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfrastructureContent(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildInfrastructureContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "JV ALMA C.I.S Kenya's infrastructure programs empower rural communities through targeted development and sustainable solutions.",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: isMobile ? 12 : 14,
                color: const Color(0xFF4B5563),
              ),
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
                        Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _getImageWidgets(context, _projects[index]['imagePaths'], isLogo: false),
                            ),
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
    );
  }

  Widget _buildCommunitySection(BuildContext context, bool isMobile) {
    return Container(
      color: const Color(0xFFF9FAFB),
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                LucideIcons.users,
                size: 28,
                color: Color(0xFF16A34A),
              ),
              const SizedBox(width: 8),
              Text(
                'Capacity Building',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: isMobile ? 20 : 24,
                      color: const Color(0xFF1F2937),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildCommunityContent(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildCommunityContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                          Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _getImageWidgets(context, service['imagePaths'], isLogo: false),
                              ),
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
                  crossAxisAlignment: CrossAxisAlignment.center, // Center the entire partnership content
                  children: [
                    ...(_partnerships['partnerships'] as List<Map<String, dynamic>>).map(
                      (partnership) => Column(
                        crossAxisAlignment: CrossAxisAlignment.center, // Center each partnership
                        children: [
                          Text(
                            partnership['name'],
                            style: TextStyle(fontSize: isMobile ? 14 : 16, color: const Color(0xFF1F2937), fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Center the logos
                              children: _getImageWidgets(context, partnership['imagePaths'], isLogo: true),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            partnership['impact'],
                            style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563)),
                            textAlign: TextAlign.center, // Center the impact text
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Signatories:',
                            style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563), fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center, // Center the signatories header
                          ),
                          ...((partnership['signatories'] as List<String>).map(
                            (signatory) => Text(
                              signatory,
                              style: TextStyle(fontSize: isMobile ? 12 : 14, color: const Color(0xFF4B5563)),
                              textAlign: TextAlign.center, // Center each signatory
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
    );
  }

  Widget _buildDigitizationSection(BuildContext context, bool isMobile) {
    return Container(
      color: const Color(0xFFF9FAFB),
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                LucideIcons.globe,
                size: 28,
                color: Color(0xFF16A34A),
              ),
              const SizedBox(width: 8),
              Text(
                'Digitization In Agriculture',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: isMobile ? 20 : 24,
                      color: const Color(0xFF1F2937),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDigitizationContent(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildDigitizationContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'JV ALMA C.I.S leverages digital innovation to empower farmers with mobile-based tools for crop management, market access, and financial planning.',
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
                  developer.log('AgribusinessDetail: Navigating to /kilimo-mkononi', name: 'AgribusinessDetail');
                  Navigator.pushNamed(context, '/kilimo-mkononi');
                },
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.globe,
                      color: const Color(0xFF16A34A),
                      size: isMobile ? 20 : 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'KilimoMkononi Mobile Application',
                            style: TextStyle(
                              fontSize: isMobile ? 12 : 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Grow, Protect, Prosper\nKilimoMkononi empowers smallholder farmers by delivering crop-specific advice, market price forecasts, 5-day weather updates, soil health recommendations, pest/disease management, and financial tracking tools—all via a user-friendly mobile interface. It supports better decision-making and higher yields for crops like maize, beans, carrots, and tomatoes.',
                            style: TextStyle(
                              fontSize: isMobile ? 12 : 14,
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
                  developer.log('AgribusinessDetail: Navigating to /coffee-core', name: 'AgribusinessDetail');
                  Navigator.pushNamed(context, '/coffee-core');
                },
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.globe,
                      color: const Color(0xFF16A34A),
                      size: isMobile ? 20 : 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CoffeeCore Application',
                            style: TextStyle(
                              fontSize: isMobile ? 12 : 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Sow – Safeguard – Soar\nDesigned specifically for coffee farmers and cooperatives, CoffeeCore offers farm management tools, real-time market prices, soil and weather data, pest solutions, and financial oversight. It streamlines cooperative coordination while promoting sustainable coffee farming and data-driven decisions from seed to sale.',
                            style: TextStyle(
                              fontSize: isMobile ? 12 : 14,
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
        ),
      ],
    );
  }

  List<Widget> _getImageWidgets(BuildContext context, dynamic imagePaths, {bool isLogo = false}) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    if (imagePaths == null) return [];
    if (imagePaths is List<dynamic>) {
      return imagePaths.map((imageData) {
        if (imageData is Map<String, dynamic> && imageData['path'] is String) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: isLogo ? (isMobile ? 100 : 150) : (isMobile ? 180 : 240), // Reduced height for logos only
                  width: isLogo ? (isMobile ? 150 : 200) : (isMobile ? 300 : 400),   // Reduced width for logos only
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      imageData['path'],
                      height: isLogo ? (isMobile ? 100 : 150) : (isMobile ? 180 : 240),
                      width: isLogo ? (isMobile ? 150 : 200) : (isMobile ? 300 : 400),
                      fit: isLogo ? BoxFit.contain : BoxFit.cover, // Contain for logos, cover for others
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: isLogo ? (isMobile ? 100 : 150) : (isMobile ? 180 : 240),
                        width: isLogo ? (isMobile ? 150 : 200) : (isMobile ? 300 : 400),
                        color: Colors.grey[200],
                        child: const Center(child: Icon(LucideIcons.imageOff, color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
                if (imageData['caption'] != null && imageData['caption'].isNotEmpty) ...[
                  const SizedBox(height: 12),
                  SizedBox(
                    width: isLogo ? (isMobile ? 150 : 200) : (isMobile ? 300 : 400),
                    child: Text(
                      imageData['caption'],
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 14,
                        color: const Color(0xFF4B5563),
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      }).toList();
    }
    return [];
  }
}