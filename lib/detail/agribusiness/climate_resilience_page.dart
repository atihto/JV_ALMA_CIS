import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/custom_widgets.dart';

class ClimateResiliencePage extends StatelessWidget {
  const ClimateResiliencePage({super.key});

  // Define features with titles and descriptions
  static const List<Map<String, String>> _features = [
    {
      'title': 'Climate data analytics',
      'description': 'Predictive weather models for planning.'
    },
    {
      'title': 'Adaptive farming',
      'description': 'Drought-resistant crops and sustainable methods.'
    },
    {
      'title': 'Risk mitigation',
      'description': 'Early warnings and insurance for climate risks.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(
              onMenuPressed: () {
                // Implement your menu action here, e.g., open a drawer or show a menu
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Menu pressed')),
                );
              },
            ),
            // Hero Section
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF), Color(0xFF065F46)],
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 896),
                  child: const Column(
                    children: [
                      Text(
                        'Climate Resilience',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Part of our Agribusiness Solutions',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFBFDBFE),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Details Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 16),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    bool isLargeScreen = constraints.maxWidth > 768;
                    return Flex(
                      direction: isLargeScreen ? Axis.horizontal : Axis.vertical,
                      children: [
                        SizedBox(
                          height: isLargeScreen ? null : 256,
                          width: isLargeScreen ? 400 : null,
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  LucideIcons.leaf,
                                  size: 64,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ),
                              Positioned(
                                top: 16,
                                left: 16,
                                child: Chip(
                                  label: const Text('Agribusiness'),
                                  backgroundColor: Colors.green[50],
                                  labelStyle: const TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: const Icon(LucideIcons.arrowLeft, color: Colors.teal),
                                  onPressed: () => Navigator.pushNamed(context, '/business-units'),
                                  tooltip: 'Back to Business Units',
                                ),
                                const Text(
                                  'Climate Resilience',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Tools and strategies by JV Alma CIS for sustainable farming in changing climates. Our climate-smart practices, including drought-resistant crops and predictive analytics, help farmers in Kenya adapt to environmental challenges.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF4B5563),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Key Features:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Wrap(
                                  spacing: 16,
                                  runSpacing: 16,
                                  children: _features.map((feature) => SizedBox(
                                        width: isLargeScreen ? 300 : double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              LucideIcons.checkCircle,
                                              size: 12,
                                              color: Color(0xFF16A34A),
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    feature['title']!,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xFF4B5563),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    feature['description']!,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF4B5563),
                                                    ),
                                                    softWrap: true,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                      .toList(),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Impact:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Supported 1,500 farmers with climate-resilient practices.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF4B5563),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'Related Projects:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Machakos Climate-Smart Project (2020-2022)',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2563EB),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Introduced drought-resistant crops for 600 farmers.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF4B5563),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'Kitui Drought Resilience (2021-2023)',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2563EB),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Implemented analytics for 900 farmers, reducing crop loss by 30%.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF4B5563),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                CustomButton(
                                  text: 'Contact Us',
                                  onPressed: () => Navigator.pushNamed(context, '/contact'),
                                  isLarge: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            // CTA Section
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E40AF), Color(0xFF065F46)],
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 896),
                child: Column(
                  children: [
                    const Text(
                      'Ready to Build Climate Resilience?',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Contact us to explore our climate-smart solutions.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    CustomButton(
                      text: 'Contact Us',
                      onPressed: () => Navigator.pushNamed(context, '/contact'),
                      isLarge: true,
                    ),
                  ],
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}
