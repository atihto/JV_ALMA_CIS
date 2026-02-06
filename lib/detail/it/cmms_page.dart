import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/responsive_utils.dart';

class CmmsPage extends StatelessWidget {
  const CmmsPage({super.key});

  static const List<Map<String, dynamic>> _userRoles = [
    {
      'role': 'JV Admin',
      'icon': LucideIcons.shieldCheck,
      'color': Color(0xFF7C3AED),
      'responsibilities': [
        'Approves client and JV employee registrations',
        'Grants or denies access based on employee functions',
        'Controls document access permissions',
        'Tracks who viewed what and when for accountability',
      ],
    },
    {
      'role': 'JV Employees',
      'icon': LucideIcons.users,
      'color': Color(0xFF2563EB),
      'responsibilities': [
        'Create work orders from client requests',
        'Upload, view, edit, or download documentation',
        'Manage preventive maintenance schedules',
        'Access varies based on assigned function',
      ],
    },
    {
      'role': 'Clients',
      'icon': LucideIcons.building2,
      'color': Color(0xFF059669),
      'responsibilities': [
        'Submit work requests for facility maintenance',
        'View approved documentation and drawings',
        'Track work order progress',
        'Access limited to authorized facilities only',
      ],
    },
    {
      'role': 'Contractors',
      'icon': LucideIcons.hardHat,
      'color': Color(0xFFEA580C),
      'responsibilities': [
        'Access assigned work orders',
        'Update work progress and completion status',
        'View relevant facility documentation',
        'Limited access based on project scope',
      ],
    },
  ];

  static const List<Map<String, dynamic>> _features = [
    {'icon': LucideIcons.building, 'title': 'Facility Management', 'description': 'Manage multiple facilities with facility selection on login.'},
    {'icon': LucideIcons.fileText, 'title': 'Building Information', 'description': 'Access surveys, documentation, and drawings.'},
    {'icon': LucideIcons.clipboardList, 'title': 'Scope of Work', 'description': 'Upload documents or schedule activities.'},
    {'icon': LucideIcons.calendar, 'title': 'Preventive Maintenance', 'description': 'Schedule and automate routine maintenance.'},
    {'icon': LucideIcons.fileBarChart, 'title': 'Reports & Analytics', 'description': 'Generate detailed performance reports.'},
    {'icon': LucideIcons.messageSquare, 'title': 'Work Requests', 'description': 'Client submission and tracking system.'},
    {'icon': LucideIcons.wrench, 'title': 'Work Orders', 'description': 'Full lifecycle management and tracking.'},
    {'icon': LucideIcons.receipt, 'title': 'Billing Management', 'description': 'Track costs and generate invoices.'},
  ];

  static const List<Map<String, String>> _securityFeatures = [
    {
      'title': 'Approval-Based Access',
      'description': 'JV Admin approval required after login, even for Play Store downloads.',
    },
    {
      'title': 'Role-Based Permissions',
      'description': 'Strict access control based on user roles and functions.',
    },
    {
      'title': 'Document Tracking',
      'description': 'Complete audit trail with timestamps for accountability.',
    },
    {
      'title': 'Facility-Based Access',
      'description': 'Users only see authorized facility data ensuring privacy.',
    },
  ];

  static const List<Map<String, String>> _media = [
    {'type': 'image', 'path': 'assets/apk/cmms_overview.jpg', 'description': 'CMMS Overview.'},
    {'type': 'image', 'path': 'assets/apk/nyumba_dashboard.jpg', 'description': 'CMMS mobile app view.'},
    {'type': 'image', 'path': 'assets/apk/nyumba_mobile_section.jpg', 'description': 'CMMS mobile section view.'},
    {'type': 'image', 'path': 'assets/apk/cmms_desktop_view.jpg', 'description': 'CMMS dashboard interface.'},
    {'type': 'image', 'path': 'assets/apk/cmms_desktop_view1.jpg', 'description': 'CMMS dashboard section.'},
  ];

  Future<void> _openPlayStore(BuildContext context) async {
    try {
      debugPrint('CmmsPage: Opening Google Play Store');
      
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

      const String playStoreUrl = 'https://play.google.com/store/apps/details?id=com.jvalmacis.cmms';
      
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
              backgroundColor: Colors.purple,
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
      debugPrint('CmmsPage: Play Store redirect error: $e');
      
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
    debugPrint('CmmsPage: Building with screenWidth=$screenWidth');

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
                        debugPrint('CmmsPage: Navigating back');
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
                              'NyumbaSmart - CMMS',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    fontSize: isMobile ? 24 : 32,
                                    color: Colors.white,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Facility Management Platform',
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
          'NyumbaSmart - CMMS',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isMobile ? 20 : 24,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Comprehensive facility management platform with secure, role-based access to manage multiple facilities efficiently.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 12 : 14,
                color: const Color(0xFF4B5563),
              ),
        ),
        const SizedBox(height: 24),

