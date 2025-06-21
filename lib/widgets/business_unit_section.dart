import 'package:flutter/material.dart';

class BusinessUnitSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String? description;
  final List<Widget> children;

  const BusinessUnitSection({
    required this.title,
    required this.icon,
    required this.iconColor,
    this.description,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding: EdgeInsets.symmetric(vertical: isMobile ? 32 : 64, horizontal: 16),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: isMobile ? screenWidth * 0.9 : 896),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: iconColor, size: isMobile ? 32 : 48),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: iconColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              if (description != null) ...[
                const SizedBox(height: 12),
                Text(
                  description!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
              const SizedBox(height: 24),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}