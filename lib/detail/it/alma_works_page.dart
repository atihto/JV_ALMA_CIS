import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/responsive_utils.dart';

class AlmaWorksPage extends StatelessWidget {
  const AlmaWorksPage({super.key});

  static const List<Map<String, dynamic>> _userRoles = [
    {
      'role': 'JV Admin',
      'icon': LucideIcons.shieldCheck,
      'color': Color(0xFF7C3AED),
      'responsibilities': [
        'Approves client and employee registrations',
        'Manages system-wide permissions and access',
        'Oversees all construction projects',
        'Controls document access and visibility',
      ],
    },
    {
      'role': 'Project Managers',
      'icon': LucideIcons.userCheck,
      'color': Color(0xFF2563EB),
      'responsibilities': [
        'Manage project timelines and milestones',
        'Assign tasks to contractors and teams',
        'Monitor project progress and budgets',
        'Generate progress reports and documentation',
      ],
    },
    {
      'role': 'Contractors',
      'icon': LucideIcons.hardHat,
      'color': Color(0xFFEA580C),
      'responsibilities': [
        'Access assigned work orders and tasks',
        'Update work progress and completion status',
        'Upload site photos and documentation',
        'Submit billing and cost information',
      ],
    },
    {
      'role': 'Clients',
      'icon': LucideIcons.building2,
      'color': Color(0xFF059669),
      'responsibilities': [
        'View project progress and updates',
        'Access approved drawings and documents',
        'Communicate with project managers',
        'Track project milestones and deliverables',
      ],
    },
  ];

  static const List<Map<String, String>> _securityFeatures = [
    {
      'title': 'Approval-Based Access',
      'description': 'All users require JV Admin approval before accessing the platform, ensuring secure access control.',
    },
    {
      'title': 'Role-Based Permissions',
      'description': 'Hierarchical access control ensures users only see data relevant to their role and projects.',
    },
    {
      'title': 'Audit Trail',
      'description': 'Complete tracking of who viewed, edited, or downloaded documents with timestamps for accountability.',
    },
    {
      'title': 'Project-Based Access',
      'description': 'Users only access projects they are authorized for, ensuring complete data separation.',
    },
  ];

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
      'description': 'Built-in messaging system facilitating seamless communication between clients and contractors with threaded conversations.',
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

  static const List<Map<String, dynamic>> _benefits = [
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section - Compact
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
                vertical: isMobile ? 24 : 40,
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
                        constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 900),
                        child: Column(
                          children: [
                            Icon(
                              LucideIcons.hardHat,
                              size: isMobile ? 36 : 48,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'AlmaWorks',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    fontSize: isMobile ? 28 : 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Construction Management Software',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontSize: isMobile ? 14 : 18,
                                    color: const Color(0xFFBFDBFE),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 700),
                              child: Text(
                                'Proprietary construction management platform designed for sensitive construction operations with comprehensive role-based security.',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: isMobile ? 12 : 14,
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
                vertical: isMobile ? 20 : 32,
                horizontal: isMobile ? 16 : 24,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Roles Section
                      Text(
                        'User Roles & Permissions',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: isMobile ? 18 : 22,
                              color: const Color(0xFF1F2937),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'AlmaWorks features hierarchical access control for construction project management:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: isMobile ? 12 : 14,
                              color: const Color(0xFF6B7280),
                            ),
                      ),
                      const SizedBox(height: 16),
                      
                      // User Role Cards - True side-by-side
                      _buildRoleCards(context, isMobile, screenWidth),
                      const SizedBox(height: 24),

                      // Security Features Section
                      Text(
                        'Security & Access Control',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: isMobile ? 18 : 22,
                              color: const Color(0xFF1F2937),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 12),
                      
                      _buildSecurityCards(context, isMobile, screenWidth),
                      const SizedBox(height: 24),

                      // Core Features Section
                      Text(
                        'Core Features',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: isMobile ? 18 : 22,
                              color: const Color(0xFF1F2937),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Essential tools for modern construction management',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: isMobile ? 12 : 14,
                              color: const Color(0xFF6B7280),
                            ),
                      ),
                      const SizedBox(height: 16),
                      
                      _buildFeatureCards(context, _coreFeatures, isMobile, screenWidth),
                      const SizedBox(height: 24),

                      // Advanced Features Section
                      Text(
                        'Advanced Capabilities',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: isMobile ? 18 : 22,
                              color: const Color(0xFF1F2937),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Enhanced functionality for comprehensive project oversight',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: isMobile ? 12 : 14,
                              color: const Color(0xFF6B7280),
                            ),
                      ),
                      const SizedBox(height: 16),
                      
                      _buildFeatureCards(context, _advancedFeatures, isMobile, screenWidth),
                      const SizedBox(height: 24),

                      // Benefits Section
                      _buildBenefitsSection(context, isMobile, screenWidth),
                      const SizedBox(height: 20),

