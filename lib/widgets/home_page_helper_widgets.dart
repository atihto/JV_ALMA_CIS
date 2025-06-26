import 'package:flutter/material.dart';
import 'package:jv_alma_cis/widgets/custom_widgets.dart';
import 'dart:developer' as developer;

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
    required Color hoverBgColor,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovered = false;

        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: () {
              developer.log('businessUnitCard: Tapped $route', name: 'HomePageHelperWidgets');
              if (context.mounted) {
                Navigator.pushNamed(context, route).catchError((e) {
                  developer.log('businessUnitCard: Navigation error to $route: $e', name: 'HomePageHelperWidgets');
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Navigation error: ${e.toString()}')),
                    );
                  }
                  return null;
                });
              }
            },
            child: SizedBox(
              height: isMobile ? 250 : 250, // Increased from 200 to 250 for mobile
              child: Card(
                elevation: isHovered ? 6 : 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                color: isHovered ? hoverBgColor : bgColor,
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: EdgeInsets.all(isMobile ? 12 : 20), // Reduced padding from 16 to 12 for mobile
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icon,
                        size: isMobile ? 28 : 32,
                        color: iconColor,
                      ),
                      const SizedBox(height: 12), // Reduced from 16
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 16 : 18,
                              color: const Color(0xFF1F2937),
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8), // Reduced from 12
                      Expanded(
                        child: Text(
                          description,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: isMobile ? 14 : 16,
                                color: const Color(0xFF4B5563),
                                height: 1.4,
                              ),
                          maxLines: 2, // Reduced from 3 to 2
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 12), // Reduced from 16
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CustomButton(
                          text: 'Learn More',
                          onPressed: () {
                            developer.log('businessUnitCard: Tapped Learn More for $route', name: 'HomePageHelperWidgets');
                            if (context.mounted) {
                              Navigator.pushNamed(context, route).catchError((e) {
                                developer.log('businessUnitCard: Navigation error to $route: $e', name: 'HomePageHelperWidgets');
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Navigation error: ${e.toString()}')),
                                  );
                                }
                                return null;
                              });
                            }
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
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16 : 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: isMobile ? 28 : 36, color: Colors.white),
              const SizedBox(height: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 16 : 18,
                            color: Colors.white,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: isMobile ? 14 : 16,
                            color: Colors.white.withValues(alpha: 0.9),
                            height: 1.4,
                          ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  developer.log('projectCard: Navigating to $route', name: 'HomePageHelperWidgets');
                  if (context.mounted) {
                    Navigator.pushNamed(context, route).catchError((e) {
                      developer.log('projectCard: Navigation error to $route: $e', name: 'HomePageHelperWidgets');
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Navigation error: ${e.toString()}')),
                        );
                      }
                      return null;
                    });
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                child: const Text('Learn More', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}