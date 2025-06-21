import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final bool hoverEffect;
  final Clip clipBehavior;
  final Widget content;

  const CustomCard({
    super.key,
    this.hoverEffect = false,
    this.clipBehavior = Clip.none,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: clipBehavior,
      borderRadius: BorderRadius.circular(8),
      child: Material(
        elevation: hoverEffect ? 2 : 1,
        color: Colors.white,
        child: InkWell(
          onTap: hoverEffect ? () {} : null,
          hoverColor: hoverEffect ? Colors.grey.withOpacity(0.1) : null,
          child: content,
        ),
      ),
    );
  }
}