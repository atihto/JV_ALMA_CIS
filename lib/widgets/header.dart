import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'custom_button.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AppScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 120.0,
        title: Header(onMenuPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        }),
      ),
      drawer: const AppDrawer(),
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
    {'name': 'News', 'href': '/news'},
    {'name': 'Contact', 'href': '/contact'},
    {'name': 'Get Quote', 'href': '/contact'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width.clamp(300.0, double.infinity);
    final isMobile = screenWidth < 600;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isMobile)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SizedBox(
                width: 48,
                height: 48,
                child: IconButton(
                  icon: const Icon(LucideIcons.menu, color: Colors.black, size: 28),
                  onPressed: onMenuPressed,
                ),
              ),
            ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: GestureDetector(
              onTap: () => _navigate(context, '/'),
              child: Image.asset(
                'assets/images/clients/jv.jpg',
                fit: BoxFit.contain,
                width: 150,
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  debugPrint('Header: Image load error: $error');
                  return const Center(child: Text('Logo Missing', style: TextStyle(color: Colors.black)));
                },
              ),
            ),
          ),
          if (!isMobile)
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...navigation.map((item) {
                        if (item['name'] == 'About Us') {
                          return _buildDropdownMenu(context, item, screenWidth);
                        }
                        return _NavItem(
                          text: item['name']!,
                          onTap: () => _navigate(context, item['href']!),
                        );
                      }),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: CustomButton(
                          text: 'Get Quote',
                          onPressed: () => _navigate(context, '/contact'),
                          isOutline: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _navigate(BuildContext context, String href) {
    Navigator.pushNamed(context, href).catchError((e) {
      debugPrint('Header: Navigation error to $href: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Navigation error: $e')),
      );
      return null;
    });
  }

  Widget _buildDropdownMenu(BuildContext context, Map<String, String> item, double screenWidth) {
    return SizedBox(
      height: 40,
      child: Center(
        child: PopupMenuButton<String>(
          offset: const Offset(0, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          itemBuilder: (context) => const [
            PopupMenuItem<String>(
              value: '/about',
              child: Text('About Our Company', style: TextStyle(fontSize: 14, color: Colors.black)),
            ),
            PopupMenuItem<String>(
              value: '/careers',
              child: Text('Careers', style: TextStyle(fontSize: 14, color: Colors.black)),
            ),
            PopupMenuItem<String>(
              value: '/projects',
              child: Text('Projects', style: TextStyle(fontSize: 14, color: Colors.black)),
            ),
          ],
          onSelected: (href) => _navigate(context, href),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item['name']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(LucideIcons.chevronDown, size: 16, color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _NavItem({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  static const List<Map<String, String>> navigation = [
    {'name': 'Home', 'href': '/'},
    {'name': 'About Us', 'href': '/about'},
    {'name': 'Business Units', 'href': '/business-units'},
    {'name': 'News', 'href': '/news'},
    {'name': 'Contact', 'href': '/contact'},
    {'name': 'Get Quote', 'href': '/contact'},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white, // Set drawer background to white
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/images/clients/jv.jpg',
                  fit: BoxFit.contain,
                  width: 150,
                  height: 150,
                  errorBuilder: (context, error, stackTrace) {
                    debugPrint('Drawer: Image load error: $error');
                    return const Center(
                      child: Text('Logo Missing', style: TextStyle(color: Colors.black)),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: navigation.map((item) {
                return ListTile(
                  title: Text(
                    item['name']!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context); // Close drawer
                    Navigator.pushNamed(context, item['href']!).catchError((e) {
                      debugPrint('Drawer: Navigation error to ${item['href']}: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Navigation error: $e')),
                      );
                      return null;
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}