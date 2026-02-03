import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/responsive_utils.dart';

class AlmaWorksPage extends StatelessWidget {
  const AlmaWorksPage({super.key});

  static const List<Map<String, dynamic>> _coreFeatures = [
    {
      'icon': LucideIcons.users,
      'title': 'Role-Based Access Control',
      'description': 'Hierarchical user management with customizable permissions for administrators, project managers, contractors, and clients.',
      'color': Color(0xFF2563EB),
    },
    {
      'icon': LucideIcons.userCheck,
      'title': 'Client & Employee Management',
      'description': 'Comprehensive database for managing construction clients, employees, and team assignments across multiple projects.',
      'color': Color(0xFF7C3AED),
    },
    {
      'icon': LucideIcons.fileText,
      'title': 'Contract Administration',
      'description': 'Centralized contract management system tracking agreements, milestones, deliverables, and contractual obligations.',
      'color': Color(0xFF059669),
    },
    {
      'icon': LucideIcons.phone,
      'title': 'Supplier & Client Contacts',
      'description': 'Organized contact database for suppliers, subcontractors, and clients with communication history and interaction logs.',
      'color': Color(0xFFEA580C),
    },
    {
      'icon': LucideIcons.fileImage,
      'title': 'Drawing & Document Storage',
      'description': 'Secure storage and version control for architectural drawings, blueprints, permits, and project documentation.',
      'color': Color(0xFFDC2626),
    },
    {
      'icon': LucideIcons.dollarSign,
      'title': 'Financial Management',
      'description': 'Comprehensive financial tracking for clients and contractors including invoicing, payments, budgets, and cost analysis.',
      'color': Color(0xFF16A34A),
    },
  ];

