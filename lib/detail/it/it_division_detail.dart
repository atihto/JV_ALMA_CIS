import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/footer.dart';
import '../../widgets/header.dart';
import '../../widgets/responsive_utils.dart';

class ITDivisionDetail extends StatelessWidget {
  const ITDivisionDetail({super.key});

  static const List<Map<String, dynamic>> _products = [
    {
      'icon': LucideIcons.hardHat,
      'title': 'AlmaWorks',
      'subtitle': 'Construction Management Software',
      'description': 'Proprietary construction management platform designed for sensitive construction operations with comprehensive role-based security.',
      'route': '/alma-works',
      'color': Color(0xFF2563EB),
      'badge': 'Construction Solution',
      'features': [
        'Role-based access control',
        'Project & contract management',
        'Financial tracking & billing',
      ],
    },
    {
      'icon': LucideIcons.database,
      'title': 'NyumbaSmart - CMMS',
      'subtitle': 'Facility Management Platform',
      'description': 'Comprehensive facility management software with secure role-based access for multiple facility types and complete audit trails.',
      'route': '/cmms',
      'color': Color(0xFF7C3AED),
      'badge': 'Facility Management',
      'features': [
        'Multi-facility management',
        'Work order & maintenance tracking',
        'Document tracking & security',
      ],
    },
    {
      'icon': LucideIcons.smartphone,
      'title': 'Kilimo Mkononi',
      'subtitle': 'Agricultural Platform Suite',
      'description': 'Comprehensive agricultural platform with Enterprise and Education editions helping thousands of farmers across Kenya.',
      'route': '/kilimo-mkononi',
      'color': Color(0xFF059669),
      'badge': 'Agricultural Solutions',
      'features': [
        'Enterprise & Education editions',
        'Weather forecasting & crop management',
        'Pest management & soil health',
      ],
    },
    {
      'icon': LucideIcons.coffee,
      'title': 'Coffee Core',
      'subtitle': 'Coffee Farmers Network',
      'description': 'Dedicated platform connecting coffee farmers with cooperatives for better market access, pricing, and quality control.',
      'route': '/coffee-core',
      'color': Color(0xFFEA580C),
      'badge': 'Coffee Farmers',
      'features': [
        'Cooperative integration system',
        'Coffee-specific farming guidance',
        'Market access & yield tracking',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
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
                vertical: isMobile ? 32 : 48,
                horizontal: 16,
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
                        debugPrint('ITDivisionDetail: Navigating back to /business-units');
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/business-units',
                          (route) => false,
                        );
                      },
                      tooltip: 'Back to Business Units',
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 900),
                        child: Column(
                          children: [
                            Icon(
                              LucideIcons.globe,
                              size: isMobile ? 36 : 48,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'IT Division',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: isMobile ? 28 : 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Comprehensive solutions across the IT sector, powered by cutting-edge technology and innovation.',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: const Color(0xFFBFDBFE),
                                    fontSize: isMobile ? 13 : 15,
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

            // Main Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: isMobile ? 24 : 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Division Overview
                      Text(
                        'Our Software Solutions',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: isMobile ? 20 : 26,
                              color: const Color(0xFF1F2937),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Our in-house IT division develops cutting-edge software solutions that power our operations across all business units. From facility management systems to agricultural mobile applications, we create technology that drives efficiency and innovation.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: isMobile ? 13 : 15,
                              color: const Color(0xFF6B7280),
                              height: 1.6,
                            ),
                      ),
                      const SizedBox(height: 32),

                      // Products Grid - True side-by-side layout
                      if (isMobile)
                        Column(
                          children: _products.map((product) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: _buildProductCard(context, product, isMobile),
                          )).toList(),
                        )
                      else
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: _buildProductCard(context, _products[0], isMobile)),
                                const SizedBox(width: 16),
                                Expanded(child: _buildProductCard(context, _products[1], isMobile)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: _buildProductCard(context, _products[2], isMobile)),
                                const SizedBox(width: 16),
                                Expanded(child: _buildProductCard(context, _products[3], isMobile)),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product, bool isMobile) {
    final color = product['color'] as Color;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, product['route'] as String);
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon and Badge
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    product['icon'] as IconData,
                    color: color,
                    size: isMobile ? 24 : 28,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    product['badge'] as String,
                    style: TextStyle(
                      fontSize: isMobile ? 10 : 11,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              product['title'] as String,
              style: TextStyle(
                fontSize: isMobile ? 17 : 19,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 4),

            // Subtitle
            Text(
              product['subtitle'] as String,
              style: TextStyle(
                fontSize: isMobile ? 12 : 13,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              product['description'] as String,
              style: TextStyle(
                fontSize: isMobile ? 12 : 13,
                color: const Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),

            // Features
            ...(product['features'] as List<String>).map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    LucideIcons.checkCircle2,
                    size: 14,
                    color: color,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(
                        fontSize: isMobile ? 11 : 12,
                        color: const Color(0xFF4B5563),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 16),

            // Learn More Link
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
}