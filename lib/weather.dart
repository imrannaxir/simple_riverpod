//
//
//

class Weather {
  Future<String> fetchWeather() async {
    return Future.delayed(
      const Duration(seconds: 3),
      () => 'Today weather is hot and stormy',
    );
  }

  Stream<int> fetchTemperature(int value) async* {
    for (int i = value; i <= 500; i++) {
      await Future.delayed(
        const Duration(seconds: 3),
      );
      yield i;
    }
  }
}
