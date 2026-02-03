import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/responsive_utils.dart';

class KilimoMkononiEducationPage extends StatelessWidget {
  const KilimoMkononiEducationPage({super.key});

  static const List<Map<String, String>> _coreFeatures = [
    {
      'title': 'Farming Tips & Best Practices',
      'description': 'Comprehensive agricultural guidance tailored for educational purposes and student learning.'
    },
    {
      'title': 'Market Insights',
      'description': 'Real-time market data and pricing trends to teach students about agricultural economics.'
    },
    {
      'title': 'Weather Forecasting',
      'description': '5-day weather forecasts integrated with lessons on climate impact on agriculture.'
    },
    {
      'title': 'Field Data Input',
      'description': 'Hands-on data collection tools for students to document their agricultural projects.'
    },
    {
      'title': 'Pest & Disease Management',
      'description': 'Interactive pest identification and management strategies for student research.'
    },
    {
      'title': 'Farm Management Tools',
      'description': 'Digital tools for students to plan, track, and manage agricultural projects.'
    },
    {
      'title': 'Educational Manuals',
      'description': 'Curriculum-aligned agricultural manuals and reference materials for students.'
    },
  ];

  static const List<Map<String, String>> _educationFeatures = [
    {
      'icon': 'shield',
      'title': 'Three-Tier Approval System',
      'description': 'JV Admin approves headteachers, headteachers approve teachers, and teachers approve students - ensuring a safe, verified learning environment.'
    },
    {
      'icon': 'users',
      'title': 'Role-Based Access',
      'description': 'Distinct roles for headteachers, teachers, and students with appropriate permissions and safeguards for each level.'
    },
    {
      'icon': 'clipboardList',
      'title': 'Interactive Quizzes',
      'description': 'Teachers create custom quizzes to test student knowledge on farming concepts, crop management, and agricultural science.'
    },
    {
      'icon': 'cpu',
      'title': 'Farm Simulations',
      'description': 'Immersive simulation exercises where students can practice farming decisions in a virtual environment without real-world risks.'
    },
    {
      'icon': 'barChart',
      'title': 'Progress Tracking',
      'description': 'Teachers monitor student performance, quiz results, and simulation outcomes to guide learning paths.'
    },
    {
      'icon': 'graduationCap',
      'title': 'Curriculum Integration',
      'description': 'Content aligned with educational standards, making it easy to integrate into existing agricultural education programs.'
    },
  ];

