import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/responsive_utils.dart';

class CoffeeCorePage extends StatelessWidget {
  const CoffeeCorePage({super.key});

  static const List<Map<String, dynamic>> _adminRoles = [
    {
      'role': 'JV Admin',
      'icon': LucideIcons.shieldCheck,
      'color': Color(0xFF7C3AED),
      'responsibilities': [
        'Approves cooperative administrator applications',
        'Oversees platform operations and integrity',
        'Manages system-wide configurations',
        'Monitors cooperative registrations',
      ],
    },
    {
      'role': 'Cooperative Admin',
      'icon': LucideIcons.building2,
      'color': Color(0xFF2563EB),
      'responsibilities': [
        'Registers cooperative name for farmer selection',
        'Assigns Market Manager and Loan Manager roles',
        'Manages cooperative member database',
        'Oversees cooperative operations on the platform',
      ],
    },
    {
      'role': 'Market Manager',
      'icon': LucideIcons.trendingUp,
      'color': Color(0xFF059669),
      'responsibilities': [
        'Sets coffee varieties available to cooperative members',
        'Updates market prices for different coffee grades',
        'Provides tailored market insights to members',
        'Manages buyer connections for the cooperative',
      ],
    },
    {
      'role': 'Loan Manager',
      'icon': LucideIcons.wallet,
      'color': Color(0xFFEA580C),
      'responsibilities': [
        'Reviews and approves member loan applications',
        'Tracks loan repayment schedules',
        'Manages cooperative credit facilities',
        'Provides direct loan access to verified farmers',
      ],
    },
  ];

  static const List<Map<String, String>> _farmerBenefits = [
    {
      'title': 'Tailored Market Access',
      'description': 'Receive market prices and information specific to your cooperative membership, filtering out irrelevant data from other cooperatives.'
    },
    {
      'title': 'Direct Loan Access',
      'description': 'Get loans directly from your cooperative and affiliates without dealing with unknown creditors or middlemen.'
    },
    {
      'title': 'Streamlined Operations',
      'description': 'No more run-arounds - cooperatives manage members and loans efficiently through the platform.'
    },
    {
      'title': 'Protected Transactions',
      'description': 'Avoid being duped by unauthorized creditors - all loans are managed through verified cooperative channels.'
    },
  ];

  static const List<Map<String, String>> _features = [
    {
      'title': 'Cultivation Guidance',
      'description': 'Expert tips for coffee planting and growth optimization.'
    },
    {
      'title': 'Cooperative-Specific Pricing',
      'description': 'Real-time market prices tailored to your cooperative membership.'
    },
    {
      'title': 'Weather Monitoring',
      'description': 'Tailored forecasts to protect coffee crops.'
    },
    {
      'title': 'Soil Health',
      'description': 'Soil management for sustainable coffee farming.'
    },
    {
      'title': 'Pest Control',
      'description': 'Solutions for coffee-specific pests like berry borers.'
    },
    {
      'title': 'Loan Management',
      'description': 'Track your cooperative loans and repayment schedules.'
    },
  ];

  static const List<Map<String, String>> _media = [
    {
      'type': 'image',
      'path': 'assets/apk/coffee_mobile_view.jpg',
      'description': 'Coffee Core mobile app interface.',
    },
    {
      'type': 'image',
      'path': 'assets/apk/coffee_dashboard.jpg',
      'description': 'Coffee Core dashboard overview.',
    },
  ];

