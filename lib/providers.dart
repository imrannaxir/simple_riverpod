//
//
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_riverpod/weather.dart';

final weatherProvider = Provider<Weather>((ref) {
  return Weather();
});

final counterProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

final weatherStatusProvider = FutureProvider<String>((ref) {
  return ref.watch(weatherProvider).fetchWeather();
});

final temperatureProvider = StreamProvider.family<int, int>((ref, int value) {
  return ref.watch(weatherProvider).fetchTemperature(value);
});
