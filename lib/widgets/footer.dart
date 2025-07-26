import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jv_alma_cis/config.dart';
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
  String? _hoveredUrl;

  void _toggleClick(String buttonKey) {
    setState(() {
      _isClicked.updateAll((key, value) => false);
      _isClicked[buttonKey] = true;
    });
  }

  Future<void> _handleNavigation(BuildContext context, String route, {String? url}) async {
    _toggleClick(route);
    if (url != null) {
      try {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not launch $url')),
            );
          }
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      }
    } else {
      if (context.mounted) {
        Navigator.pushNamed(context, route).catchError((e) {
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
      child: Stack(
        children: [
          Container(
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
                      alignment: WrapAlignment.center,
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
                                            'JV ALMA C.I.S',
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
                                'Leading provider of construction, agribusiness, oil & gas services, and IT solutions across East Africa.',
                                style: TextStyle(
                                  color: const Color(0xFF94A3B8),
                                  fontSize: isMobile ? 14 : 16,
                                  height: 1.5,
                                ),
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
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 20 : 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _buildFooterLink(
                                context,
                                text: 'Business Units',
                                route: '/business-units',
                                isMobile: isMobile,
                                buttonKey: 'businessUnits',
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
                                text: 'Careers',
                                route: '/careers',
                                isMobile: isMobile,
                                buttonKey: 'careersQuickLink',
                              ),
                            ],
                          ),
                        ),
                        // Contact Details and Social Media
                        SizedBox(
                          width: isLargeScreen ? 300 : screenWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Contact Us',
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 20 : 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              _buildContactInfo(
                                icon: LucideIcons.phone,
                                text: 'Call us on\n${Config.companyPhone}',
                                uri: 'tel:${Config.companyPhone.replaceAll(' ', '')}',
                                isMobile: isMobile,
                                buttonKey: 'phone',
                              ),
                              const SizedBox(height: 12),
                              _buildContactInfo(
                                icon: LucideIcons.mail,
                                text: 'Email us on\n${Config.companyEmail}',
                                uri: 'mailto:${Config.companyEmail}',
                                isMobile: isMobile,
                                buttonKey: 'email',
                              ),
                              const SizedBox(height: 12),
                              _buildContactInfo(
                                icon: LucideIcons.mapPin,
                                isMobile: isMobile,
                                buttonKey: 'address',
                                customContent: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'HQ: Kingara Heights, Nairobi, Kenya',
                                      style: TextStyle(
                                        color: _isHovered['address'] ?? false ? Colors.white : const Color(0xFF94A3B8),
                                        fontSize: isMobile ? 14 : 16,
                                        height: 1.5,
                                      ),
                                      softWrap: true,
                                      maxLines: null,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Branch: Manipur Plaza, Mombasa, Kenya',
                                      style: TextStyle(
                                        color: _isHovered['address'] ?? false ? Colors.white : const Color(0xFF94A3B8),
                                        fontSize: isMobile ? 14 : 16,
                                        height: 1.5,
                                      ),
                                      softWrap: true,
                                      maxLines: null,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Follow Us',
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 20 : 24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 8,
                                children: [
                                  _buildSocialLink(
                                    context,
                                    icon: LucideIcons.linkedin,
                                    url: Config.linkedinUrl,
                                    buttonKey: 'linkedin',
                                  ),
                                  _buildSocialLink(
                                    context,
                                    icon: LucideIcons.instagram,
                                    url: 'https://www.instagram.com/jvalmacis/',
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
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          if (isMobile) ...[
                            Text(
                              '© 2025 Copyright JV ALMA C.I.S Kenya.',
                              style: TextStyle(
                                color: const Color(0xFF94A3B8),
                                fontSize: isMobile ? 12 : 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
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
                            Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              alignment: WrapAlignment.center,
                              children: [
                                Text(
                                  '© 2025 Copyright JV ALMA C.I.S Kenya.',
                                  style: TextStyle(
                                    color: const Color(0xFF94A3B8),
                                    fontSize: isMobile ? 12 : 14,
                                  ),
                                ),
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
          ),
          // URL Display in Bottom-Left Corner
          if (_hoveredUrl != null)
            Positioned(
              bottom: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  _hoveredUrl!,
                  style: TextStyle(
                    color: const Color(0xFFBFDBFE),
                    fontSize: isMobile ? 12 : 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContactInfo({
    required IconData icon,
    required bool isMobile,
    required String buttonKey,
    String? text,
    String? uri,
    Widget? customContent,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: Matrix4.translationValues(0, _isHovered[buttonKey] ?? false ? -2.0 : 0, 0),
      child: InkWell(
        onTap: uri != null
            ? () => _handleNavigation(context, buttonKey, url: uri)
            : null,
        onHover: (isHovering) {
          setState(() {
            _isHovered[buttonKey] = isHovering;
          });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 16, color: _isHovered[buttonKey] ?? false ? Colors.white : const Color(0xFF64748B)),
            const SizedBox(width: 8),
            Expanded(
              child: customContent ??
                  Text(
                    text!,
                    style: TextStyle(
                      color: _isHovered[buttonKey] ?? false ? Colors.white : const Color(0xFF94A3B8),
                      fontSize: isMobile ? 14 : 16,
                      height: 1.5,
                    ),
                    softWrap: true,
                    maxLines: null,
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
          style: GoogleFonts.poppins(
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
            _hoveredUrl = isHovering ? url : null;
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