import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

const Map<String, String> sectionRoutes = {
  'construction': '/construction',
  'facility': '/facility',
  'infrastructure': '/infrastructure',
  'community-empowerment': '/community-empowerment',
  'digitization-in-agriculture': '/digitization-in-agriculture', 
  'kilimo-mkononi': '/kilimo-mkononi',
  'oil-inspection': '/oil-inspection',
  'oil-partners': '/oil-partners',
  'cmms': '/cmms',
  'coffee-core': '/coffee-core',
};

class Subsection extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final String sectionKey;
  final List<String>? badges;
  final String? badge;
  final List<Project>? projects;
  final List<String>? features;
  final List<Partnership>? partnerships;
  final Widget? extraContent;

  const Subsection({
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
    super.key,
  });

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
          if (badges != null || badge != null) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Wrap(
                spacing: 4.0,
                runSpacing: 4.0,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  ...?badges?.map((b) => Chip(
                        label: Text(b,
                            style: TextStyle(fontSize: isMobile ? 10 : 12)),
                        backgroundColor: const Color(0xFFE0E7FF),
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      )),
                  if (badge != null)
                    Chip(
                      label: Text(badge!,
                          style: TextStyle(fontSize: isMobile ? 10 : 12)),
                      backgroundColor: const Color(0xFFE0E7FF),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    ),
                ],
              ),
            ),
          ],
          Row(
            children: [
              Icon(icon, color: Theme.of(context).primaryColor, size: isMobile ? 20 : 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 16 : 20,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? 12 : 14,
                  color: const Color(0xFF4B5563),
                ),
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
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 12 : 14,
                                  ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            if (p.year != null)
                              Text(
                                p.year!,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[600],
                                      fontSize: isMobile ? 10 : 12,
                                    ),
                              ),
                            if (p.description != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  p.description!,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontSize: isMobile ? 12 : 14,
                                      ),
                                ),
                              ),
                            if (p.scope != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  'Scope: ${p.scope!}',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontSize: isMobile ? 12 : 14,
                                      ),
                                ),
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
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 12 : 14,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                p.details,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: isMobile ? 12 : 14,
                                    ),
                              ),
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
                  debugPrint('Subsection: Navigating to $route');
                  Navigator.pushNamed(context, route).catchError((e) {
                    debugPrint('Navigation error to $route: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to navigate: $e')),
                    );
                    return null;
                  });
                } else {
                  debugPrint('Subsection: No route defined for sectionKey: $sectionKey');
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

class Project {
  final String title;
  final String? description;
  final String? year;
  final String? scope;
  final List<String>? features;

  const Project({
    required this.title,
    this.description,
    this.year,
    this.scope,
    this.features,
  });
}

class Partnership {
  final String name;
  final String details;

  const Partnership({
    required this.name,
    required this.details,
  });
}

class CmmsFeatures extends StatelessWidget {
  const CmmsFeatures({super.key});

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