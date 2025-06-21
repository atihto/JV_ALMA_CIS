import 'package:flutter/material.dart';
import 'package:jv_alma_cis/config.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';
//import '../config.dart';
import 'dart:developer' as developer;

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
    _toggleClick(route);
    if (url != null) {
      try {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
          developer.log('Footer: Launched URL: $url', name: 'Footer');
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not launch $url')),
            );
          }
        }
      } catch (e) {
        developer.log('Footer: URL launch error: $e', name: 'Footer');
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      }
    } else {
      if (context.mounted) {
        Navigator.pushNamed(context, route).catchError((e) {
          developer.log('Footer: Navigation error to $route: $e', name: 'Footer');
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navigation error: $e')),
            );
          }
          return null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width.clamp(300.0, double.infinity);
    final isLargeScreen = screenWidth >= 768;
    final isMobile = screenWidth < 600;

    return Material(
      color: const Color(0xFF0F172A),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 32 : 48,
          horizontal: isMobile ? 16 : 24,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                Wrap(
                  spacing: isMobile ? 24 : 48,
                  runSpacing: 32,
                  alignment: WrapAlignment.start,
                  children: [
                    // Company Info
                    SizedBox(
                      width: isLargeScreen ? 300 : screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (context.mounted) {
                                Navigator.pushNamed(context, '/').catchError((e) {
                                  developer.log('Footer: Navigation error to /: $e', name: 'Footer');
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Navigation error: $e')),
                                    );
                                  }
                                  return null;
                                });
                              }
                            },
                            child: Container(
                              width: 150,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                'assets/images/clients/jv.jpg',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1E293B),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'JV ALMA CIS',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Leading provider of construction, agribusiness, oil & gas, and IT solutions across East Africa.',
                            style: TextStyle(
                              color: const Color(0xFF94A3B8),
                              fontSize: isMobile ? 14 : 16,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildContactInfo(
                                icon: LucideIcons.mapPin,
                                text: Config.companyAddress,
                                isMobile: isMobile,
                              ),
                              const SizedBox(height: 8),
                              _buildContactLink(
                                context,
                                icon: LucideIcons.phone,
                                text: Config.companyPhone,
                                uri: 'tel:${Config.companyPhone.replaceAll(' ', '')}',
                                isMobile: isMobile,
                                buttonKey: 'phone',
                              ),
                              const SizedBox(height: 8),
                              _buildContactLink(
                                context,
                                icon: LucideIcons.mail,
                                text: Config.companyEmail,
                                uri: 'mailto:${Config.companyEmail}',
                                isMobile: isMobile,
                                buttonKey: 'email',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    // Business Units
                    SizedBox(
                      width: isLargeScreen ? 200 : screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Business Units',
                            style: TextStyle(
                              fontSize: isMobile ? 18 : 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildFooterLink(
                            context,
                            text: 'Construction',
                            route: '/construction-detail',
                            isMobile: isMobile,
                            buttonKey: 'constructionDetail',
                          ),
                          const SizedBox(height: 12),
                          _buildFooterLink(
                            context,
                            text: 'Agribusiness',
                            route: '/agribusiness',
                            isMobile: isMobile,
                            buttonKey: 'agribusiness',
                          ),
                          const SizedBox(height: 12),
                          _buildFooterLink(
                            context,
                            text: 'Oil & Gas Services',
                            route: '/oil-gas',
                            isMobile: isMobile,
                            buttonKey: 'oilGasServices',
                          ),
                          const SizedBox(height: 12),
                          _buildFooterLink(
                            context,
                            text: 'IT Division',
                            route: '/it-division',
                            isMobile: isMobile,
                            buttonKey: 'itDivision',
                          ),
                        ],
                      ),
                    ),
                    
                    // Quick Links
                    SizedBox(
                      width: isLargeScreen ? 200 : screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quick Links',
                            style: TextStyle(
                              fontSize: isMobile ? 18 : 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildFooterLink(
                            context,
                            text: 'About Us',
                            route: '/about',
                            isMobile: isMobile,
                            buttonKey: 'aboutUs',
                          ),
                          const SizedBox(height: 12),
                          _buildFooterLink(
                            context,
                            text: 'Projects',
                            route: '/projects',
                            isMobile: isMobile,
                            buttonKey: 'projects',
                          ),
                          const SizedBox(height: 12),
                          _buildFooterLink(
                            context,
                            text: 'Certificates',
                            route: '/certificates',
                            isMobile: isMobile,
                            buttonKey: 'certificates',
                          ),
                          const SizedBox(height: 12),
                          _buildFooterLink(
                            context,
                            text: 'Partners',
                            route: '/references',
                            isMobile: isMobile,
                            buttonKey: 'partnersQuickLink',
                          ),
                        ],
                      ),
                    ),
                    
                    // Social Media
                    SizedBox(
                      width: isLargeScreen ? 200 : screenWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Follow Us',
                            style: TextStyle(
                              fontSize: isMobile ? 18 : 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              _buildSocialLink(
                                context,
                                icon: LucideIcons.twitter,
                                url: Config.twitterUrl,
                                buttonKey: 'twitter',
                              ),
                              const SizedBox(width: 16),
                              _buildSocialLink(
                                context,
                                icon: LucideIcons.linkedin,
                                url: Config.linkedinUrl,
                                buttonKey: 'linkedin',
                              ),
                              const SizedBox(width: 16),
                              _buildSocialLink(
                                context,
                                icon: LucideIcons.instagram,
                                url: Config.instagramUrl,
                                buttonKey: 'instagram',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                // Bottom Section
                Container(
                  margin: const EdgeInsets.only(top: 32),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xFF334155)),
                    ),
                  ),
                  padding: const EdgeInsets.only(top: 24),
                  child: Column(
                    children: [
                      if (isMobile) ...[
                        Text(
                          '© 2025 Copyright JV Alma CIS Kenya.',
                          style: TextStyle(
                            color: const Color(0xFF94A3B8),
                            fontSize: isMobile ? 12 : 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 16,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            _buildFooterLink(
                              context,
                              text: 'Privacy Policy',
                              route: '/privacy-policy',
                              isMobile: isMobile,
                              buttonKey: 'privacyPolicy',
                            ),
                            _buildFooterLink(
                              context,
                              text: 'Cookies Policy',
                              route: '/cookies',
                              isMobile: isMobile,
                              buttonKey: 'cookiesPolicy',
                            ),
                          ],
                        ),
                      ] else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '© 2025 Copyright JV Alma CIS Kenya.',
                              style: TextStyle(
                                color: const Color(0xFF94A3B8),
                                fontSize: isMobile ? 12 : 14,
                              ),
                            ),
                            Row(
                              children: [
                                _buildFooterLink(
                                  context,
                                  text: 'Privacy Policy',
                                  route: '/privacy-policy',
                                  isMobile: isMobile,
                                  buttonKey: 'privacyPolicy',
                                ),
                                const SizedBox(width: 24),
                                _buildFooterLink(
                                  context,
                                  text: 'Cookies Policy',
                                  route: '/cookies',
                                  isMobile: isMobile,
                                  buttonKey: 'cookiesPolicy',
                                ),
                                const SizedBox(width: 24),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo({
    required IconData icon,
    required String text,
    required bool isMobile,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF64748B)),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: const Color(0xFF94A3B8),
            fontSize: isMobile ? 14 : 16,
          ),
        ),
      ],
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
      child: InkWell(
        onTap: () => _handleNavigation(context, buttonKey, url: uri),
        onHover: (isHovering) {
          setState(() {
            _isHovered[buttonKey] = isHovering;
          });
        },
        child: Row(
          children: [
            Icon(icon, size: 16, color: const Color(0xFF64748B)),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: _isHovered[buttonKey] ?? false ? Colors.white : const Color(0xFF94A3B8),
                fontSize: isMobile ? 14 : 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterLink(
    BuildContext context, {
    required String text,
    required String route,
    required bool isMobile,
    required String buttonKey,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: Matrix4.translationValues(0, _isHovered[buttonKey] ?? false ? -2.0 : 0, 0),
      child: InkWell(
        onTap: () => _handleNavigation(context, route),
        onHover: (isHovering) {
          setState(() {
            _isHovered[buttonKey] = isHovering;
          });
        },
        child: Text(
          text,
          style: TextStyle(
            color: _isHovered[buttonKey] ?? false ? Colors.white : const Color(0xFF94A3B8),
            fontSize: isMobile ? 14 : 16,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLink(
    BuildContext context, {
    required IconData icon,
    required String url,
    required String buttonKey,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: Matrix4.translationValues(0, _isHovered[buttonKey] ?? false ? -2.0 : 0, 0),
      child: InkWell(
        onTap: () => _handleNavigation(context, buttonKey, url: url),
        onHover: (isHovering) {
          setState(() {
            _isHovered[buttonKey] = isHovering;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _isHovered[buttonKey] ?? false ? const Color(0xFF1E293B) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 20,
            color: _isHovered[buttonKey] ?? false ? Colors.white : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }
}
