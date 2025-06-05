import '../inheritance.dart';

void main(List<String> args) {
  final husky = Husky('Max');
  husky.speak(); // Output: Max barks
  husky.meow1(); // Output: meow1
}

mixin Cat1 on Animal {
  void meow1() {
    print('meow1');
  }
}
// Cat1 mixin should be used on a class which extends Animal

class Husky extends Animal with Cat1{
  String name;
  Husky(this.name):super(name);

  void speak() {
    print('$name barks');
  }  
}
