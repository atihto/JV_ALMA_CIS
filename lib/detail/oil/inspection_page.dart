import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/responsive_utils.dart';

class InspectionServicesPage extends StatelessWidget {
  const InspectionServicesPage({super.key});

  static const List<Map<String, String>> _features = [
    {
      'title': 'Safety inspections',
      'description': 'Conduct thorough safety checks to ensure compliance.'
    },
    {
      'title': 'Compliance audits',
      'description': 'Verify adherence to international oil and gas regulations.'
    },
    {
      'title': 'Technical assessments',
      'description': 'Evaluate equipment performance and integrity.'
    },
    {
      'title': 'Equipment testing',
      'description': 'Perform non-destructive testing for reliability.'
    },
  ];

  static const List<Map<String, String>> _projects = [
    {
      'title': 'Mombasa Terminal Inspection (2020-2023)',
      'description':
          'Comprehensive safety and compliance for for the Mombasa oil oil terminal, covering 50+ storage and tanks and pipelines, achieving 100% safety compliance.'
    },
    {
      'title': 'Lamu Gas Facility Audit (2021-2022)',
      'description':
          'Technical assessments and compliance for a new gas facility in Lamu, identifying 30+ potential risks and implementing corrective measures.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;
    final isTablet = screenWidth >= ResponsiveUtils.mobileBreakpoint &&
                        screenWidth <= ResponsiveUtils.tabletBreakpoint;
    debugPrint('InspectionServicesPage: Building with screenWidth=$screenWidth');

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Header(
                onMenuPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Menu pressed')),
                  );
                },
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF), Color(0xFF065F46)],
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 24 : 48,
                  horizontal: isMobile ? 8 : 16,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: Column(
                      children: [
                        Text(
                          'Oil & Gas Inspection Services',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: isMobile ? 24 : 32,
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Part of our Oil & Gas Services',
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
                        'Ensure Safety and Compliance?',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: isMobile ? 20 : 24,
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Contact us to learn how our inspection services can safeguard your oil & gas operations.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: isMobile ? 12 : 14,
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        text: 'Contact Us',
                        onPressed: () {
                          debugPrint('InspectionServicesPage: Navigating to /contact');
                          Navigator.pushNamed(context, '/contact');
                        },
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
                  LucideIcons.shield,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: Chip(
                  label: const Text('Inspection'),
                  backgroundColor: Colors.blue[50],
                  labelStyle: TextStyle(
                    color: Colors.blue[700],
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
                    LucideIcons.shield,
                    size: isTablet ? 40 : 48,
                    color: Colors.grey[400],
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Chip(
                    label: const Text('Inspection'),
                    backgroundColor: Colors.blue[50],
                    labelStyle: TextStyle(
                      color: Colors.blue[700],
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
            debugPrint('InspectionServicesPage: Attempting to navigate back');
            try {
              Navigator.pop(context);
            } catch (e) {
              debugPrint('InspectionServicesPage: Navigation error: $e');
              Navigator.pushNamed(context, '/business-units');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to go back, redirected to Business Units')),
              );
            }
          },
          tooltip: 'Back to Business Units',
        ),
        Text(
          'Inspection Services',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 20 : 24,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Our inspection services ensure safety, compliance, and reliability for oil and gas facilities in Mombasa.',
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
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Wrap(
            spacing: 12,
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
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _projects.length,
          itemBuilder: (context, index) {
            final project = _projects[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project['title']!,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 14 : 16,
                        color: const Color(0xFF2563EB),
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  project['description']!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 12 : 14,
                        color: const Color(0xFF4B5563),
                      ),
                ),
              ],
            );
          },
          separatorBuilder: (context, _) => const SizedBox(height: 12),
        ),
        const SizedBox(height: 16),
        CustomButton(
          text: 'Contact Us',
          onPressed: () {
            debugPrint('InspectionServicesPage: Navigating to /contact');
            Navigator.pushNamed(context, '/contact');
          },
        ),
      ],
    );
  }
}