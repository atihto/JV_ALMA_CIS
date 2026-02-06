import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';

class BusinessUnitsPage extends StatelessWidget {
  const BusinessUnitsPage({super.key});

  static const List<Map<String, dynamic>> _businessUnits = [
    {
      'icon': LucideIcons.building,
      'title': 'Construction',
      'description': 'Comprehensive civil works including diplomatic and residential projects, infrastructure development, and facility maintenance management.',
      'route': '/construction-detail',
      'color': Color(0xFF2563EB),
    },
    {
      'icon': LucideIcons.sprout,
      'title': 'Agribusiness',
      'description': 'Empowering farmers with modern agricultural solutions, technical services, and smart digital farming tools promoting sustainable agriculture.',
      'route': '/agribusiness',
      'color': Color(0xFF059669),
    },
    {
      'icon': LucideIcons.droplets,
      'title': 'Oil & Gas',
      'description': 'Specialized inspection services and regulatory compliance for the oil and gas industry with certified expertise.',
      'route': '/oil-gas',
      'color': Color(0xFFEA580C),
    },
    {
      'icon': LucideIcons.globe,
      'title': 'Information Technology',
      'description': 'Cutting-edge software solutions including NyumbaSmart CMMS, CoffeeCore, and KilimoMkononi agricultural applications.',
      'route': '/it-division',
      'color': Color(0xFF7C3AED),
    },
  ];

  static const List<Map<String, dynamic>> _whyChooseUs = [
    {
      'icon': LucideIcons.award,
      'title': 'Proven Excellence',
      'description': 'Decades of experience delivering top-quality projects across industries.',
    },
    {
      'icon': LucideIcons.lightbulb,
      'title': 'Innovation-Driven',
      'description': 'Leveraging cutting-edge technology to solve complex challenges.',
    },
    {
      'icon': LucideIcons.leaf,
      'title': 'Sustainable Solutions',
      'description': 'Committed to environmentally responsible and sustainable practices.',
    },
    {
      'icon': LucideIcons.users,
      'title': 'Client-Centric Approach',
      'description': 'Building strong partnerships with a focus on client needs.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context, isMobile, screenWidth),
            _buildBusinessUnitsSection(context, isMobile, screenWidth),
            _buildWhyChooseUsSection(context, isMobile, screenWidth),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile, double screenWidth) {
    return Container(
      width: double.infinity,
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
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 40 : 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Our Business Units',
                style: TextStyle(
                  fontSize: isMobile ? 28 : 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Delivering innovative solutions across construction, agribusiness, oil & gas, and information technology.',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: const Color(0xFFBFDBFE),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusinessUnitsSection(BuildContext context, bool isMobile, double screenWidth) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 32 : 48,
        horizontal: isMobile ? 16 : 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Our Core Divisions',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Explore our diverse portfolio of services across multiple industries',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: const Color(0xFF64748B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              
              // Business Units - True side-by-side layout
              if (isMobile)
                Column(
                  children: _businessUnits.map((unit) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildBusinessUnitCard(context, unit, isMobile),
                  )).toList(),
                )
              else
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildBusinessUnitCard(context, _businessUnits[0], isMobile)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildBusinessUnitCard(context, _businessUnits[1], isMobile)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildBusinessUnitCard(context, _businessUnits[2], isMobile)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildBusinessUnitCard(context, _businessUnits[3], isMobile)),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusinessUnitCard(BuildContext context, Map<String, dynamic> unit, bool isMobile) {
    final color = unit['color'] as Color;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, unit['route'] as String);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                unit['icon'] as IconData,
                color: color,
                size: isMobile ? 28 : 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              unit['title'] as String,
              style: TextStyle(
                fontSize: isMobile ? 18 : 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              unit['description'] as String,
              style: TextStyle(
                fontSize: isMobile ? 13 : 14,
                color: const Color(0xFF64748B),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Learn more',
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 14,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  LucideIcons.arrowRight,
                  size: 16,
                  color: color,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWhyChooseUsSection(BuildContext context, bool isMobile, double screenWidth) {
    return Container(
      color: const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 32 : 48,
        horizontal: isMobile ? 16 : 24,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Text(
                'Why Choose Us',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Our commitment to quality and innovation sets us apart',
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: const Color(0xFF64748B),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              
              // Why Choose Us - True side-by-side layout
              if (isMobile)
                Column(
                  children: _whyChooseUs.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildWhyChooseUsCard(context, item, isMobile),
                  )).toList(),
                )
              else
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildWhyChooseUsCard(context, _whyChooseUs[0], isMobile)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildWhyChooseUsCard(context, _whyChooseUs[1], isMobile)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildWhyChooseUsCard(context, _whyChooseUs[2], isMobile)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildWhyChooseUsCard(context, _whyChooseUs[3], isMobile)),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWhyChooseUsCard(BuildContext context, Map<String, dynamic> item, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            item['icon'] as IconData,
            color: const Color(0xFF2563EB),
            size: isMobile ? 28 : 32,
          ),
          const SizedBox(height: 12),
          Text(
            item['title'] as String,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item['description'] as String,
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: const Color(0xFF64748B),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}