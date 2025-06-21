import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

class CustomCard extends StatelessWidget {
  final Widget content;
  final bool hoverEffect;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constraints;

  const CustomCard({
    super.key,
    required this.content,
    this.hoverEffect = false,
    this.margin,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width.clamp(300.0, double.infinity);
    
    Widget card = Card(
      elevation: hoverEffect ? 4 : 2,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: hoverEffect && kIsWeb && screenWidth >= 600
            ? MouseRegion(
                cursor: SystemMouseCursors.click,
                child: content,
                onEnter: (_) => developer.log('Card hover enter', name: 'CustomCard'),
                onExit: (_) => developer.log('Card hover exit', name: 'CustomCard'),
              )
            : content,
      ),
    );

    if (constraints != null) {
      card = ConstrainedBox(
        constraints: constraints!,
        child: card,
      );
    }

    if (margin != null) {
      card = Padding(
        padding: margin!,
        child: card,
      );
    }

    return card;
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutline;
  final bool isLarge;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutline = false,
    this.isLarge = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width.clamp(300.0, double.infinity);
    
    final buttonStyle = isOutline
        ? OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF1E293B), width: 2),
            foregroundColor: const Color(0xFF1E293B),
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: isLarge ? 16 : 12,
              horizontal: isLarge ? 24 : 18,
            ),
            textStyle: TextStyle(
              fontSize: screenWidth < 576 ? 14 : 16,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: Size(screenWidth < 576 ? 120 : 140, isLarge ? 48 : 44),
          )
        : ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1E293B),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: isLarge ? 16 : 12,
              horizontal: isLarge ? 24 : 18,
            ),
            textStyle: TextStyle(
              fontSize: screenWidth < 576 ? 14 : 16,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 2,
            minimumSize: Size(screenWidth < 576 ? 120 : 140, isLarge ? 48 : 44),
          );

    final buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: screenWidth < 576 ? 16 : 18),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 120),
      child: isOutline
          ? OutlinedButton(
              style: buttonStyle,
              onPressed: () {
                developer.log('Button pressed: $text', name: 'CustomButton');
                onPressed();
              },
              child: buttonChild,
            )
          : ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                developer.log('Button pressed: $text', name: 'CustomButton');
                onPressed();
              },
              child: buttonChild,
            ),
    );
  }
}