        // User Roles Section
        Text(
          'User Roles & Permissions',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 16 : 18,
                color: const Color(0xFF1F2937),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        
        // User Role Cards - True side-by-side layout
        if (isMobile)
          // Mobile: Stack vertically
          Column(
            children: _userRoles.map((role) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildRoleCard(context, role, isMobile, isTablet),
            )).toList(),
          )
        else
          // Desktop/Tablet: True side-by-side (2 rows of 2 cards each)
          Column(
            children: [
              // Row 1: JV Admin + JV Employees
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildRoleCard(context, _userRoles[0], isMobile, isTablet)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildRoleCard(context, _userRoles[1], isMobile, isTablet)),
                ],
              ),
              const SizedBox(height: 12),
              // Row 2: Clients + Contractors
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildRoleCard(context, _userRoles[2], isMobile, isTablet)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildRoleCard(context, _userRoles[3], isMobile, isTablet)),
                ],
              ),
            ],
          ),
        const SizedBox(height: 24),

        // Facility Selection Section - Compact
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(LucideIcons.building2, color: Colors.blue[700], size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Facility Selection on Login',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: isMobile ? 13 : 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Users select their facility (Houses, Garages, Storerooms, Office Buildings, etc.) and only access authorized data, ensuring complete security.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: isMobile ? 11 : 12,
                      color: Colors.blue[800],
                      height: 1.3,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Security Features - True side-by-side
        Text(
          'Security & Access Control',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 16 : 18,
                color: const Color(0xFF1F2937),
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        
        if (isMobile)
          Column(
            children: _securityFeatures.map((feature) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildSecurityCard(context, feature, isMobile),
            )).toList(),
          )
        else
          Column(
            children: [
              // Row 1
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildSecurityCard(context, _securityFeatures[0], isMobile)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildSecurityCard(context, _securityFeatures[1], isMobile)),
                ],
              ),
              const SizedBox(height: 12),
              // Row 2
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildSecurityCard(context, _securityFeatures[2], isMobile)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildSecurityCard(context, _securityFeatures[3], isMobile)),
                ],
              ),
            ],
          ),
        const SizedBox(height: 24),

        // Core Features - Compact grid
        Text(
          'Core Features',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: isMobile ? 14 : 16,
                color: const Color(0xFF1F2937),
              ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: isMobile ? 8 : 12,
          runSpacing: 8,
          children: _features.map((feature) {
            return Container(
              width: isMobile ? screenWidth * 0.9 : (screenWidth / (isTablet ? 2 : 4)) - 16,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple[200]!),
                boxShadow: const [
                  BoxShadow(
                    color:  Color(0x1A9E9E9E),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(feature['icon'] as IconData, size: 20, color: Colors.purple[600]),
                  const SizedBox(height: 6),
                  Text(
                    feature['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 11 : 12,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    feature['description']!,
                    style: TextStyle(
                      fontSize: isMobile ? 10 : 11,
                      color: const Color(0xFF4B5563),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),

        // Media Section
        Text(
          'Platform Views',
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
        const SizedBox(height: 20),

        // Download Section - Prominent
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple[600]!,
                Colors.purple[800]!,
              ],
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              const Icon(LucideIcons.database, size: 48, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                'Get NyumbaSmart - CMMS',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: isMobile ? 18 : 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Download from Google Play Store. JV Admin approval required after login.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: isMobile ? 13 : 15,
                      color: const Color(0xE6FFFFFF),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: isMobile ? double.infinity : 300,
                child: ElevatedButton.icon(
                  onPressed: () => _openPlayStore(context),
                  icon: const Icon(LucideIcons.download, size: 20),
                  label: Text(
                    'Get from Play Store',
                    style: TextStyle(
                      fontSize: isMobile ? 15 : 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.purple[800],
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
        ),
      ],
    );
  }

  Widget _buildRoleCard(BuildContext context, Map<String, dynamic> role, bool isMobile, bool isTablet) {
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
}