  static const List<Map<String, dynamic>> _userRoles = [
    {
      'role': 'JV Admin',
      'icon': LucideIcons.shieldCheck,
      'color': Color(0xFF7C3AED),
      'responsibilities': [
        'Approve and manage headteachers',
        'Oversee platform integrity',
        'Monitor school registrations',
        'Ensure compliance with safety standards',
      ],
    },
    {
      'role': 'Headteacher',
      'icon': LucideIcons.school,
      'color': Color(0xFF2563EB),
      'responsibilities': [
        'Register and verify school teachers',
        'Manage school-level settings',
        'Monitor teacher and student activities',
        'Generate school-wide reports',
      ],
    },
    {
      'role': 'Teacher',
      'icon': LucideIcons.userCheck,
      'color': Color(0xFF059669),
      'responsibilities': [
        'Approve and manage students',
        'Create quizzes and simulations',
        'Track student progress',
        'Provide feedback and guidance',
      ],
    },
    {
      'role': 'Student',
      'icon': LucideIcons.bookOpen,
      'color': Color(0xFFEA580C),
      'responsibilities': [
        'Complete assigned quizzes',
        'Participate in farm simulations',
        'Access educational materials',
        'Track personal learning progress',
      ],
    },
  ];

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'shield':
        return LucideIcons.shieldCheck;
      case 'users':
        return LucideIcons.users;
      case 'clipboardList':
        return LucideIcons.clipboardList;
      case 'cpu':
        return LucideIcons.cpu;
      case 'barChart':
        return LucideIcons.barChart3;
      case 'graduationCap':
        return LucideIcons.graduationCap;
      default:
        return LucideIcons.check;
    }
  }

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
            // Header Section
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF7C3AED),
                    Color(0xFF2563EB),
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
                        debugPrint('KilimoMkononiEducationPage: Navigating back');
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
                              'Kilimo Mkononi Education',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    fontSize: isMobile ? 24 : 32,
                                    color: Colors.white,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Safe, Interactive Agricultural Learning for Schools',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: isMobile ? 14 : 16,
                                    color: const Color(0xFFDDD6FE),
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
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 16 : 24,
                horizontal: isMobile ? 12 : 16,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Introduction
                    _buildIntroSection(context, isMobile),
                    SizedBox(height: isMobile ? 24 : 32),

                    // Safety First Banner
                    _buildSafetyBanner(context, isMobile),
                    SizedBox(height: isMobile ? 24 : 32),

                    // User Roles Section
                    _buildUserRolesSection(context, isMobile, isTablet, screenWidth),
                    SizedBox(height: isMobile ? 24 : 32),

                    // Core Features
                    _buildFeaturesSection(
                      context,
                      isMobile,
                      isTablet,
                      screenWidth,
                      'Core Agricultural Features',
                      _coreFeatures,
                      const Color(0xFF059669),
                    ),
                    SizedBox(height: isMobile ? 24 : 32),

                    // Education-Specific Features
                    _buildEducationFeaturesSection(context, isMobile, isTablet, screenWidth),
                    SizedBox(height: isMobile ? 24 : 32),

                    // Coming Soon CTA
                    _buildComingSoonCTA(context, isMobile),
                  ],
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

  Widget _buildIntroSection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Empowering the Next Generation of Farmers',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 20 : 28,
                color: const Color(0xFF1F2937),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          'Kilimo Mkononi Education brings agricultural learning to life through interactive tools, hands-on simulations, and a secure platform designed specifically for schools. With built-in student protection measures and engaging educational content, we\'re making agricultural education accessible, safe, and exciting for students across Kenya.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF4B5563),
                height: 1.6,
              ),
        ),
      ],
    );
  }

  Widget _buildSafetyBanner(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFDCFCE7), Color(0xFFBBF7D0)],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF86EFAC), width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              LucideIcons.shieldCheck,
              color: Color(0xFF059669),
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Student Safety First',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: isMobile ? 16 : 20,
                        color: const Color(0xFF065F46),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Our three-tier approval system ensures every user is verified by trusted educational authorities, protecting students from fraudulent accounts and inappropriate interactions.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 12 : 14,
                        color: const Color(0xFF047857),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserRolesSection(BuildContext context, bool isMobile, bool isTablet, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How It Works: Verified Roles & Responsibilities',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 18 : 24,
                color: const Color(0xFF1F2937),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Our platform uses a hierarchical approval system to ensure accountability and safety at every level.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: isMobile ? 12 : 14,
                color: const Color(0xFF6B7280),
              ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: _userRoles.map((role) {
            return SizedBox(
              width: isMobile
                  ? double.infinity
                  : isTablet
                      ? (screenWidth - 48) / 2
                      : (screenWidth - 64) / 4,
              child: _buildRoleCard(
                context,
                isMobile,
                role['role'] as String,
                role['icon'] as IconData,
                role['color'] as Color,
                role['responsibilities'] as List<String>,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildRoleCard(
    BuildContext context,
    bool isMobile,
    String role,
    IconData icon,
    Color color,
    List<String> responsibilities,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  role,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: isMobile ? 14 : 16,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...responsibilities.map((responsibility) {
            return Padding(
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
                      responsibility,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: isMobile ? 11 : 13,
                            color: const Color(0xFF4B5563),
                          ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    double screenWidth,
    String title,
    List<Map<String, String>> features,
    Color accentColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 18 : 24,
                color: const Color(0xFF1F2937),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: isMobile ? 8 : 12,
          runSpacing: 12,
          children: features.map((feature) {
            return SizedBox(
              width: isMobile ? screenWidth * 0.9 : screenWidth * (isTablet ? 0.45 : 0.3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 16,
                    color: accentColor,
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
                                fontSize: isMobile ? 11 : 13,
                                color: const Color(0xFF6B7280),
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
      ],
    );
  }

  Widget _buildEducationFeaturesSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    double screenWidth,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Educational Enhancements',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 18 : 24,
                color: const Color(0xFF1F2937),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Purpose-built features that transform agricultural education into an engaging, interactive experience.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: isMobile ? 12 : 14,
                color: const Color(0xFF6B7280),
              ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: _educationFeatures.map((feature) {
            return SizedBox(
              width: isMobile
                  ? double.infinity
                  : isTablet
                      ? (screenWidth - 48) / 2
                      : (screenWidth - 64) / 3,
              child: _buildEducationFeatureCard(
                context,
                isMobile,
                feature['title'] as String,
                _getIconData(feature['icon'] as String),
                feature['description'] as String,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildEducationFeatureCard(
    BuildContext context,
    bool isMobile,
    String title,
    IconData icon,
    String description,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF5FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE9D5FF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF7C3AED), size: 32),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: isMobile ? 14 : 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1F2937),
                ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? 11 : 13,
                  color: const Color(0xFF6B7280),
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildComingSoonCTA(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7C3AED),
            Color(0xFF2563EB),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            LucideIcons.rocket,
            size: isMobile ? 48 : 64,
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          Text(
            'Coming Soon to Schools',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: isMobile ? 20 : 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Kilimo Mkononi Education is currently in development. We\'re working with schools to create the perfect agricultural learning platform.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: isMobile ? 14 : 16,
                  color: const Color(0xFFDDD6FE),
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Interested in bringing this to your school?',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? 12 : 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to contact page
              debugPrint('Navigating to contact page for Kilimo Mkononi Education');
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
              foregroundColor: const Color(0xFF7C3AED),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 12 : 16,
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