import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 640;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    void navigate(String route) {
      debugPrint('ProjectsPage: Navigating to $route');
      Navigator.pushNamed(context, route).catchError((e) {
        debugPrint('ProjectsPage: Navigation error to $route: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigation error: $e')),
        );
        return null;
      });
    }

    final projects = [
      {
        'id': '1',
        'title': 'United States Embassy - Medical Research Unit Renov.',
        'category': 'Construction',
        'location': 'Kisumu, Kenya',
        'year': '2018-2021',
        'status': 'Completed',
        'description': 'Comprehensive renovation of a medical research facility including roof replacement and durable roofing systems under challenging pandemic conditions.',
        'image': 'assets/images/construction/medical_research_1.jpg',
        'features': [
          'Roof structure replacement',
          'Durable roofing systems',
          'Pandemic-adapted construction',
          'Compliance with international standards',
        ],
        'icon': LucideIcons.building,
        'color': const Color(0xFF2563EB),
        'bgColor': const Color(0xFFDBEAFE),
        'route': '/construction',
      },
      {
        'id': '2',
        'title': 'United States Embassy – Rosslyn Ridge Renov.',
        'category': 'Construction',
        'location': 'Nairobi, Kenya',
        'year': '2018-2023',
        'status': 'Completed',
        'description': 'Multi-phase renovation across several residential units including structural upgrades, new insulation systems, and modern exterior finishes for long-term resilience.',
        'image': 'assets/images/construction/rosslyn_ridge_1.jpg',
        'features': [
          'Structural upgrades',
          'New insulation systems',
          'Modern exterior finishes',
          'Long-term resilience design',
        ],
        'icon': LucideIcons.building,
        'color': const Color(0xFF2563EB),
        'bgColor': const Color(0xFFDBEAFE),
        'route': '/construction',
      },
      {
        'id': '3',
        'title': 'Italian Ambassador’s Residence Renov.',
        'category': 'Construction',
        'location': 'Nairobi, Kenya',
        'year': 'May - Dec 2024',
        'status': 'Completed',
        'description': 'Comprehensive renovation including replacement of rainwater goods, ceiling reconstruction, electrical system rectification, and installation of energy-efficient solar collectors.',
        'image': 'assets/images/construction/italian_embassy.jpg',
        'features': [
          'Rainwater system replacement',
          'Electrical system upgrades',
          'Solar energy integration',
          'Roof and ceiling reconstruction',
        ],
        'icon': LucideIcons.building,
        'color': const Color(0xFF2563EB),
        'bgColor': const Color(0xFFDBEAFE),
        'route': '/construction',
      },
      {
        'id': '4',
        'title': 'Portuguese Embassy Renov.',
        'category': 'Construction',
        'location': 'Nairobi, Kenya',
        'year': '2025-Ongoing',
        'status': 'Ongoing',
        'description': 'Conversion of a residential villa into a functional office space with biometric, visa production, and reception offices, plus advanced security and ICT systems.',
        'image': 'assets/images/construction/portugese_embassy_1.jpg',
        'features': [
          'Structural conversion',
          'Advanced ICT and security systems',
          'Disability-accessible facilities',
          'Roofing and rainwater upgrades',
        ],
        'icon': LucideIcons.building,
        'color': const Color(0xFF2563EB),
        'bgColor': const Color(0xFFDBEAFE),
        'route': '/construction',
      },
      {
        'id': '5',
        'title': 'Swedish Ambassador’s Residence Renov.',
        'category': 'Construction',
        'location': 'Nairobi, Kenya',
        'year': 'Ongoing',
        'status': 'Ongoing',
        'description': 'Ongoing renovation focusing on electrical and lighting system upgrades to enhance functionality, safety, and aesthetics, aligning with modern standards.',
        'image': 'assets/images/construction/swedish_embassy.jpg',
        'features': [
          'Electrical system upgrades',
          'Lighting efficiency enhancements',
          'Safety compliance',
          'Aesthetic improvements',
        ],
        'icon': LucideIcons.building,
        'color': const Color(0xFF2563EB),
        'bgColor': const Color(0xFFDBEAFE),
        'route': '/construction',
      },
      {
        'id': '6',
        'title': 'Kilimo Mkononi App',
        'category': 'IT Division',
        'location': 'Kenya-wide',
        'year': '2024-Present',
        'status': 'Ongoing',
        'description': 'Revolutionary farming app helping thousands of farmers across Kenya with comprehensive agricultural management.',
        'image': 'assets/images/agribusiness/kilimo_app.jpg',
        'features': [
          'Farming tips and best practices',
          'Real-time weather forecasting',
          'Soil and pest management',
          'Cost control tracking',
        ],
        'icon': LucideIcons.smartphone,
        'color': const Color(0xFF9333EA),
        'bgColor': const Color(0xFFF3E8FF),
        'route': '/kilimo-mkononi',
      },
      {
        'id': '7',
        'title': 'Coffee Core App',
        'category': 'IT Division',
        'location': 'Coffee regions, Kenya',
        'year': '2024-Present',
        'status': 'Ongoing',
        'description': 'Specialized coffee farming management system connecting farmers with cooperatives for better market access.',
        'image': 'assets/images/agribusiness/coffee_core.jpg',
        'features': [
          'Coffee-specific farming guidance',
          'Cooperative integration system',
          'Yield tracking and management',
          'Quality assurance tools',
        ],
        'icon': LucideIcons.cloud,
        'color': const Color(0xFF9333EA),
        'bgColor': const Color(0xFFF3E8FF),
        'route': '/coffee-core',
      },
      {
        'id': '8',
        'title': 'Nyumba Smart - CMMS Software/App',
        'category': 'IT Division',
        'location': 'Nairobi, Kenya',
        'year': '2024-Present',
        'status': 'Ongoing',
        'description': 'Nyumba Smart, Proprietary facility management software for sensitive building operations, enhancing efficiency and maintenance.',
        'image': 'assets/images/agribusiness/cmms.jpg',
        'features': [
          'Work order management',
          'Asset tracking and monitoring',
          'Preventive maintenance scheduling',
          'Inventory management',
        ],
        'icon': LucideIcons.database,
        'color': const Color(0xFF9333EA),
        'bgColor': const Color(0xFFF3E8FF),
        'route': '/cmms',
      },
      {
        'id': '9',
        'title': 'Oil & Gas Inspection Services',
        'category': 'Oil & Gas',
        'location': 'Mombasa, Kenya',
        'year': '2020-Present',
        'status': 'Ongoing',
        'description': 'Comprehensive inspection services for oil and gas facilities in partnership with TIC Group and Brisma Africa.',
        'image': 'assets/images/tic/tic_2.jpg',
        'features': [
          'Safety compliance inspections',
          'Equipment testing and certification',
          'Environmental impact assessments',
          'Technical consulting services',
        ],
        'icon': LucideIcons.fuel,
        'color': const Color(0xFFEA580C),
        'bgColor': const Color(0xFFFFF3E0),
        'route': '/oil-inspection',
      },
      {
        'id': '10',
        'title': 'Community Empowerment Program',
        'category': 'Agribusiness',
        'location': 'Semi-arid regions, Kenya',
        'year': '2020-Present',
        'status': 'Ongoing',
        'description': 'Partnership with KALRO for youth and adult education in sustainable agribusiness practices.',
        'image': 'assets/images/agribusiness/training_2.jpg',
        'features': [
          'Youth training programs',
          'Adult education workshops',
          'Sustainable farming practices',
          'Cooperative formation support',
        ],
        'icon': LucideIcons.bookOpen,
        'color': const Color(0xFF16A34A),
        'bgColor': const Color(0xFFD1FAE5),
        'route': '/community-empowerment',
      },
    ];

    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(), // Replace with AppDrawer if available
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Header(onMenuPressed: () => scaffoldKey.currentState?.openDrawer()),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Hero Section
            ClipRRect(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF), Color(0xFF065F46)],
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.06,
                  horizontal: screenWidth * 0.04,
                ),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 896),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Our Projects',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: isMobile ? 24 : 28,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Showcasing our commitment to excellence across construction, capacity building, oil & gas, and IT sectors',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: isMobile ? 14 : 16,
                                color: const Color(0xFFBFDBFE),
                              ),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Stats Section
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.04,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1280),
                child: Wrap(
                  spacing: screenWidth * 0.03,
                  runSpacing: screenHeight * 0.02,
                  alignment: WrapAlignment.center,
                  children: [
                    _StatCard(
                      value: '15+',
                      label: 'Projects Completed',
                      color: const Color(0xFF2563EB),
                      fontSize: isMobile ? 14 : 16,
                      isMobile: isMobile,
                    ),
                    _StatCard(
                      value: '4',
                      label: 'Major Sectors',
                      color: const Color(0xFF16A34A),
                      fontSize: isMobile ? 14 : 16,
                      isMobile: isMobile,
                    ),
                    _StatCard(
                      value: '7+',
                      label: 'Years Experience',
                      color: const Color(0xFFEA580C),
                      fontSize: isMobile ? 14 : 16,
                      isMobile: isMobile,
                    ),
                  ],
                ),
              ),
            ),
            // Projects Grid
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1280),
                child: Column(
                  children: [
                    Text(
                      'Featured Projects',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF111827),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Wrap(
                          spacing: screenWidth * 0.03,
                          runSpacing: screenHeight * 0.02,
                          alignment: WrapAlignment.center,
                          children: projects.map((project) {
                            final image = project['image'] as String;
                            final category = project['category'] as String;
                            final bgColor = project['bgColor'] as Color;
                            final color = project['color'] as Color;
                            final status = project['status'] as String;
                            final title = project['title'] as String;
                            final location = project['location'] as String;
                            final year = project['year'] as String;
                            final description = project['description'] as String;
                            final features = project['features'] as List<String>;
                            final route = project['route'] as String;

                            return CustomCard(
                              content: InkWell(
                                onTap: () => navigate(route),
                                child: SizedBox(
                                  width: isMobile ? screenWidth * 0.9 : isTablet ? screenWidth * 0.45 : screenWidth * 0.3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: isMobile ? 200 : 240,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(image),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 16,
                                              left: 16,
                                              child: Chip(
                                                label: Text(category),
                                                backgroundColor: bgColor,
                                                labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      color: color,
                                                      fontSize: isMobile ? 12 : 14,
                                                    ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 16,
                                              right: 16,
                                              child: Chip(
                                                label: Text(status),
                                                backgroundColor: status == 'Completed'
                                                    ? const Color(0xFF16A34A)
                                                    : const Color(0xFFEA580C),
                                                labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                      color: Colors.white,
                                                      fontSize: isMobile ? 12 : 14,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              title,
                                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                                    fontSize: isMobile ? 18 : 20,
                                                    color: const Color(0xFF111827),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: screenHeight * 0.01),
                                            Wrap(
                                              spacing: 16,
                                              runSpacing: 8,
                                              children: [
                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      LucideIcons.mapPin,
                                                      size: isMobile ? 12 : 14,
                                                      color: const Color(0xFF6B7280),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      location,
                                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                            fontSize: isMobile ? 12 : 14,
                                                            color: const Color(0xFF6B7280),
                                                          ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      LucideIcons.calendar,
                                                      size: isMobile ? 12 : 14,
                                                      color: const Color(0xFF6B7280),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      year,
                                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                            fontSize: isMobile ? 12 : 14,
                                                            color: const Color(0xFF6B7280),
                                                          ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: screenHeight * 0.01),
                                            Text(
                                              description,
                                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                    fontSize: isMobile ? 12 : 14,
                                                    color: const Color(0xFF4B5563),
                                                    height: 1.5,
                                                  ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: screenHeight * 0.02),
                                            Text(
                                              'Key Features:',
                                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                    fontSize: isMobile ? 12 : 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color(0xFF111827),
                                                  ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(height: screenHeight * 0.01),
                                            Wrap(
                                              spacing: 8,
                                              runSpacing: 8,
                                              children: features.take(4).map((feature) {
                                                return Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      LucideIcons.checkCircle,
                                                      size: isMobile ? 10 : 12,
                                                      color: const Color(0xFF16A34A),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Flexible(
                                                      child: Text(
                                                        feature,
                                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                              fontSize: isMobile ? 12 : 14,
                                                              color: const Color(0xFF4B5563),
                                                            ),
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }).toList(),
                                            ),
                                            if (features.length > 4)
                                              Padding(
                                                padding: const EdgeInsets.only(top: 8),
                                                child: Text(
                                                  '+${features.length - 4} more features',
                                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                        fontSize: isMobile ? 10 : 12,
                                                        color: const Color(0xFF6B7280),
                                                      ),
                                                ),
                                              ),
                                            SizedBox(height: screenHeight * 0.02),
                                            CustomButton(
                                              text: 'View Project Details',
                                              icon: LucideIcons.externalLink,
                                              onPressed: () => navigate(route),
                                              isOutline: true,
                                              isLarge: isMobile,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Project Stats
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF9FAFB),
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.05,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1280),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Project Impact',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF111827),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Measuring our success through tangible results',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF6B7280),
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Wrap(
                      spacing: screenWidth * 0.03,
                      runSpacing: screenHeight * 0.02,
                      alignment: WrapAlignment.center,
                      children: [
                        _StatCard(
                          value: '10+',
                          label: 'Major Projects',
                          subtitle: 'Completed & Ongoing',
                          color: const Color(0xFF2563EB),
                          fontSize: isMobile ? 14 : 16,
                          isMobile: isMobile,
                        ),
                        _StatCard(
                          value: '5,000+',
                          label: 'Farmers Reached',
                          subtitle: 'Through our apps',
                          color: const Color(0xFF16A34A),
                          fontSize: isMobile ? 14 : 16,
                          isMobile: isMobile,
                        ),
                        _StatCard(
                          value: '100%',
                          label: 'Safety Compliance',
                          subtitle: 'Oil & gas inspections',
                          color: const Color(0xFFEA580C),
                          fontSize: isMobile ? 14 : 16,
                          isMobile: isMobile,
                        ),
                        _StatCard(
                          value: '2,000+',
                          label: 'People Trained',
                          subtitle: 'Community programs',
                          color: const Color(0xFF9333EA),
                          fontSize: isMobile ? 14 : 16,
                          isMobile: isMobile,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Projects by Sector
            Container(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.05,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 1280),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Projects by Sector',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: const Color(0xFF111827),
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Our diverse portfolio across multiple industries',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFF6B7280),
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Wrap(
                      spacing: screenWidth * 0.03,
                      runSpacing: screenHeight * 0.02,
                      alignment: WrapAlignment.center,
                      children: [
                        _SectorCard(
                          icon: LucideIcons.building2,
                          title: 'Construction',
                          subtitle: 'Construction & facility development',
                          count: '10+',
                          description: 'Large-scale construction and specialized remodeling for infrastructure and diplomatic facilities across Kenya.',
                          color: const Color(0xFF2563EB),
                          bgColor: const Color(0xFFDBEAFE),
                          fontSize: isMobile ? 12 : 14,
                          isMobile: isMobile,
                        ),
                        _SectorCard(
                          icon: LucideIcons.bookOpen,
                          title: 'Agribusiness',
                          subtitle: 'Infrastructure & community empowerment',
                          count: '5+',
                          description: 'Training and skill development programs to enhance agricultural and entrepreneurial capabilities in rural communities.',
                          color: const Color(0xFF16A34A),
                          bgColor: const Color(0xFFD1FAE5),
                          fontSize: isMobile ? 12 : 14,
                          isMobile: isMobile,
                        ),
                        _SectorCard(
                          icon: LucideIcons.fuel,
                          title: 'Oil & Gas',
                          subtitle: 'Inspection & technical services',
                          count: '1',
                          description: 'Comprehensive inspection services for oil and gas facilities in partnership with international firms.',
                          color: const Color(0xFFEA580C),
                          bgColor: const Color(0xFFFFF3E0),
                          fontSize: isMobile ? 12 : 14,
                          isMobile: isMobile,
                        ),
                        _SectorCard(
                          icon: LucideIcons.globe,
                          title: 'IT Division',
                          subtitle: 'Software & technology solutions',
                          count: '3+',
                          description: 'Mobile apps, facility management software, and digital platforms for agriculture and operations.',
                          color: const Color(0xFF9333EA),
                          bgColor: const Color(0xFFF3E8FF),
                          fontSize: isMobile ? 12 : 14,
                          isMobile: isMobile,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Call to Action
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1E40AF), Color(0xFF1E3A8A)],
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.06,
                horizontal: screenWidth * 0.04,
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.95 : 800),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Start Your Next Project',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: isMobile ? 20 : 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      'Ready to bring your vision to life? Let\'s discuss how we can help you achieve your goals with our proven expertise.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: const Color(0xFFEFF6FF),
                          ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: [
                        CustomButton(
                          text: 'Start a Project',
                          onPressed: () => navigate('/contact'),
                          isLarge: isMobile,
                        ),
                        CustomButton(
                          text: 'View Our Business Units',
                          onPressed: () => navigate('/business-units'),
                          isOutline: true,
                          isLarge: isMobile,
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
  final String value;
  final String label;
  final String? subtitle;
  final Color color;
  final double fontSize;
  final bool isMobile;

  const _StatCard({
    required this.value,
    required this.label,
    this.subtitle,
    required this.color,
    required this.fontSize,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: isMobile ? screenWidth * 0.4 : screenWidth * 0.22,
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: isMobile ? 20 : 24,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: fontSize,
                  color: const Color(0xFF111827),
                ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize * 0.8,
                    color: const Color(0xFF6B7280),
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );
  }
}

class _SectorCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String count;
  final String description;
  final Color color;
  final Color bgColor;
  final double fontSize;
  final bool isMobile;

  const _SectorCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.count,
    required this.description,
    required this.color,
    required this.bgColor,
    required this.fontSize,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return CustomCard(
      content: Container(
        width: isMobile ? screenWidth * 0.9 : screenWidth * 0.3,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: isMobile ? 16 : 20,
                  color: color,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: isMobile ? 16 : 18,
                        color: const Color(0xFF111827),
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize,
                    color: const Color(0xFF6B7280),
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              '$count Major projects',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: fontSize,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize,
                    color: const Color(0xFF4B5563),
                    height: 1.5,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}