import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'dart:developer' as developer;

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
      margin: const EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (badges != null || badge != null) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  ...?badges?.map((b) => Chip(
                        label: Text(b,
                            style: TextStyle(fontSize: isMobile ? 11 : 13)),
                        backgroundColor: const Color(0xFFE0E7FF),
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      )),
                  if (badge != null)
                    Chip(
                      label: Text(badge!,
                          style: TextStyle(fontSize: isMobile ? 11 : 13)),
                      backgroundColor: const Color(0xFFE0E7FF),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    ),
                ],
              ),
            ),
          ],
          Row(
            children: [
              Icon(icon, color: const Color(0xFF1E293B), size: isMobile ? 24 : 28),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 18 : 22,
                        color: const Color(0xFF1E293B),
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? 14 : 16,
                  color: const Color(0xFF4B5563),
                  height: 1.5,
                ),
          ),
          if (features != null) ...[
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features!
                  .map((f) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(LucideIcons.checkCircle, size: 16, color: Color(0xFF22C55E)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                f,
                                style: TextStyle(
                                  fontSize: isMobile ? 14 : 16,
                                  color: const Color(0xFF374151),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
          if (projects != null) ...[
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: projects!
                  .map((p) => Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.title,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 14 : 16,
                                    color: const Color(0xFF1E293B),
                                  ),
                            ),
                            if (p.year != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                p.year!,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: const Color(0xFF64748B),
                                      fontSize: isMobile ? 12 : 14,
                                    ),
                              ),
                            ],
                            if (p.description != null) ...[
                              const SizedBox(height: 8),
                              Text(
                                p.description!,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: isMobile ? 14 : 16,
                                      color: const Color(0xFF374151),
                                    ),
                              ),
                            ],
                            if (p.scope != null) ...[
                              const SizedBox(height: 8),
                              Text(
                                'Scope: ${p.scope!}',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: isMobile ? 14 : 16,
                                      color: const Color(0xFF374151),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                            if (p.features != null) ...[
                              const SizedBox(height: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: p.features!
                                    .map((f) => Padding(
                                          padding: const EdgeInsets.only(bottom: 4.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Icon(Icons.check_circle, size: 14, color: Color(0xFF22C55E)),
                                              const SizedBox(width: 6),
                                              Expanded(
                                                child: Text(
                                                  f,
                                                  style: TextStyle(
                                                    fontSize: isMobile ? 13 : 15,
                                                    color: const Color(0xFF374151),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ],
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
          if (partnerships != null) ...[
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: partnerships!
                  .map((p) => Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              p.name,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 14 : 16,
                                    color: const Color(0xFF1E293B),
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              p.details,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: isMobile ? 14 : 16,
                                    color: const Color(0xFF374151),
                                  ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
          if (extraContent != null) ...[
            const SizedBox(height: 16),
            extraContent!,
          ],
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                final route = sectionRoutes[sectionKey];
                if (route != null) {
                  developer.log('Subsection: Navigating to $route', name: 'Subsection');
                  if (context.mounted) {
                    Navigator.pushNamed(context, route).catchError((e) {
                      developer.log('Navigation error to $route: $e', name: 'Subsection');
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to navigate: $e')),
                        );
                      }
                      return null;
                    });
                  }
                } else {
                  developer.log('Subsection: No route defined for sectionKey: $sectionKey', name: 'Subsection');
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF1E293B),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: const Text('Learn More', style: TextStyle(fontWeight: FontWeight.w600)),
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
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CMMS Software Features',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 16 : 18,
                  color: const Color(0xFF1E293B),
                ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: isMobile ? 12 : 20,
            runSpacing: 12,
            children: featuresList
                .map((feature) => SizedBox(
                      width: isMobile ? screenWidth * 0.8 : isTablet ? screenWidth * 0.4 : screenWidth * 0.25,
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle_outline, size: 16, color: Color(0xFF22C55E)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              feature,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: isMobile ? 14 : 16,
                                color: const Color(0xFF374151),
                              ),
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