  static const List<Map<String, dynamic>> _advancedFeatures = [
    {
      'icon': LucideIcons.messageSquare,
      'title': 'Client-Contractor Communication',
      'description': 'Built-in messaging system facilitating seamless communication between clients and contractors with threaded conversations and file attachments.',
      'color': Color(0xFF0891B2),
    },
    {
      'icon': LucideIcons.shieldCheck,
      'title': 'Quality & Safety Management',
      'description': 'Tools for quality inspections, safety checklists, incident reporting, and compliance tracking to maintain construction standards.',
      'color': Color(0xFFF59E0B),
    },
    {
      'icon': LucideIcons.fileBarChart,
      'title': 'Progress Reports',
      'description': 'Automated generation of weekly and monthly progress reports with customizable templates and data visualization.',
      'color': Color(0xFF8B5CF6),
    },
    {
      'icon': LucideIcons.camera,
      'title': 'Photo Gallery & Documentation',
      'description': 'Organized photo gallery for documenting construction progress, before/after comparisons, and site inspections with geo-tagging.',
      'color': Color(0xFFEC4899),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;
    final isTablet = screenWidth >= ResponsiveUtils.mobileBreakpoint &&
        screenWidth <= ResponsiveUtils.tabletBreakpoint;

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
                    Color(0xFF1E3A8A),
                    Color(0xFF3B82F6),
                  ],
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 32 : 64,
                horizontal: isMobile ? 16 : 24,
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
                        debugPrint('AlmaWorksPage: Navigating back');
                        Navigator.pop(context);
                      },
                      tooltip: 'Back',
                    ),
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 1000),
                        child: Column(
                          children: [
                            Icon(
                              LucideIcons.hardHat,
                              size: isMobile ? 48 : 64,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'AlmaWorks',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    fontSize: isMobile ? 32 : 48,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Construction Management Software',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontSize: isMobile ? 16 : 20,
                                    color: const Color(0xFFBFDBFE),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 700),
                              child: Text(
                                'Proprietary construction management platform designed for sensitive construction operations. Streamline your projects from planning to completion with comprehensive tools for team collaboration, client communication, and project oversight.',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: isMobile ? 14 : 16,
                                      color: const Color(0xFFDDD6FE),
                                    ),
                                textAlign: TextAlign.center,
                              ),
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
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 32 : 48,
                horizontal: isMobile ? 16 : 24,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Overview Section
                    _buildOverviewSection(context, isMobile),
                    SizedBox(height: isMobile ? 40 : 64),

                    // Core Features
                    _buildSectionTitle(
                      context,
                      isMobile,
                      'Core Features',
                      'Essential tools for modern construction management',
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureGrid(context, isMobile, isTablet, screenWidth, _coreFeatures),
                    SizedBox(height: isMobile ? 40 : 64),

                    // Advanced Features
                    _buildSectionTitle(
                      context,
                      isMobile,
                      'Advanced Capabilities',
                      'Enhanced functionality for comprehensive project control',
                    ),
                    const SizedBox(height: 24),
                    _buildFeatureGrid(context, isMobile, isTablet, screenWidth, _advancedFeatures),
                    SizedBox(height: isMobile ? 40 : 64),

                    // Benefits Section
                    _buildBenefitsSection(context, isMobile, isTablet, screenWidth),
                    SizedBox(height: isMobile ? 40 : 64),

                    // CTA Section
                    _buildCTASection(context, isMobile),
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

  Widget _buildOverviewSection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Designed for Construction Excellence',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 24 : 32,
                color: const Color(0xFF1F2937),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'AlmaWorks is JV ALMA C.I.S\'s proprietary construction management software, built from the ground up to address the unique challenges of construction project management. Developed through years of hands-on experience in the construction industry, AlmaWorks provides a comprehensive solution that keeps your projects on track, your teams coordinated, and your clients informed.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF4B5563),
                height: 1.6,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          'Whether you\'re managing a single project or overseeing multiple construction sites, AlmaWorks gives you the visibility and control needed to deliver exceptional results.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF4B5563),
                height: 1.6,
              ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, bool isMobile, String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 20 : 28,
                color: const Color(0xFF1F2937),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: isMobile ? 13 : 15,
                color: const Color(0xFF6B7280),
              ),
        ),
      ],
    );
  }

  Widget _buildFeatureGrid(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    double screenWidth,
    List<Map<String, dynamic>> features,
  ) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: features.map((feature) {
        return SizedBox(
          width: isMobile
              ? double.infinity
              : isTablet
                  ? (screenWidth - 64) / 2
                  : (screenWidth - 80) / 3,
          child: _buildFeatureCard(
            context,
            isMobile,
            feature['icon'] as IconData,
            feature['title'] as String,
            feature['description'] as String,
            feature['color'] as Color,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    bool isMobile,
    IconData icon,
    String title,
    String description,
    Color color,
  ) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
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
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: isMobile ? 24 : 28),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: isMobile ? 15 : 17,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1F2937),
                ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? 12 : 14,
                  color: const Color(0xFF6B7280),
                  height: 1.5,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitsSection(BuildContext context, bool isMobile, bool isTablet, double screenWidth) {
    final benefits = [
      {
        'icon': LucideIcons.zap,
        'title': 'Increased Efficiency',
        'description': 'Streamline workflows and reduce administrative overhead',
      },
      {
        'icon': LucideIcons.eye,
        'title': 'Enhanced Visibility',
        'description': 'Real-time insights into project status and performance',
      },
      {
        'icon': LucideIcons.shield,
        'title': 'Improved Compliance',
        'description': 'Maintain safety and quality standards with built-in checks',
      },
      {
        'icon': LucideIcons.trendingUp,
        'title': 'Better Outcomes',
        'description': 'Deliver projects on time and within budget consistently',
      },
    ];

    return Container(
      padding: EdgeInsets.all(isMobile ? 24 : 32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEFF6FF), Color(0xFFDDEAFE)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'Why Choose AlmaWorks?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: isMobile ? 20 : 28,
                  color: const Color(0xFF1E3A8A),
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: benefits.map((benefit) {
              return SizedBox(
                width: isMobile
                    ? double.infinity
                    : isTablet
                        ? (screenWidth - 96) / 2
                        : 250,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x193B82F6),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        benefit['icon'] as IconData,
                        color: const Color(0xFF3B82F6),
                        size: 32,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      benefit['title'] as String,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1F2937),
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      benefit['description'] as String,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: isMobile ? 12 : 13,
                            color: const Color(0xFF6B7280),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCTASection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E3A8A),
            Color(0xFF3B82F6),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            LucideIcons.building2,
            size: isMobile ? 48 : 64,
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          Text(
            'Built by Construction Professionals, for Construction Professionals',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: isMobile ? 18 : 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'AlmaWorks is currently used internally by JV ALMA C.I.S for managing our construction projects. Interest in learning more about how AlmaWorks can transform your construction operations?',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: isMobile ? 13 : 15,
                  color: const Color(0xFFDDD6FE),
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              debugPrint('Navigating to contact page for AlmaWorks inquiry');
              Navigator.pushNamed(context, '/contact');
            },
            icon: const Icon(LucideIcons.mail, size: 20),
            label: Text(
              'Contact Us',
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF1E3A8A),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 14 : 18,
                horizontal: 32,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}