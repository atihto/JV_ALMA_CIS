/*import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/custom_widgets.dart';

class InfrastructurePage extends StatelessWidget {
  const InfrastructurePage({super.key});

  // Define features with titles and descriptions
  static const List<Map<String, String>> _features = [
    {
      'title': 'Road and highway construction',
      'description': 'Building durable roads to enhance connectivity across regions.'
    },
    {
      'title': 'Bridge engineering',
      'description': 'Designing resilient bridges for safe and reliable accessibility.'
    },
    {
      'title': 'Water supply systems',
      'description': 'Ensuring reliable water infrastructure for communities.'
    },
    {
      'title': 'Urban planning integration',
      'description': 'Aligning projects with sustainable city development plans.'
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
                        'Infrastructure Development',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Part of our Construction Services',
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
              padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 24),
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const AssetImage('assets/images/infrastructure.png'),
                              fit: BoxFit.cover,
                              onError: (exception, stackTrace) => const AssetImage('assets/images/placeholder.png'),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  LucideIcons.building2,
                                  size: 96,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              const Positioned(
                                top: 16,
                                left: 16,
                                child: Chip(
                                  label: Text('Construction'),
                                  backgroundColor: Color(0xFFDBEAFE),
                                  labelStyle: TextStyle(color: Color(0xFF2563EB)),
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
                                  'Infrastructure Development',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Our infrastructure development services deliver large-scale construction projects that transform connectivity and accessibility across Kenya. Specializing in roads, bridges, and water supply systems, we combine advanced engineering cushtool with local expertise to meet the unique challenges of rural and urban environments. Our projects, such as the Sigor Wei Wei Infrastructure Project, demonstrate our commitment to sustainable development and community impact.',
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
                                  'Improved connectivity for over 25,000 residents across multiple projects',
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
                                      'Sigor Wei Wei Wei Construction Project (2015-2017)',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2563EB),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Construction teams of 45km of rural roads, 3 major roads, bridges, and water supply systems, enhancing connectivity for over 10,000 residents.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF4B5563),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'Nairobi Commercial Complex (2019-2020)',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2563EB),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'A 12-story commercial building with modern office spaces, retail outlets, and parking facilities.',
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
                      'Ready to Build Your Infrastructure Project?',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Contact us to discuss how our infrastructure solutions can support your vision.',
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
