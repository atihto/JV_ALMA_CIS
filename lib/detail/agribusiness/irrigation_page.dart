/*import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/custom_widgets.dart';

class IrrigationPage extends StatelessWidget {
  const IrrigationPage({super.key});

  // Define features with titles and descriptions
  static const List<Map<String, String>> _features = [
    {
      'title': 'Soil moisture sensors',
      'description': 'Monitor soil water levels for precise irrigation.'
    },
    {
      'title': 'Automated irrigation control',
      'description': 'Automate water delivery based on real-time data.'
    },
    {
      'title': 'Weather-based scheduling',
      'description': 'Adjust irrigation using weather forecasts.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
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
                        'Smart Irrigation Projects',
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
                        Container(
                          height: isLargeScreen ? null : 256,
                          width: isLargeScreen ? 400 : null,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/irrigation.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  LucideIcons.droplets,
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
                                const Text(
                                  'Smart Irrigation Projects',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Our smart irrigation projects leverage IoT-enabled systems to optimize water usage and enhance crop yields. By integrating soil moisture sensors, automated controls, and weather-based scheduling, we empower farmers to achieve sustainable and efficient water management in semi-arid regions of Kenya.',
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
                                  'Achieved 40% water savings and 25% yield increase across implemented projects.',
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
                                      'Baringo Irrigation Project (2018-2020)',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2563EB),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Implemented IoT-based irrigation for 500 farmers, saving 35% water.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF4B5563),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'Kitui Smart Farms (2021-2023)',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2563EB),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Deployed automated irrigation systems, boosting yields by 20%.',
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
                      'Ready to Optimize Your Irrigation?',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Contact us to explore our smart irrigation solutions for your farm.',
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
}*/
