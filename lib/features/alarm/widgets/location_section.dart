import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_alarm/constants/icon_string.dart';
import 'package:travel_alarm/constants/themes/app_colors.dart';
import 'package:travel_alarm/features/location/providers/location_provider.dart';

class LocationSection extends ConsumerWidget {
  const LocationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationProvider);
    final city = locationState.value ?? "";

    return GestureDetector(
      onTap: () async {
        ref.read(locationProvider.notifier).fetchCity();
      },
      child: Row(
        children: [
          SvgPicture.asset(IconString.locationIcon),
          const SizedBox(width: 8),
          Text(
            city.isEmpty ? "Add your location" : city,
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.27),
              fontSize: 16,
              height: 1.5,
            ),
          ),
          // Optional: Show loading indicator when fetching
          if (locationState.isLoading) ...[
            const SizedBox(width: 8),
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ],
        ],
      ),
    );
  }
}
