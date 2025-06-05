import 'dart:ffi';

class Bank{
  static String country = "India";

  String name;
  String location;
  int establishedYear;

  Bank(this.name, this.location, this.establishedYear);

  static void displayCountry() {
    print("Country: $country");
  }

  @override
  String toString() {
    return 'Bank{name: $name, location: $location, establishedYear: $establishedYear}';
  }
}