                      // CTA Section
                      _buildCTASection(context, isMobile),
                    ],
                  ),
                ),
              ),
            ),

            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleCards(BuildContext context, bool isMobile, double screenWidth) {
    if (isMobile) {
      return Column(
        children: _userRoles.map((role) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildRoleCard(context, role, isMobile),
        )).toList(),
      );
    } else {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildRoleCard(context, _userRoles[0], isMobile)),
              const SizedBox(width: 12),
              Expanded(child: _buildRoleCard(context, _userRoles[1], isMobile)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildRoleCard(context, _userRoles[2], isMobile)),
              const SizedBox(width: 12),
              Expanded(child: _buildRoleCard(context, _userRoles[3], isMobile)),
            ],
          ),
        ],
      );
    }
  }

  Widget _buildRoleCard(BuildContext context, Map<String, dynamic> role, bool isMobile) {
    final color = role['color'] as Color;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(role['icon'] as IconData, color: color, size: isMobile ? 18 : 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  role['role'] as String,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: isMobile ? 13 : 15,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...(role['responsibilities'] as List<String>).map((resp) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(LucideIcons.checkCircle2, size: 14, color: color),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        resp,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: isMobile ? 10 : 12,
                              color: const Color(0xFF4B5563),
                              height: 1.3,
                            ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSecurityCards(BuildContext context, bool isMobile, double screenWidth) {
    if (isMobile) {
      return Column(
        children: _securityFeatures.map((feature) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildSecurityCard(context, feature, isMobile),
        )).toList(),
      );
    } else {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildSecurityCard(context, _securityFeatures[0], isMobile)),
              const SizedBox(width: 12),
              Expanded(child: _buildSecurityCard(context, _securityFeatures[1], isMobile)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildSecurityCard(context, _securityFeatures[2], isMobile)),
              const SizedBox(width: 12),
              Expanded(child: _buildSecurityCard(context, _securityFeatures[3], isMobile)),
            ],
          ),
        ],
      );
    }
  }

  Widget _buildSecurityCard(BuildContext context, Map<String, String> feature, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(LucideIcons.shield, size: 18, color: Colors.red[700]),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  feature['title']!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 12 : 13,
                        color: Colors.red[900],
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            feature['description']!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? 10 : 12,
                  color: Colors.red[800],
                  height: 1.3,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCards(BuildContext context, List<Map<String, dynamic>> features, bool isMobile, double screenWidth) {
    if (isMobile) {
      return Column(
        children: features.map((feature) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildFeatureCard(context, feature, isMobile),
        )).toList(),
      );
    } else {
      final rows = <Widget>[];
      for (int i = 0; i < features.length; i += 2) {
        rows.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildFeatureCard(context, features[i], isMobile)),
              const SizedBox(width: 12),
              if (i + 1 < features.length)
                Expanded(child: _buildFeatureCard(context, features[i + 1], isMobile))
              else
                const Expanded(child: SizedBox()),
            ],
          ),
        );
        if (i + 2 < features.length) {
          rows.add(const SizedBox(height: 12));
        }
      }
      return Column(children: rows);
    }
  }

  Widget _buildFeatureCard(BuildContext context, Map<String, dynamic> feature, bool isMobile) {
    final color = feature['color'] as Color;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(feature['icon'] as IconData, color: color, size: isMobile ? 18 : 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  feature['title'] as String,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: isMobile ? 13 : 15,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F2937),
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            feature['description'] as String,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? 11 : 12,
                  color: const Color(0xFF6B7280),
                  height: 1.4,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitsSection(BuildContext context, bool isMobile, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFEFF6FF), Color(0xFFDDEAFE)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Why Choose AlmaWorks?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: isMobile ? 18 : 22,
                  color: const Color(0xFF1E3A8A),
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          
          if (isMobile)
            Column(
              children: _benefits.map((benefit) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildBenefitCard(context, benefit, isMobile),
              )).toList(),
            )
          else
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildBenefitCard(context, _benefits[0], isMobile)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildBenefitCard(context, _benefits[1], isMobile)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildBenefitCard(context, _benefits[2], isMobile)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildBenefitCard(context, _benefits[3], isMobile)),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildBenefitCard(BuildContext context, Map<String, dynamic> benefit, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(benefit['icon'] as IconData, color: const Color(0xFF3B82F6), size: isMobile ? 24 : 28),
          const SizedBox(height: 8),
          Text(
            benefit['title'] as String,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: isMobile ? 13 : 15,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1F2937),
                ),
          ),
          const SizedBox(height: 6),
          Text(
            benefit['description'] as String,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: isMobile ? 11 : 12,
                  color: const Color(0xFF6B7280),
                  height: 1.3,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildCTASection(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E3A8A),
            Color(0xFF3B82F6),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(LucideIcons.building2, size: isMobile ? 40 : 52, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            'Built by Construction Professionals',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: isMobile ? 18 : 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'AlmaWorks is currently used internally by JV ALMA C.I.S for managing our construction projects. Interested in learning more?',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: isMobile ? 12 : 14,
                  color: const Color(0xFFDDD6FE),
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: isMobile ? double.infinity : 250,
            child: ElevatedButton.icon(
              onPressed: () {
                debugPrint('Navigating to contact page for AlmaWorks inquiry');
                Navigator.pushNamed(context, '/contact');
              },
              icon: const Icon(LucideIcons.mail, size: 20),
              label: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: isMobile ? 15 : 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF1E3A8A),
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 14 : 18,
                  horizontal: 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}