import 'classes.dart';

void main(List<String> args) {
  Bank b = Bank("ICICI", "Chennai", 1994);
  // static variable can be accessed without creating an object
  // static varibale can be accessed using class name
  print(Bank.country);
  Bank.displayCountry();
}