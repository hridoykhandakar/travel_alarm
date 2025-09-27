import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:travel_alarm/features/location/services/location_service.dart';

final locationProvider =
    StateNotifierProvider<LocationNotifier, AsyncValue<String>>(
      (ref) => LocationNotifier(LocationService()),
    );

class LocationNotifier extends StateNotifier<AsyncValue<String>> {
  final LocationService _locationService;

  LocationNotifier(this._locationService) : super(const AsyncValue.loading());

  Future<void> fetchCity() async {
    state = const AsyncValue.loading();
    try {
      final city = await _locationService.getCityName();
      state = AsyncValue.data(city);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
