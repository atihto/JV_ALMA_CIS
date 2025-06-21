import 'package:flutter/material.dart';
import 'package:jv_alma_cis/widgets/custom_widgets.dart';

class HomePageHelperWidgets {
  static Widget businessUnitCard({
    required BuildContext context,
    required String name,
    required IconData icon,
    required String title,
    required String description,
    required String route,
    required Color iconColor,
    required Color bgColor,
    required Color hoverBgColor, // Used for hover state background color
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isSmallScreen = screenWidth < 400;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovered = false;

        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: () {
              debugPrint('businessUnitCard: Tapped $route');
              Navigator.pushNamed(context, route).catchError((e) {
                debugPrint('businessUnitCard: Navigation error to $route: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Navigation error: ${e.toString()}')),
                );
                return null;
              });
            },
            child: Container(
              constraints: BoxConstraints(
                minHeight: isSmallScreen ? 80 : isMobile ? 100 : isTablet ? 180 : 160,
                maxWidth: isMobile ? screenWidth * 0.9 : 300,
              ),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                // ignore: dead_code
                color: isHovered ? hoverBgColor : bgColor,
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: EdgeInsets.all(isSmallScreen ? 6 : isMobile ? 8 : 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        icon,
                        size: isSmallScreen ? 18 : isMobile ? 20 : 28,
                        color: iconColor,
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isSmallScreen ? 11 : isMobile ? 12 : 14,
                                    color: const Color(0xFF1F2937),
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              description,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: isSmallScreen ? 9 : isMobile ? 10 : 12,
                                    color: const Color(0xFF4B5563),
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isMobile ? 100 : 120,
                          maxHeight: isSmallScreen ? 24 : isMobile ? 28 : 32,
                        ),
                        child: CustomButton(
                          text: 'Learn More',
                          onPressed: () {
                            debugPrint('businessUnitCard: Tapped Learn More for $route');
                            Navigator.pushNamed(context, route).catchError((e) {
                              debugPrint('businessUnitCard: Navigation error to $route: $e');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Navigation error: ${e.toString()}')),
                              );
                              return null;
                            });
                          },
                          isOutline: true,
                          isLarge: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget projectCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required LinearGradient gradient,
    required String route,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 12 : 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: isMobile ? 24 : 32, color: Colors.white),
              const SizedBox(height: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.white,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 12 : 14,
                            color: Colors.white70,
                          ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: TextButton(
                  onPressed: () {
                    debugPrint('projectCard: Navigating to $route');
                    Navigator.pushNamed(context, route).catchError((e) {
                      debugPrint('projectCard: Navigation error to $route: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Navigation error: ${e.toString()}')),
                      );
                      return null;
                    });
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text('Learn More'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget quickLinkCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required String route,
    required Color iconColor,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: isMobile ? 24 : 32, color: iconColor),
            const SizedBox(height: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 14 : 16,
                          color: const Color(0xFF1F2937),
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: isMobile ? 12 : 14,
                          color: const Color(0xFF4B5563),
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 120),
              child: TextButton(
                onPressed: () {
                  debugPrint('quickLinkCard: Navigating to $route');
                  Navigator.pushNamed(context, route).catchError((e) {
                    debugPrint('quickLinkCard: Navigation error to $route: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Navigation error: ${e.toString()}')),
                    );
                    return null;
                  });
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF2563EB),
                  padding: EdgeInsets.zero,
                ),
                child: const Text('Learn More'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}