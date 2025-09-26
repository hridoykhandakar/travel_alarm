import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_alarm/constants/themes/app_colors.dart';

class OutlineIconButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double fontSize;

  final double radius;
  final String icon;
  const OutlineIconButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.fontSize = 16,
    this.radius = 16,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,

        icon: SvgPicture.asset(icon, height: 24, width: 24),
        label: Text(label),
        iconAlignment: IconAlignment.end,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(color: Color(0XFF4D4D4D), width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(radius),
          ),
          elevation: 0,
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
