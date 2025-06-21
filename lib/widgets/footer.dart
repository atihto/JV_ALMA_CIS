import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final Map<String, bool> _isClicked = {};
  final Map<String, bool> _isHovered = {};

  void _toggleClick(String buttonKey) {
    setState(() {
      _isClicked.updateAll((key, value) => false);
      _isClicked[buttonKey] = true;
    });
  }

  void _handleNavigation(BuildContext context, String route, {String? url}) async {
    _toggleClick(route); // Use route as buttonKey for consistency
    if (url != null) {
      try {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch $url')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } else {
      Navigator.pushNamed(context, route).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigation error: $e')),
        );
        return null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width.clamp(300.0, double.infinity);
    final isLargeScreen = screenWidth >= 768;
    final isMobile = screenWidth < 600;

    return Material(
      color: const Color(0xFF111827),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 24 : 16,
          horizontal: isMobile ? 8 : 16,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              Wrap(
                spacing: isMobile ? 16 : 32,
                runSpacing: 24,
                alignment: WrapAlignment.start,
                children: [
                  SizedBox(
                    width: isLargeScreen ? 300 : screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(context, '/').catchError((e) {
                                debugPrint('Footer: Navigation error to /: $e');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Navigation error: $e')),
                                );
                                return null;
                              }),
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/clients/jv.jpg',
                                    fit: BoxFit.contain,
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(LucideIcons.mapPin, size: 16, color: Color(0xFF3B82F6)),
                                const SizedBox(width: 8),
                                Text(
                                  'Nairobi, Kenya',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: isMobile ? 12 : 14,
                                  ),
                                ),
                              ],
                            ),
                            _buildContactLink(
                              context,
                              icon: LucideIcons.phone,
                              text: '+254 123 456 789',
                              uri: 'tel:+254123456789',
                              isMobile: isMobile,
                              buttonKey: 'phone',
                            ),
                            _buildContactLink(
                              context,
                              icon: LucideIcons.mail,
                              text: 'info@jvalmacis.co.ke',
                              uri: 'mailto:info@jvalmacis.co.ke',
                              isMobile: isMobile,
                              buttonKey: 'email',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: isLargeScreen ? 200 : screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Our Business Units',
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildFooterLink(
                          context,
                          text: 'Construction',
                          route: '/construction-detail',
                          url: null,
                          isMobile: isMobile,
                          buttonKey: 'constructionDetail',
                        ),
                        const SizedBox(height: 8),
                        _buildFooterLink(
                          context,
                          text: 'Agribusiness',
                          route: '/agribusiness',
                          url: null,
                          isMobile: isMobile,
                          buttonKey: 'agribusiness',
                        ),
                        const SizedBox(height: 8),
                        _buildFooterLink(
                          context,
                          text: 'Oil & Gas Services',
                          route: '/oil-gas',
                          url: null,
                          isMobile: isMobile,
                          buttonKey: 'oilGasServices',
                        ),
                        const SizedBox(height: 8),
                        _buildFooterLink(
                          context,
                          text: 'IT Division',
                          route: '/it-division',
                          url: null,
                          isMobile: isMobile,
                          buttonKey: 'itDivision',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: isLargeScreen ? 200 : screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quick Links',
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        _buildFooterLink(
                          context,
                          text: 'About Us',
                          route: '/about',
                          url: null,
                          isMobile: isMobile,
                          buttonKey: 'aboutUs',
                        ),
                        const SizedBox(width: 8),
                        _buildFooterLink(
                          context,
                          text: 'Certificates',
                          route: '/certificates',
                          url: null,
                          isMobile: isMobile,
                          buttonKey: 'certificates',
                        ),
                        const SizedBox(height: 8),
                        _buildFooterLink(
                          context,
                          text: 'Partners',
                          route: '/references',
                          url: null,
                          isMobile: isMobile,
                          buttonKey: 'partnersQuickLink',
                        ),
                        
                      ],
                    ),
                  ),
                  /* SizedBox(
                    width: isLargeScreen ? 200 : screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Our Partners',
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 18,
                            fontWeight: Weight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildFooterLink(
                          context,
                          text: 'KALRO',
                          route: null,
                          url: 'https://kalro.org',
                          isMobile: isMobile,
                          buttonKey: 'kalro',
                        ),
                        const SizedBox(height: 8),
                        _buildFooterLink(
                          context,
                          text: 'TIC',
                          route: null,
                          url: 'https://tic-inspectiongroup.com/en/',
                          isMobile: isMobile,
                          buttonKey: 'tic',
                        ),
                        const SizedBox(height: 8),
                        _buildFooterLink(
                          context,
                          text: 'Brisma Africa',
                          route: null,
                          url: 'https://brisma-africa.com',
                          isMobile: isMobile,
                          buttonKey: 'brismaAfrica',
                        ),
                        const SizedBox(height: 8),
                        _buildFooterLink(
                          context,
                          text: 'Alma CIS',
                          route: null,
                          url: 'https://almacis.it/',
                          isMobile: isMobile,
                          buttonKey: 'almaCIS',
                        ),
                        const SizedBox(height: 8),
                        _buildFooterLink(
                          context,
                          text: 'KENAFF',
                          route: null,
                          url: 'https://www.kenaff.org',
                          isMobile: isMobile,
                          buttonKey: 'kenaff',
                        ),
                        const SizedBox(height: 8),
                        _buildFooterLink(
                          context,
                          text: 'Moi University',
                          route: null,
                          url: 'https://mu.ac.ke',
                          isMobile: isMobile,
                          buttonKey: 'moiUniversity',
                        ),
                      ],
                    ),
                  */ // Moved closing comment here
                  SizedBox(
                    width: isLargeScreen ? 200 : screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Follow Us',
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            /* _buildFooterLink(
                              context,
                              text: '',
                              route: null,
                              url: 'https://facebook.com/jvalmacis',
                              isMobile: isMobile,
                              buttonKey: 'facebook',
                              icon: LucideIcons.facebook,
                            ),*/
                            const SizedBox(width: 12),
                            _buildFooterLink(
                              context,
                              text: '',
                              route: null,
                              url: 'https://twitter.com/jvalmacis',
                              isMobile: isMobile,
                              buttonKey: 'twitter',
                              icon: LucideIcons.twitter,
                            ),
                            const SizedBox(width: 12),
                            _buildFooterLink(
                              context,
                              text: '',
                              route: null,
                              url: 'https://linkedin.com/company/jvalmacis',
                              isMobile: isMobile,
                              buttonKey: 'linkedin',
                              icon: LucideIcons.linkedin,
                            ),
                            const SizedBox(width: 12),
                            _buildFooterLink(
                              context,
                              text: '',
                              route: null,
                              url: 'https://instagram.com/jvalmacis/jval',
                              isMobile: isMobile,
                              buttonKey: 'instagram',
                              icon: LucideIcons.instagram,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xFF374151)),
                  ),
                ),
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '© 2025 Copyright JV Alma CIS Kenya.',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: isMobile ? 12 : 14,
                      ),
                    ),
                    const SizedBox(width: 32), // Increased from 16 to 32
                    Row(
                      children: [
                        _buildFooterLink(
                          context,
                          text: 'Privacy Policy',
                          route: '/privacy-policy',
                          url: null,
                          isMobile: isMobile,
                          buttonKey: 'privacyPolicy',
                        ),
                        const SizedBox(width: 16),
                        _buildFooterLink(
                          context,
                          text: 'Cookies Policy',
                          route: '/cookies',
                          url: null,
                          isMobile: isMobile,
                          buttonKey: 'cookiesPolicy',
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(LucideIcons.arrowUp, color: Colors.white, size: 20),
                          onPressed: () {
                            Scrollable.of(context).position.animateTo(
                              0.0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          tooltip: 'Back to Top',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactLink(
    BuildContext context, {
    required IconData icon,
    required String text,
    required String uri,
    required bool isMobile,
    required String buttonKey,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: Matrix4.translationValues(0, _isHovered[buttonKey] ?? false ? -2.0 : 0, 0),
      transformAlignment: Alignment.center,
      child: SizedBox(
        height: 24,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => _handleNavigation(context, buttonKey, url: uri),
          onHover: (isHovering) {
            setState(() {
              _isHovered[buttonKey] = isHovering;
            });
          },
          child: Row(
            children: [
              Icon(icon, size: 16, color: _isClicked[buttonKey] ?? false ? Colors.white : const Color(0xFF3B82F6)),
              const SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(
                  color: _isClicked[buttonKey] ?? false ? Colors.white : Colors.white,
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooterLink(
    BuildContext context, {
    required String text,
    required String? route,
    required String? url,
    IconData? icon,
    required bool isMobile,
    required String buttonKey,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: Matrix4.translationValues(0, _isHovered[buttonKey] ?? false ? -2.0 : 0, 0),
      transformAlignment: Alignment.center,
      child: SizedBox(
        height: 24,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => _handleNavigation(context, route ?? buttonKey, url: url),
          onHover: (isHovering) {
            setState(() {
              _isHovered[buttonKey] = isHovering;
            });
          },
          child: Row(
            children: [
              if (icon != null) ...[
                Icon(icon, size: 16, color: _isClicked[buttonKey] ?? false ? Colors.white : Colors.grey[400]),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: TextStyle(
                  color: _isClicked[buttonKey] ?? false ? Colors.white : Colors.grey[400],
                  fontSize: isMobile ? 12 : 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}