import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final void Function() onTap;
  final Color? color;
  const CustomBackButton({super.key, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: color ?? const Color(0xff959799)),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_back,
            color: color ?? const Color(0xff959799),
            size: 12,
          ),
        ),
      ),
    );
  }
}
