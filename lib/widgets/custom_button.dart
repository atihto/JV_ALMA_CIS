import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isOutline;
  final bool isLarge;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.isOutline = false,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: isOutline ? Theme.of(context).primaryColor : Colors.white,
        backgroundColor: isOutline ? Colors.transparent : Theme.of(context).primaryColor,
        side: isOutline ? BorderSide(color: Theme.of(context).primaryColor) : null,
        padding: EdgeInsets.symmetric(
          horizontal: isLarge ? 24 : 16,
          vertical: isLarge ? 12 : 8,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: isLarge ? 20 : 16),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: TextStyle(fontSize: isLarge ? 16 : 14),
          ),
        ],
      ),
    );
  }
}