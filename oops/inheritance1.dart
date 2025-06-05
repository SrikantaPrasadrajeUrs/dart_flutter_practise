// parent class - super class
class Animal{
  String name;

  Animal(this.name);

  void breathe(){
    print('$name is breathing');
  }
}

// child class - sub class
class Dog extends Animal{
  String name;
  Dog(this.name): super(name);
}
// zoozi is dog
class Zoozi extends Dog {
  Zoozi(String name) : super(name);
}

void main(List<String> args) {
  final Zoozi zoozi = Zoozi('Zoozi');
  zoozi.breathe(); // Output: Zoozi is breathing
}

// Multi-level inheritance
// hierachiecal inheritance

class Person{
  String name;
  Person(this.name);
  void walking() {
    print('$name is walking');
  }
}

class Employee extends Person {
  String position;
  Employee(String name, this.position) : super(name);
  
  void work() {
    print('$name is working as $position');
  }
}

class Manager extends Person {
  Manager(String name, String position) : super(name);
  
  void manage() {
    print('$name is managing the team');
  }
}