  Future<void> _openPlayStore(BuildContext context) async {
    try {
      debugPrint('CoffeeCorePage: Opening Google Play Store');
      
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text('Redirecting to Play Store...'),
              ],
            ),
          );
        },
      );

      const String playStoreUrl = 'https://play.google.com/store/apps/details?id=com.jvalmacis.coffeecore';
      
      if (await canLaunchUrl(Uri.parse(playStoreUrl))) {
        await launchUrl(
          Uri.parse(playStoreUrl),
          mode: LaunchMode.externalApplication,
        );
        
        if (context.mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Opening Google Play Store...'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.brown,
            ),
          );
        }
      } else {
        if (context.mounted) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not open Play Store. Please try again.'),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('CoffeeCorePage: Play Store redirect error: $e');
      
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error redirecting to Play Store. Please visit the Play Store manually.'),
            duration: Duration(seconds: 3),
            backgroundColor: Colors.orange,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;
    debugPrint('CoffeeCorePage: Building with screenWidth=$screenWidth');

    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                        debugPrint('CoffeeCorePage: Navigating back');
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
                              'Coffee Core',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    fontSize: isMobile ? 24 : 32,
                                    color: Colors.white,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Sow, Safeguard, Soar',
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 16 : 24,
                horizontal: isMobile ? 12 : 16,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: _buildContent(context, screenWidth, isMobile),
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

  Widget _buildContent(BuildContext context, double screenWidth, bool isMobile) {
    final isTablet = screenWidth >= ResponsiveUtils.mobileBreakpoint &&
        screenWidth <= ResponsiveUtils.tabletBreakpoint;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Coffee Core',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 20 : 24,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Coffee Core, developed by JV ALMA C.I.S, empowers coffee farmers with specialized tools for cultivation, market access, and farm management through a cooperative-based system.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 12 : 14,
                color: const Color(0xFF4B5563),
              ),
        ),
        const SizedBox(height: 24),
        
        // Admin Roles Section
        Text(
          'Administrative System',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 16 : 18,
                color: const Color(0xFF1F2937),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          'Coffee Core features a comprehensive role-based management system to ensure efficient operations:',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: isMobile ? 12 : 14,
                color: const Color(0xFF4B5563),
              ),
        ),
        const SizedBox(height: 16),
        ..._adminRoles.map((role) => _buildAdminRoleCard(
          context,
          role: role['role'] as String,
          icon: role['icon'] as IconData,
          color: role['color'] as Color,
          responsibilities: role['responsibilities'] as List<String>,
          isMobile: isMobile,
          isTablet: isTablet,
        )),
        const SizedBox(height: 24),

        // Farmer Benefits Section
        Text(
          'Benefits for Farmers',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 16 : 18,
                color: const Color(0xFF1F2937),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: isMobile ? 8 : 12,
          runSpacing: 12,
          children: _farmerBenefits.map((benefit) {
            return SizedBox(
              width: isMobile ? screenWidth * 0.9 : screenWidth * (isTablet ? 0.45 : 0.4),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green[200]!),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          LucideIcons.checkCircle,
                          size: 20,
                          color: Colors.green[700],
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            benefit['title']!,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: isMobile ? 12 : 14,
                                  color: Colors.green[900],
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      benefit['description']!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 11 : 13,
                            color: Colors.green[800],
                            height: 1.4,
                          ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 24),

        // Key Features Section
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
        const SizedBox(height: 24),

        // How It Works Section
        _buildHowItWorksSection(context, isMobile, isTablet),
        const SizedBox(height: 24),

        // Media Section
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
                        child: SizedBox(
                          height: isMobile ? 200 : 300,
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
        const SizedBox(height: 16),

        // Download Section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.brown[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.brown[200]!),
          ),
          child: Column(
            children: [
              Icon(
                LucideIcons.coffee,
                size: 48,
                color: Colors.brown[700],
              ),
              const SizedBox(height: 12),
              Text(
                'Get Coffee Core',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: isMobile ? 16 : 18,
                      color: Colors.brown[800],
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Download Coffee Core from Google Play Store and revolutionize your coffee farming experience!',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: isMobile ? 12 : 14,
                      color: Colors.brown[700],
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => _openPlayStore(context),
                  icon: const Icon(LucideIcons.download, size: 20),
                  label: Text(
                    'Get from Play Store',
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[600],
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: isMobile ? 12 : 16,
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
        ),
      ],
    );
  }

  Widget _buildAdminRoleCard(
    BuildContext context, {
    required String role,
    required IconData icon,
    required Color color,
    required List<String> responsibilities,
    required bool isMobile,
    required bool isTablet,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: isMobile ? 20 : 24),
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
          ...responsibilities.map((responsibility) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      LucideIcons.checkCircle2,
                      size: 16,
                      color: color,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        responsibility,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: isMobile ? 11 : 13,
                              color: const Color(0xFF4B5563),
                              height: 1.4,
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

  Widget _buildHowItWorksSection(BuildContext context, bool isMobile, bool isTablet) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.info, color: Colors.blue[700], size: isMobile ? 20 : 24),
              const SizedBox(width: 8),
              Text(
                'How It Works',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildHowItWorksStep(
            context,
            step: '1',
            title: 'Cooperative Registration',
            description: 'JV Admin approves Cooperative Admins who register their cooperative names on the platform.',
            isMobile: isMobile,
          ),
          _buildHowItWorksStep(
            context,
            step: '2',
            title: 'Farmer Onboarding',
            description: 'Farmers register and select their cooperative from the list, ensuring they receive tailored information.',
            isMobile: isMobile,
          ),
          _buildHowItWorksStep(
            context,
            step: '3',
            title: 'Role Assignment',
            description: 'Cooperative Admin assigns Market Manager (for prices) and Loan Manager (for credit facilities).',
            isMobile: isMobile,
          ),
          _buildHowItWorksStep(
            context,
            step: '4',
            title: 'Filtered Information',
            description: 'Farmers only see market prices and loan options from their cooperative, eliminating confusion.',
            isMobile: isMobile,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorksStep(
    BuildContext context, {
    required String step,
    required String title,
    required String description,
    required bool isMobile,
    bool isLast = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: isMobile ? 28 : 32,
            height: isMobile ? 28 : 32,
            decoration: BoxDecoration(
              color: Colors.blue[700],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                step,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 11 : 13,
                        color: Colors.blue[800],
                        height: 1.4,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}