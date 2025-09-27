import 'package:flutter/material.dart';
import 'package:travel_alarm/constants/themes/app_colors.dart';

class OnBoardingPage extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const OnBoardingPage({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image(
            width: double.infinity,
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              Text(
                subTitle,
                style: TextStyle(fontSize: 14, color: AppColors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
