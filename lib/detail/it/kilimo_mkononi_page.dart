import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/responsive_utils.dart';

class KilimoMkononiPage extends StatelessWidget {
  const KilimoMkononiPage({super.key});

  static const List<Map<String, String>> _features = [
    {
      'title': 'Tailored Crop Tips',
      'description': 'Practical planting, spacing, soil, and pest guidance specific to selected crops.'
    },
    {
      'title': 'Market Price Advantage',
      'description': 'Access to region-specific price predictions to support direct, profitable sales.'
    },
    {
      'title': 'Weather Planning',
      'description': '5-day forecasts to inform planting, irrigation, and harvest schedules.'
    },
    {
      'title': 'Soil Health Mastery',
      'description': 'Fertility and pH recommendations based on entered soil test data.'
    },
    {
      'title': 'Crop Protection',
      'description': 'Stage-based identification and guidance on managing pests and diseases using chemical or natural options.'
    },
    {
      'title': 'Farm Finance Tracking',
      'description': 'Record-keeping tools for expenses, income, and loan tracking to improve financial planning.'
    },
    {
      'title': 'Innovative Guides',
      'description': 'Certified agricultural techniques to improve yields and introduce sustainable practices.'
    },
  ];

  static const List<Map<String, String>> _media = [
    {
      'type': 'image',
      'path': 'assets/images/agribusiness/tailored_crop_tips.jpg',
      'description': 'Practical planting, spacing, soil, and pest guidance specific to selected crops.',
    },
    {
      'type': 'image',
      'path': 'assets/images/agribusiness/weather_planning.jpg',
      'description': '5-day forecasts to inform planting, irrigation, and harvest schedules.',
    },
    {
      'type': 'image',
      'path': 'assets/images/agribusiness/soil_health_mastery.jpg',
      'description': 'Fertility and pH recommendations based on entered soil test data.',
    },
    {
      'type': 'image',
      'path': 'assets/images/agribusiness/crop_protection.jpg',
      'description': 'Stage-based identification and guidance on managing pests and diseases using chemical or natural options.',
    },
    {
      'type': 'image',
      'path': 'assets/images/agribusiness/farm_finance_tracking.jpg',
      'description': 'Record-keeping tools for expenses, income, and loan tracking to improve financial planning.',
    },
    {
      'type': 'image',
      'path': 'assets/images/agribusiness/innovative_guides.jpg',
      'description': 'Certified agricultural techniques to improve yields and introduce sustainable practices.',
    },
    {
      'type': 'image',
      'path': 'assets/images/agribusiness/data_processing.jpg',
      'description': 'Data processing for precision farming.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;
    final isTablet = screenWidth >= ResponsiveUtils.mobileBreakpoint &&
        screenWidth <= ResponsiveUtils.tabletBreakpoint;
    debugPrint('KilimoMkononiPage: Building with screenWidth=$screenWidth');

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
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: Column(
                      children: [
                        Text(
                          'Kilimo Mkononi',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: isMobile ? 24 : 32,
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Farming in the Palm of your Hand',
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
                        'Ready to Transform Your Farming Operations?',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: isMobile ? 20 : 24,
                              color: Colors.white,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Contact us to learn how Kilimo Mkononi can empower your farm.',
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
                          debugPrint('KilimoMkononiPage: Navigating to /contact');
                          Navigator.pushNamed(context, '/contact');
                        },
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
                  LucideIcons.smartphone,
                  size: 40,
                  color: Colors.grey[400],
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: Chip(
                  label: const Text('IT Division'),
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
                    LucideIcons.smartphone,
                    size: isTablet ? 40 : 48,
                    color: Colors.grey[400],
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Chip(
                    label: const Text('IT Division'),
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
            debugPrint('KilimoMkononiPage: Attempting to navigate back');
            try {
              Navigator.pop(context);
            } catch (e) {
              debugPrint('KilimoMkononiPage: Navigation error: $e');
              Navigator.pushNamed(context, '/it-division');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to go back, redirected to IT Division')),
              );
            }
          },
          tooltip: 'Back to IT Division',
        ),
        Text(
          'Kilimo Mkononi',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 20 : 24,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'As a result of hands-on work with farming communities and real-world feedback, KilimoMkononi was developed to provide farmers with accessible, actionable tools directly on their mobile phones. KilimoMkononi helps farmers growing Beans, Maize, Carrots, Tomatoes, Onions, Courgettes, and Green Peppers to Grow, Protect, and Prosper.',
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
        const SizedBox(height: 12),
        Text(
          'Impact',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'KilimoMkononi enables smarter, more resilient farming by combining on-the-ground experience with cutting-edge digital tools. It enhances income, strengthens communities, and contributes to a more sustainable agricultural future.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: isMobile ? 12 : 14,
                color: const Color(0xFF4B5563),
              ),
        ),
        const SizedBox(height: 16),
        CustomButton(
          text: 'Download Coming Soon!',
          icon: LucideIcons.download,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('App coming soon! Stay tuned for the release.')),
            );
          },
        ),
      ],
    );
  }
}