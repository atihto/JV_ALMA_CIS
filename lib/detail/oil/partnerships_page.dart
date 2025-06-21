import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/header.dart';
import '../../widgets/footer.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/responsive_utils.dart';

class PartnershipsPage extends StatelessWidget {
  const PartnershipsPage({super.key});

  static const List<Map<String, dynamic>> _partnerships = [
    {
      'name': 'JV ALMA C.I.S. Leadership',
      'details': 'A joint venture led by diverse directors from Italy, Kenya, and Mauritius, driving strategic growth in oil and gas services.',
      'url': '',
      'icon': LucideIcons.users,
      'imagePath': 'assets/images/tic/jv_logo.jpg',
    },
    {
      'name': 'TIC Group Partnership',
      'details': 'Since 1993, TIC Group provides technical inspection and testing services for oil, gas, and energy industries with over 400 qualified employees globally. Certified with API 510, AWS-CWI, and more.',
      'url': 'https://tic-inspectiongroup.com',
      'icon': LucideIcons.wrench,
      'imagePath': 'assets/images/tic/tic_logo.jpg',
    },
    {
      'name': 'Brisma Africa Collaboration',
      'details': 'Partnering with Brisma Africa to deliver comprehensive oil and gas solutions across East Africa, leveraging regional expertise.',
      'url': 'https://brisma-africa.com',
      'icon': LucideIcons.globe,
      'imagePath': 'assets/images/tic/brisma_logo.jpg',
    },
    {
      'name': 'Global Reach',
      'details': 'With a global network and partnerships with industry leaders like Shell and TotalEnergies, the alliance reaches across continents.',
      'url': '',
      'icon': LucideIcons.map,
      'imagePath': 'assets/images/tic/tic_5.jpg',
    },
    {
      'name': 'Operational Success',
      'details': 'The partnership excels in fieldwork, from pipeline installations to rigorous inspections, ensuring quality across projects.',
      'url': '',
      'icon': LucideIcons.hammer,
      'imagePath': 'assets/images/tic/tic_3.jpg',
    },
    {
      'name': 'Quality Assurance',
      'details': 'Certifications like COFREND NDT and NACE Corrosion ensure the highest standards in every operation.',
      'url': '',
      'icon': LucideIcons.shieldCheck,
      'imagePath': 'assets/images/tic/tic_4.jpg',
    },
    {
      'name': 'Directors & Shareholders',
      'details': 'Names of the directors and shareholders of the 3 companies involved in the partnership: JV ALMA C.I.S., TIC Group, and Brisma Africa.',
      'url': '',
      'icon': LucideIcons.shieldCheck,
      'imagePath': 'assets/images/tic/tic_1.jpg',
      'imagePath2': 'assets/images/tic/partners_logo.jpg',
    },
  ];

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    debugPrint('PartnershipsPage: Launching URL $url');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('PartnershipsPage: Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('PartnershipsPage: Building widget tree');
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;
    final isTablet = screenWidth >= ResponsiveUtils.mobileBreakpoint && screenWidth <= ResponsiveUtils.tabletBreakpoint;
    debugPrint('PartnershipsPage: Screen width=$screenWidth, isMobile=$isMobile, isTablet=$isTablet');

    return Builder(
      builder: (context) {
        debugPrint('PartnershipsPage: Inside Builder');
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(color: Color(0xFF1E40AF)),
                  child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
                ),
                ListTile(
                  leading: const Icon(LucideIcons.home),
                  title: const Text('Home'),
                  onTap: () {
                    debugPrint('PartnershipsPage: Navigating to / from Drawer');
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/');
                  },
                ),
                ListTile(
                  leading: const Icon(LucideIcons.users),
                  title: const Text('Partnerships'),
                  onTap: () {
                    debugPrint('PartnershipsPage: Navigating to /oil-partners from Drawer');
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/oil-partners');
                  },
                ),
                ListTile(
                  leading: const Icon(LucideIcons.mail),
                  title: const Text('Contact'),
                  onTap: () {
                    debugPrint('PartnershipsPage: Navigating to /contact from Drawer');
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/contact');
                  },
                ),
              ],
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              debugPrint('PartnershipsPage: LayoutBuilder constraints=$constraints');
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Header(
                      onMenuPressed: () {
                        debugPrint('PartnershipsPage: Opening Drawer');
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1E3A8A), Color(0xFF1E40AF), Color(0xFF065F46)],
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 24 : 48,
                        horizontal: isMobile ? 8 : 16,
                      ),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 896),
                          child: Column(
                            children: [
                              Text(
                                'Strategic Partnerships',
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                      fontSize: isMobile ? 24 : 32,
                                      color: Colors.white,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'The Journey of JV ALMA C.I.S., TIC Group, and Brisma Africa',
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
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 16 : 24,
                        horizontal: isMobile ? 12 : 16,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1280),
                        child: isMobile
                            ? _buildMobileLayout(context)
                            : _buildDesktopTabletLayout(context, isTablet),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1E40AF), Color(0xFF065F46)],
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: isMobile ? 16 : 24,
                        horizontal: 16,
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 896),
                        child: Column(
                          children: [
                            Text(
                              'Ready to Collaborate?',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontSize: isMobile ? 20 : 24,
                                    color: Colors.white,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Contact us to explore partnership opportunities in the oil and gas sector.',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: isMobile ? 12 : 14,
                                    color: Colors.white,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            CustomButton(
                              text: 'Contact Us',
                              onPressed: () {
                                debugPrint('PartnershipsPage: Navigating to /contact from Contact Us button');
                                Navigator.pushNamed(context, '/contact');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Footer(),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    debugPrint('PartnershipsPage: Building mobile layout');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _partnerships.length,
          itemBuilder: (context, index) {
            debugPrint('PartnershipsPage: Building mobile item $index');
            final partnership = _partnerships[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: _buildPartnershipItem(context, partnership, isMobile: true),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDesktopTabletLayout(BuildContext context, bool isTablet) {
    debugPrint('PartnershipsPage: Building desktop/tablet layout');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            width: isTablet ? MediaQuery.of(context).size.width * 0.3 : MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _partnerships.length,
              itemBuilder: (context, index) {
                debugPrint('PartnershipsPage: Building sidebar item $index');
                final partnership = _partnerships[index];
                return ListTile(
                  leading: Icon(partnership['icon'], size: isTablet ? 20 : 24, color: Colors.grey[600]),
                  title: Text(
                    partnership['name']!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: isTablet ? 12 : 14,
                          color: const Color(0xFF1F2937),
                        ),
                  ),
                  onTap: () {
                    debugPrint('PartnershipsPage: Sidebar item $index tapped');
                    Scrollable.ensureVisible(
                      context,
                      alignment: 0.1,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(isTablet ? 8 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _partnerships.asMap().entries.map((entry) {
                  final index = entry.key;
                  final partnership = entry.value;
                  debugPrint('PartnershipsPage: Building content item $index');
                  return Padding(
                    key: GlobalObjectKey(partnership['name']),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: _buildPartnershipItem(context, partnership, isMobile: false),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPartnershipItem(BuildContext context, Map<String, dynamic> partnership, {required bool isMobile}) {
    debugPrint('PartnershipsPage: Building partnership item ${partnership['name']}');
    // Determine if the item is a logo or a full image that needs scrolling
    final isLogo = ['jv_logo.jpg', 'tic_logo.jpg', 'brisma_logo.jpg'].contains(partnership['imagePath'].split('/').last);
    final needsScrolling = ['Global Reach', 'Operational Success', 'Quality Assurance', 'Directors & Shareholders'].contains(partnership['name']);
    final imageHeight = isMobile ? 200.0 : 300.0; // Fixed height for scrollable area
    final logoHeight = isMobile ? 60.0 : 80.0; // Reduced height for logos

    // Handle multiple images for Directors & Shareholders
    final hasSecondImage = partnership['imagePath2'] != null;

    Widget buildImage(String imagePath, double height) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          width: double.infinity,
          fit: isLogo ? BoxFit.contain : BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            debugPrint('PartnershipsPage: Image load error for $imagePath: $error');
            return Container(
              height: height,
              color: Colors.grey[200],
              child: const Center(child: Icon(LucideIcons.imageOff, color: Colors.grey)),
            );
          },
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isLogo) ...[
                // Logos don't need scrolling
                buildImage(partnership['imagePath']!, logoHeight),
              ] else if (needsScrolling) ...[
                // Images that need scrolling
                Container(
                  height: imageHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!, width: 1),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildImage(partnership['imagePath']!, imageHeight),
                        if (hasSecondImage) ...[
                          const SizedBox(height: 8),
                          buildImage(partnership['imagePath2']!, imageHeight),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 8),
              Text(
                partnership['details']!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: isMobile ? 12 : 14,
                      color: const Color(0xFF4B5563),
                    ),
              ),
              if (partnership['url']!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: _HoverableLink(
                    text: 'Visit Website',
                    url: partnership['url']!,
                    onLaunch: _launchUrl,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HoverableLink extends StatefulWidget {
  final String text;
  final String url;
  final Future<void> Function(String) onLaunch;

  const _HoverableLink({
    required this.text,
    required this.url,
    required this.onLaunch,
  });

  @override
  State<_HoverableLink> createState() => _HoverableLinkState();
}

class _HoverableLinkState extends State<_HoverableLink> {
  bool _hovered = false;
  bool _isMounted = false;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_isMounted) {
        debugPrint('PartnershipsPage: _HoverableLink for ${widget.url} mounted and laid out');
      }
    });
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('PartnershipsPage: Building _HoverableLink for ${widget.url}');
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < ResponsiveUtils.mobileBreakpoint;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        if (_isMounted) {
          debugPrint('PartnershipsPage: Mouse entered for ${widget.url}');
          setState(() => _hovered = true);
        }
      },
      onExit: (_) {
        if (_isMounted) {
          debugPrint('PartnershipsPage: Mouse exited for ${widget.url}');
          setState(() => _hovered = false);
        }
      },
      child: GestureDetector(
        onTap: () {
          debugPrint('PartnershipsPage: Tapped link for ${widget.url}');
          widget.onLaunch(widget.url);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening ${widget.url}')),
          );
        },
        child: Text(
          widget.text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _hovered ? Colors.blue[700] : Colors.blue[900],
                fontSize: isMobile ? 12 : 14,
                decoration: _hovered ? TextDecoration.underline : null,
              ),
        ),
      ),
    );
  }
}