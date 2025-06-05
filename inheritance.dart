// inheritance
//hierarchical inheritance
// This Dart code demonstrates hierarchical inheritance with an Animal class and its subclasses Dog and Cat.
// Each subclass overrides the speak method to provide specific behavior.
// Hierarchical Inheritance Example in Dart
// This code defines a base class Animal and two subclasses Dog and Cat.
// Each subclass implements its own version of the speak method, demonstrating polymorphism.
class Animal {
  String name;

  Animal(this.name);

  void speak() {
    print('$name makes a sound');
  }
}
class Dog extends Animal {
  Dog(String name) : super(name);

  @override
  void speak() {
    print('$name barks');
  }
}
class Cat extends Animal {
  Cat(String name) : super(name);

  @override
  void speak() {
    print('$name meows');
  }
}

// multi-level inheritance
// This code demonstrates multi-level inheritance with a base class Animal, a subclass Dog, and another subclass Puppy.
class Puppy extends Dog {
  Puppy(String name) : super(name);

  @override
  void speak() {
    print('$name yips');
  }
}



void main() {
  Animal myDog = Dog('Buddy');
  Animal myCat = Cat('Whiskers');

  myDog.speak(); // Output: Buddy barks
  myCat.speak(); // Output: Whiskers meows
}