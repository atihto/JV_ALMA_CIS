/*import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';
import '../widgets/custom_button.dart';
import '../widgets/business_unit_section.dart';
import '../widgets/subsection.dart';

const Map<String, String> sectionRoutes = {
  'construction': '/construction',
  'facility': '/facility',
  'infrastructure': '/infrastructure',
  'community-empowerment': '/community-empowerment',
  'kilimo-mkononi': '/kilimo-mkononi',
  'oil-inspection': '/oil-inspection',
  'oil-partners': '/oil-partners',
  'cmms': '/cmms',
  'coffee-core': '/coffee-core',
};

class BusinessUnitsPage extends StatelessWidget {
  const BusinessUnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    debugPrint('BusinessUnitsPage: Building BusinessUnitsPage');
    return Builder(
      builder: (context) => AppScaffold(
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
                padding: EdgeInsets.symmetric(vertical: isMobile ? 40 : 80, horizontal: 16),
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
                    child: Column(
                      children: [
                        Text(
                          'Our Business Units',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Comprehensive solutions across construction, capacity building, oil & gas, and IT sectors, powered by cutting-edge technology and decades of expertise.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color(0xFFBFDBFE),
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const _BusinessUnitSection(
                title: 'Construction',
                icon: LucideIcons.building2,
                iconColor: Color(0xFF2563EB),
                description:
                    'JV ALMACIS also undertakes specialized construction projects for diplomatic missions and sensitive facilities. These works often involve high-standard renovations, infrastructure upgrades, and tailored installations to meet the unique operational, security, and functional needs of such environments. Our experience in this area reflects our capability to deliver with discretion, precision, and full compliance with institutional expectations.',
                children: [
                  _Subsection(
                    title: 'Construction',
                    icon: LucideIcons.building2,
                    description: 'Large-scale construction and specialized remodeling for infrastructure and diplomatic facilities across Kenya.',
                    sectionKey: 'construction',
                    badges: ['Major Infrastructure', 'Diplomatic Residence Projects'],
                    projects: [
                      _Project(
                        title: 'American Center Renovation – Nairobi, Kenya',
                        description:
                            'Comprehensive renovation and interior redesign of the ground floor of the Embassy of the United States in Kenya, transforming it into a modern, multifunctional space.',
                        year: '2021-2022',
                        scope: 'Completed',
                      ),
                      _Project(
                        title: 'Residential Housing Renovation – Rosslyn Ridge Compound, Nairobi',
                        description:
                            'Multi-phase renovation across more than 30 residential single units including structural upgrades, new insulation systems, and modern exterior finishes.',
                        year: '2018-2023',
                        scope: 'Completed',
                      ),
                      _Project(
                        title: 'Italian Ambassador’s Residence Renovation – Nairobi, Kenya',
                        description:
                            'Comprehensive renovation with a focus on modernizing electrical infrastructure, hot water systems, and utility controls for energy efficiency.',
                        year: 'Unknown',
                        scope: 'Completed',
                      ),
                      _Project(
                        title: 'Portuguese Embassy Renovation – Nairobi, Kenya',
                        description:
                            'Adaptive renovation to transform an existing structure into a modern consular section with biometric, visa, and reception offices, plus comprehensive ICT systems.',
                        year: '2025-Ongoing',
                        scope: 'In Progress',
                      ),
                      _Project(
                        title: 'Electrical System Upgrades - Swedish Ambassador’s Residence, Nairobi, Kenya',
                        description:
                            'Ongoing upgrade of electrical and lighting systems to enhance safety, energy efficiency, and modern design.',
                        year: 'Ongoing',
                        scope: 'In Progress',
                      ),
                      _Project(
                        title: 'Medical Research Unit Renovation – Kisumu, Kenya',
                        description:
                            'Comprehensive renovation of a medical research facility including removal of the existing roof structure and upgrades under pandemic conditions.',
                        year: '2018-2021',
                        scope: 'Completed',
                      ),
                    ],
                  ),
                  _Subsection(
                    title: 'Facility Management',
                    icon: LucideIcons.database,
                    description: 'Comprehensive facility management services using our proprietary CMMS software.',
                    sectionKey: 'facility',
                    badge: 'Ongoing Services',
                    projects: [
                      _Project(
                        title: 'Corporate Office Facilities',
                        description:
                            'Comprehensive facility management services for over 15 corporate office buildings across Nairobi using our proprietary CMMS software.',
                        scope: 'Preventive maintenance, asset tracking, work order management',
                      ),
                      _Project(
                        title: 'Industrial Facilities',
                        description:
                            'Specialized maintenance services for industrial facilities including equipment monitoring, regulatory compliance, and 24/7 emergency response capabilities.',
                        scope: 'Equipment monitoring, compliance tracking, emergency response',
                      ),
                    ],
                    extraContent: _CmmsFeatures(),
                  ),
                ],
              ),
              Container(
                color: const Color(0xFFF9FAFB),
                child: const _BusinessUnitSection(
                  title: 'Agribusiness',
                  icon: LucideIcons.sprout,
                  iconColor: Color(0xFF16A34A),
                  description:
                      'JV ALMACIS delivers end-to-end solutions for rural transformation—blending large-scale infrastructure development with cutting-edge digital agriculture. From constructing irrigation systems, farm roads, and community facilities to deploying smart farming tools like the KilimoMkononi mobile app, JV ALMACIS empowers farming communities through engineering expertise, data-driven practices, and inclusive engagement. The result is enhanced agricultural productivity, resilient livelihoods, and sustainable growth in underserved regions.',
                  children: [
                    _Subsection(
                      title: 'Infrastructure',
                      icon: LucideIcons.bookOpen,
                      description: 'Developing large-scale irrigation and sustainable infrastructure to boost agricultural productivity.',
                      sectionKey: 'infrastructure',
                      badge: 'Sustainable Development',
                      features: [
                        'Large-Scale Irrigation Development',
                        'Sustainable Infrastructure Solutions',
                        'Community-Driven Development',
                      ],
                    ),
                    _Subsection(
                      title: 'Capacity Building and Community Empowerment',
                      icon: LucideIcons.users,
                      description: 'Equipping rural communities with skills, knowledge, and structures for sustainable agribusiness growth.',
                      sectionKey: 'community-empowerment',
                      badges: ['2,000+ Trained', 'KALRO Partnership'],
                      features: [
                        'Training Young Professionals',
                        'Community Organization',
                        'Leadership Development',
                        'Promoting Sustainability',
                      ],
                    ),
                    _Subsection(
                      title: 'Kilimo Mkononi',
                      icon: LucideIcons.smartphone,
                      description: 'Mobile app empowering farmers with tools for crop management, market access, and financial planning.',
                      sectionKey: 'kilimo-mkononi',
                      badge: 'Multi Crop Farming Solution',
                      features: [
                        'Tailored Crop Tips',
                        'Market Price Advantage',
                        'Weather Planning',
                        'Soil Health Mastery',
                        'Crop Protection',
                        'Farm Finance Tracking',
                        'Innovative Guides',
                      ],
                    ),
                  ],
                ),
              ),
              const _BusinessUnitSection(
                title: 'Oil & Gas Services',
                icon: LucideIcons.fuel,
                iconColor: Color(0xFFEA580C),
                description:
                    'Providing specialized inspection and strategic partnerships to ensure safety, compliance, and efficiency in the oil and gas sector.',
                children: [
                  _Subsection(
                    title: 'Strategic Partnerships',
                    icon: LucideIcons.users,
                    description: 'Collaborations with TIC Group and Brisma Africa for advanced inspection and regional solutions.',
                    sectionKey: 'oil-partners',
                    partnerships: [
                      _Partnership(
                        name: 'TIC Group Partnership',
                        details:
                            'Collaboration with TIC Inspection Group for advanced inspection technologies and international standards compliance.',
                      ),
                      _Partnership(
                        name: 'Brisma Africa Collaboration',
                        details:
                            'Joint projects with Brisma Africa for comprehensive oil and gas solutions across the East African region.',
                      ),
                    ],
                    features: [
                      'Access to international standards',
                      'Advanced inspection technologies',
                      'Regional expertise sharing',
                      'Comprehensive solution delivery',
                    ],
                  ),
                ],
              ),
              Container(
                color: const Color(0xFFF9FAFB),
                child: const _BusinessUnitSection(
                  title: 'IT Division',
                  icon: LucideIcons.globe,
                  iconColor: Color(0xFF9333EA),
                  description:
                      'Our in-house IT division develops cutting-edge software solutions that power our operations across all business units. From facility management systems to agricultural mobile applications, we create technology that drives efficiency and innovation.',
                  children: [
                    _Subsection(
                      title: 'CMMS Software',
                      icon: LucideIcons.database,
                      description:
                          'Proprietary facility management software, designed for sensitive building management operations.',
                      sectionKey: 'cmms',
                      badge: 'Building Solution',
                      features: [
                        'Asset tracking and monitoring',
                        'Preventive maintenance scheduling',
                        'Work order management',
                      ],
                    ),
                    _Subsection(
                      title: 'Kilimo Mkononi App',
                      icon: LucideIcons.smartphone,
                      description:
                          'Comprehensive mobile application helping thousands of farmers across Kenya with agricultural management and market access.',
                      sectionKey: 'kilimo-mkononi',
                      badge: 'Multi Crop Farming Solution',
                      features: [
                        'Farming tips and best practices',
                        'Weather forecasting integration',
                        'Soil and pest management',
                        'Cost control tracking',
                      ],
                    ),
                    _Subsection(
                      title: 'Coffee Core Platform',
                      icon: LucideIcons.cloud,
                      description:
                          'Dedicated platform connecting coffee farmers with cooperatives for better market access and quality control.',
                      sectionKey: 'coffee-core',
                      badge: 'Coffee Farmers Network',
                      features: [
                        'Coffee-specific farming guidance',
                        'Cooperative integration system',
                        'Yield tracking and management',
                      ],
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
                padding: EdgeInsets.symmetric(vertical: isMobile ? 32 : 64, horizontal: 16),
                child: Container(
                  constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
                  child: Column(
                    children: [
                      Text(
                        'Ready to Get Started?',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                              color: Colors.white,
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
                            onPressed: () {
                              debugPrint('BusinessUnitsPage: Navigating to /contact from Request Quote');
                              Navigator.pushNamed(context, '/contact');
                            },
                          ),
                          CustomButton(
                            text: 'Schedule Consultation',
                            onPressed: () {
                              debugPrint('BusinessUnitsPage: Navigating to /contact from Schedule Consultation');
                              Navigator.pushNamed(context, '/contact');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BusinessUnitSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String description;
  final List<Widget> children;

  const _BusinessUnitSection({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.description,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 32 : 64, horizontal: 16),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: iconColor, size: isMobile ? 32 : 48),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: iconColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

class _Subsection extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final String sectionKey;
  final List<String>? badges;
  final String? badge;
  final List<_Project>? projects;
  final List<String>? features;
  final List<_Partnership>? partnerships;
  final Widget? extraContent;

  const _Subsection({
    required this.title,
    required this.icon,
    required this.description,
    required this.sectionKey,
    this.badges,
    this.badge,
    this.projects,
    this.features,
    this.partnerships,
    this.extraContent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Theme.of(context).primaryColor, size: isMobile ? 24 : 32),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              if (badges != null)
                Wrap(
                  spacing: 8,
                  children: badges!
                      .map((b) => Chip(
                            label: Text(b),
                            backgroundColor: const Color(0xFFE0E7FF),
                          ))
                      .toList(),
                ),
              if (badge != null)
                Chip(
                  label: Text(badge!),
                  backgroundColor: const Color(0xFFE0E7FF),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (features != null) ...[
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features!
                  .map((f) => Row(
                        children: [
                          const Icon(LucideIcons.checkCircle, size: 14, color: Color(0xFF22C55E)),
                          const SizedBox(width: 6),
                          Expanded(child: Text(f)),
                        ],
                      ))
                  .toList(),
            ),
          ],
          if (projects != null) ...[
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: projects!
                  .map((p) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.title,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            if (p.year != null)
                              Text(
                                p.year!,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                              ),
                            if (p.description != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(p.description!),
                              ),
                            if (p.scope != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text('Scope: ${p.scope!}'),
                              ),
                            if (p.features != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: p.features!
                                      .map((f) => Row(
                                            children: [
                                              const Icon(Icons.check_circle, size: 12, color: Color(0xFF22C55E)),
                                              const SizedBox(width: 4),
                                              Expanded(child: Text(f)),
                                            ],
                                          ))
                                      .toList(),
                                ),
                              ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
          if (partnerships != null) ...[
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: partnerships!
                  .map((p) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.name,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(p.details),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
          if (extraContent != null) ...[
            const SizedBox(height: 12),
            extraContent!,
          ],
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                final route = sectionRoutes[sectionKey];
                if (route != null) {
                  Navigator.pushNamed(context, route).catchError((e) {
                    debugPrint('Navigation error to $route: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to navigate: $e')),
                    );
                  });
                }
              },
              child: const Text('Learn More'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Project {
  final String title;
  final String? description;
  final String? year;
  final String? scope;
  final List<String>? features;

  const _Project({
    required this.title,
    this.description,
    this.year,
    this.scope,
    this.features,
  });
}

class _Partnership {
  final String name;
  final String details;

  const _Partnership({
    required this.name,
    required this.details,
  });
}

class _CmmsFeatures extends StatelessWidget {
  const _CmmsFeatures();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    const featuresList = [
      'Work order management',
      'Asset tracking and monitoring',
      'Preventive maintenance scheduling',
      'Inventory management',
      'Reporting and analytics',
      'Mobile accessibility',
    ];

    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E7EB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CMMS Software Features',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: isMobile ? 8 : 16,
            runSpacing: 8,
            children: featuresList
                .map((feature) => SizedBox(
                      width: isMobile ? screenWidth * 0.9 : isTablet ? screenWidth * 0.45 : screenWidth * 0.3,
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_outline, size: 12, color: Color(0xFF22C55E)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              feature,
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class AppScaffold extends StatelessWidget {
  final Widget body;

  const AppScaffold({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}*/