mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

class DataService with Logger {
  void fetchData() {
    log('Fetching data...');
    // logic to fetch data
  }
}

class Engine {
  void start() => print("Engine started");
}

mixin Electric on Engine {
  void charge() => print("Charging...");
}

class Car extends Engine with Electric {}
