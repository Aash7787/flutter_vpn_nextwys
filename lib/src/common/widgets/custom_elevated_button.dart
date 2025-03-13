import 'package:flutter/material.dart';
import 'package:flutter_vpn/src/common/const/global_variable.dart';
import 'package:flutter_vpn/src/common/const/global_variable.dart' as AppTheme;
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double? textSize;
  final double? letterSpacing;
  final double? borderRadius;
  final double? elevation;
  final Color? textColor;
  final FontWeight? fontWeight;
  final List<Color>? gradientColors;
  final Color? color;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final bool isIconRight;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.elevation,
    this.textColor,
    this.fontWeight,
    this.textSize,
    this.letterSpacing,
    this.borderRadius,
    this.gradientColors,
    this.color,
    this.backgroundColor,
    this.padding,
    this.width,
    this.height,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.isIconRight = false,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 45,
      width: width ?? double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(45),
          padding: EdgeInsets.zero,
          backgroundColor:  
              backgroundColor ?? AppTheme.colorScheme(context).primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
          ),
          elevation: elevation ?? 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.nunito(
            color: textColor ?? colorScheme(context).onPrimary,
            fontWeight: fontWeight ?? FontWeight.w600,
            fontSize: textSize ?? 15,
            letterSpacing: letterSpacing ?? 0,
          ),
        ),
      ),
    );
  }
}
