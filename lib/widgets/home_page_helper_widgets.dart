import 'package:flutter/material.dart';
import 'package:jv_alma_cis/widgets/custom_widgets.dart';
import 'package:jv_alma_cis/widgets/custom_card.dart' as card;
import 'dart:developer' as developer;

class HomePageHelperWidgets {
  static double _getResponsiveFontSize(double screenWidth, {double baseSize = 16}) {
    return baseSize * (screenWidth / 600).clamp(0.8, 1.2);
  }

  static double _getResponsiveIconSize(double cardHeight, {double baseSize = 32}) {
    return baseSize * (cardHeight / 250).clamp(0.7, 1.0);
  }

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
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = constraints.maxHeight;
        return card.CustomCard(
          hoverEffect: true,
          clipBehavior: Clip.hardEdge,
          content: StatefulBuilder(
            builder: (context, setState) {
              bool isHovered = false;

              return MouseRegion(
                onEnter: (_) {
                  if (context.mounted) {
                    setState(() => isHovered = true);
                    developer.log('businessUnitCard: Hover enter $name', name: 'HomePageHelperWidgets');
                  }
                },
                onExit: (_) {
                  if (context.mounted) {
                    setState(() => isHovered = false);
                    developer.log('businessUnitCard: Hover exit $name', name: 'HomePageHelperWidgets');
                  }
                },
                cursor: SystemMouseCursors.click,
                child: InkWell(
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
                  splashColor: Colors.grey.withOpacity(0.2),
                  hoverColor: hoverBgColor,
                  borderRadius: BorderRadius.circular(12),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: isHovered ? Matrix4.identity().scaled(1.02) : Matrix4.identity(),
                    decoration: BoxDecoration(
                      color: isHovered ? hoverBgColor : bgColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(isHovered ? 0.3 : 0.1),
                          blurRadius: isHovered ? 12 : 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(isMobile ? 10 : isTablet ? 12 : 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          icon,
                          size: _getResponsiveIconSize(cardHeight, baseSize: isMobile ? 28 : 32),
                          color: iconColor,
                        ),
                        SizedBox(height: isMobile ? 6 : 8),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: _getResponsiveFontSize(screenWidth, baseSize: isMobile ? 16 : isTablet ? 17 : 18),
                                color: const Color(0xFF1F2937),
                              ),
                        ),
                        SizedBox(height: isMobile ? 6 : 8),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: _getResponsiveFontSize(screenWidth, baseSize: isMobile ? 12 : isTablet ? 13 : 14),
                                color: const Color(0xFF4B5563),
                                height: 1.3,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = constraints.maxHeight;
        return card.CustomCard(
          hoverEffect: true,
          clipBehavior: Clip.hardEdge,
          content: Container(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 10 : isTablet ? 12 : 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, size: _getResponsiveIconSize(cardHeight, baseSize: isMobile ? 28 : 32), color: Colors.white),
                  SizedBox(height: isMobile ? 6 : 8),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: _getResponsiveFontSize(screenWidth, baseSize: isMobile ? 16 : isTablet ? 17 : 18),
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(height: isMobile ? 6 : 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: _getResponsiveFontSize(screenWidth, baseSize: isMobile ? 12 : isTablet ? 13 : 14),
                          color: Colors.white.withValues(alpha: 0.9),
                          height: 1.3,
                        ),
                  ),
                  SizedBox(height: isMobile ? 6 : 8),
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
      },
    );
  }
}