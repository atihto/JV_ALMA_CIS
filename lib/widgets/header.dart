import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'custom_widgets.dart';
import 'dart:developer' as developer;

class AppScaffold extends StatelessWidget {
  final Widget body;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AppScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    developer.log('AppScaffold: Building scaffold with endDrawer', name: 'AppScaffold');
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Header(
            onMenuPressed: () {
              developer.log('AppScaffold: Opening endDrawer', name: 'AppScaffold');
              _scaffoldKey.currentState?.openEndDrawer();
            },
            scaffoldKey: _scaffoldKey,
          ),
        ),
        endDrawer: AppDrawer(scaffoldKey: _scaffoldKey),
        body: body,
        endDrawerEnableOpenDragGesture: true,
      ),
    );
  }
}

class Header extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const Header({super.key, required this.onMenuPressed, this.scaffoldKey});

  static const List<Map<String, String>> navigation = [
    {'name': 'Home', 'href': '/'},
    {'name': 'About Our Company', 'href': '/about'},
    {'name': 'Business Units', 'href': '/business-units'},
    {'name': 'News', 'href': '/news'},
    {'name': 'Contact', 'href': '/contact'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width.clamp(300.0, double.infinity);
    final isMobile = screenWidth < 768;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: 12,
          ),
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Container(
                  width: isMobile ? 120 : 150,
                  height: isMobile ? 50 : 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GestureDetector(
                    onTap: () => _navigate(context, '/'),
                    child: Image.asset(
                      'assets/images/clients/jv.jpg',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        developer.log('Header: Image load error: $error', name: 'Header');
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
                SizedBox(width: isMobile ? 16 : 24),
                // Navigation for desktop
                if (!isMobile && !isTablet)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...navigation.take(4).map((item) {
                        return _NavItem(
                          text: item['name']!,
                          onTap: () => _navigate(context, item['href']!),
                        );
                      }),
                      const SizedBox(width: 16),
                      CustomButton(
                        text: 'Get Quote',
                        onPressed: () => _navigate(context, '/contact'),
                        isOutline: true,
                      ),
                    ],
                  ),
                // Menu button for mobile and tablet
                if (isMobile || isTablet)
                  IconButton(
                    icon: const Icon(LucideIcons.menu, color: Color(0xFF1E293B), size: 24),
                    onPressed: onMenuPressed,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigate(BuildContext context, String href) {
    developer.log('Header: Navigating to $href', name: 'Header');
    scaffoldKey?.currentState?.closeEndDrawer();
    Navigator.pushNamed(context, href).catchError((e) {
      developer.log('Header: Navigation error to $href: $e', name: 'Header');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigation error: $e')),
        );
      }
      return null;
    });
  }
}

class _NavItem extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _NavItem({required this.text, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isHovered ? const Color(0xFFF8FAFC) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.text,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isHovered ? const Color(0xFF0F172A) : const Color(0xFF1E293B),
            ).merge(const TextStyle(debugLabel: 'PoppinsCheck')),
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const AppDrawer({super.key, this.scaffoldKey});

  static const List<Map<String, dynamic>> navigation = [
    {'name': 'Home', 'href': '/', 'icon': LucideIcons.home},
    {'name': 'About Our Company', 'href': '/about', 'icon': LucideIcons.info},
    {'name': 'Business Units', 'href': '/business-units', 'icon': LucideIcons.building2},
    {'name': 'Projects', 'href': '/projects', 'icon': LucideIcons.briefcase},
    {'name': 'Careers', 'href': '/careers', 'icon': LucideIcons.users},
    {'name': 'News', 'href': '/news', 'icon': LucideIcons.newspaper},
    {'name': 'Contact', 'href': '/contact', 'icon': LucideIcons.phone},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    developer.log('AppDrawer: Building endDrawer with ${navigation.length} items', name: 'AppDrawer');

    return SizedBox(
      width: screenWidth * 0.75 > 300 ? 300 : screenWidth * 0.75,
      child: Drawer(
        child: Material(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E293B),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/images/clients/jv.jpg',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              developer.log('Drawer: Image load error: $error', name: 'AppDrawer');
                              return const Center(
                                child: Text(
                                  'JV ALMA C.I.S',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: IconButton(
                          icon: const Icon(
                            LucideIcons.x,
                            color: Colors.white,
                            size: 24,
                          ),
                          onPressed: () {
                            developer.log('AppDrawer: Close button tapped', name: 'AppDrawer');
                            scaffoldKey?.currentState?.closeEndDrawer();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: navigation.length,
                    itemBuilder: (context, index) {
                      final item = navigation[index];
                      developer.log('AppDrawer: Building item ${item['name']}', name: 'AppDrawer');
                      return ListTile(
                        leading: Icon(
                          item['icon'] as IconData,
                          color: const Color(0xFF1E293B),
                          size: 20,
                        ),
                        title: Text(
                          item['name']!,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1E293B),
                          ).merge(const TextStyle(debugLabel: 'PoppinsCheck')),
                        ),
                        onTap: () {
                          developer.log('AppDrawer: Tapped ${item['name']}', name: 'AppDrawer');
                          scaffoldKey?.currentState?.closeEndDrawer();
                          Navigator.pushNamed(context, item['href']!).catchError((e) {
                            developer.log('Drawer: Navigation error to ${item['href']}: $e', name: 'AppDrawer');
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Navigation error: $e')),
                              );
                            }
                            return null;
                          });
                        },
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Get Quote',
                      onPressed: () {
                        developer.log('AppDrawer: Tapped Get Quote', name: 'AppDrawer');
                        scaffoldKey?.currentState?.closeEndDrawer();
                        Navigator.pushNamed(context, '/contact').catchError((e) {
                          developer.log('Drawer: Navigation error to /contact: $e', name: 'AppDrawer');
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Navigation error: $e')),
                            );
                          }
                          return null;
                        });
                      },
                      isLarge: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}