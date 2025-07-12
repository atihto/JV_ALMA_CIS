import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/responsive_utils.dart';

class CmmsPage extends StatelessWidget {
  const CmmsPage({super.key});

  static const List<Map<String, String>> _features = [
    {
      'title': 'Work order management',
      'description': 'Streamline creation, assignment, and tracking of work orders.'
    },
    {
      'title': 'Asset tracking and monitoring',
      'description': 'Manage equipment details like location and condition.'
    },
    {
      'title': 'Preventive maintenance scheduling',
      'description': 'Automate maintenance tasks to prevent failures.'
    },
    {
      'title': 'Inventory management',
      'description': 'Monitor spare parts to support maintenance activities.'
    },
    {
      'title': 'Reporting and analytics',
      'description': 'Gain insights with maintenance performance reports.'
    },
    {
      'title': 'Mobile accessibility',
      'description': 'Access Nyumba Smart - CMMS features on mobile devices anywhere.'
    },
  ];

  static const List<Map<String, String>> _media = [
    {
      'type': 'image',
      'path': 'assets/apk/cmms_overview.jpg',
      'description': 'CMMS Overview.',
    },
    {
      'type': 'image',
      'path': 'assets/apk/nyumba_dashboard.jpg',
      'description': 'CMMS mobile app view.',
    },
    {
      'type': 'image',
      'path': 'assets/apk/nyumba_mobile_section.jpg',
      'description': 'CMMS mobile app section view.',
    },
    {
      'type': 'image',
      'path': 'assets/apk/cmms_desktop_view.jpg',
      'description': 'CMMS dashboard section interface.',
    },
    {
      'type': 'image',
      'path': 'assets/apk/cmms_desktop_view1.jpg',
      'description': 'CMMS dashboard section view.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;
    final isTablet = screenWidth >= ResponsiveUtils.mobileBreakpoint &&
        screenWidth <= ResponsiveUtils.tabletBreakpoint;
    debugPrint('CmmsPage: Building with screenWidth=$screenWidth');

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
                vertical: isMobile ? 24 : 48,
                horizontal: isMobile ? 8 : 16,
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
                        debugPrint('CmmsPage: Navigating back');
                        Navigator.pop(context);
                      },
                      tooltip: 'Back',
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
                        child: Column(
                          children: [
                            Text(
                              'NyumbaSmart - CMMS Software/Application',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    fontSize: isMobile ? 24 : 32,
                                    color: Colors.white,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Building Maintenance Solution',
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
                child: isMobile
                    ? _buildMobileLayout(context, screenWidth)
                    : _buildDesktopTabletLayout(context, screenWidth, isTablet),
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
                  LucideIcons.database,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: Chip(
                  label: const Text('IT Division'),
                  backgroundColor: Colors.purple[50],
                  labelStyle: TextStyle(
                    color: Colors.purple[700],
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
                    LucideIcons.database,
                    size: isTablet ? 40 : 48,
                    color: Colors.grey[400],
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Chip(
                    label: const Text('IT Division'),
                    backgroundColor: Colors.purple[50],
                    labelStyle: TextStyle(
                      color: Colors.purple[700],
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
        Text(
          'NyumbaSmart - CMMS Software',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 20 : 24,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Our proprietary NyumbaSmart - Computerized Maintenance Management System (CMMS) software, designed for construction and facility management, streamlines operations within facilities.',
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
          'Media',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: isMobile ? 12 : 16,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: _media.map((media) {
            return SizedBox(
              width: isMobile ? screenWidth * 0.9 : screenWidth * (isTablet ? 0.45 : 0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (media['type'] == 'image')
                    Semantics(
                      image: true,
                      label: media['description'],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: isMobile ? 200 : 300,
                          child: Image.asset(
                            media['path']!,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.grey[200],
                              child: const Center(
                                child: Icon(LucideIcons.imageOff, color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      media['description']!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 12 : 14,
                            color: const Color(0xFF4B5563),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}