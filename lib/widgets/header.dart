import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'custom_widgets.dart';
import 'dart:developer' as developer;

class AppScaffold extends StatelessWidget {
  final Widget body;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AppScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Header(onMenuPressed: () {
          _scaffoldKey.currentState?.openEndDrawer();
        }),
      ),
      endDrawer: const AppDrawer(),
      body: body,
    );
  }
}

class Header extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const Header({super.key, required this.onMenuPressed});

  static const List<Map<String, String>> navigation = [
    {'name': 'Home', 'href': '/'},
    {'name': 'About Us', 'href': '/about'},
    {'name': 'Business Units', 'href': '/business-units'},
    {'name': 'Projects', 'href': '/projects'},
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
            vertical: 12
          ),
          child: Row(
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
              
              const Spacer(),
              
              // Navigation for desktop only
              if (!isMobile && !isTablet)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...navigation.take(4).map((item) {
                      if (item['name'] == 'About Us') {
                        return _buildDropdownMenu(context, item);
                      }
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
    );
  }

  void _navigate(BuildContext context, String href) {
    developer.log('Header: Navigating to $href', name: 'Header');
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

  Widget _buildDropdownMenu(BuildContext context, Map<String, String> item) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 8,
      itemBuilder: (context) => [
        const PopupMenuItem<String>(
          value: '/about',
          child: Text('About Our Company', style: TextStyle(fontSize: 14, color: Color(0xFF1E293B))),
        ),
        const PopupMenuItem<String>(
          value: '/careers',
          child: Text('Careers', style: TextStyle(fontSize: 14, color: Color(0xFF1E293B))),
        ),
        const PopupMenuItem<String>(
          value: '/projects',
          child: Text('Projects', style: TextStyle(fontSize: 14, color: Color(0xFF1E293B))),
        ),
        const PopupMenuItem<String>(
          value: '/references',
          child: Text('References', style: TextStyle(fontSize: 14, color: Color(0xFF1E293B))),
        ),
      ],
      onSelected: (href) => _navigate(context, href),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item['name']!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(LucideIcons.chevronDown, size: 16, color: Color(0xFF1E293B)),
          ],
        ),
      ),
    );
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
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isHovered ? const Color(0xFF0F172A) : const Color(0xFF1E293B),
            ),
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  static const List<Map<String, dynamic>> navigation = [
    {'name': 'Home', 'href': '/', 'icon': LucideIcons.home},
    {'name': 'About Us', 'href': '/about', 'icon': LucideIcons.info},
    {'name': 'Business Units', 'href': '/business-units', 'icon': LucideIcons.building2},
    {'name': 'Projects', 'href': '/projects', 'icon': LucideIcons.briefcase},
    {'name': 'Careers', 'href': '/careers', 'icon': LucideIcons.users},
    {'name': 'News', 'href': '/news', 'icon': LucideIcons.newspaper},
    {'name': 'References', 'href': '/references', 'icon': LucideIcons.award},
    {'name': 'Contact', 'href': '/contact', 'icon': LucideIcons.phone},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return SizedBox(
      width: screenWidth * 0.75 > 300 ? 300 : screenWidth * 0.75,
      child: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Color(0xFF1E293B),
              ),
              child: Center(
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
                          'JV ALMA CIS',
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
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: navigation.map((item) {
                  return ListTile(
                    leading: Icon(
                      item['icon'] as IconData,
                      color: const Color(0xFF1E293B),
                      size: 20,
                    ),
                    title: Text(
                      item['name']!,
                      style: const TextStyle(
                        color: Color(0xFF1E293B),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
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
                }).toList(),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Get Quote',
                  onPressed: () {
                    Navigator.pop(context);
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
    );
  }
}