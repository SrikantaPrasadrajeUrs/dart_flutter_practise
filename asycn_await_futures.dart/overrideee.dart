class Person extends Object{
  String name;
  int age;
  Person(this.name, this.age);
 
  // the process of changing implmentation of super class method in subclass is known as overriding
  @override
  String toString() {
    return "Person: name: $name, age: $age";
  }
}


// main method is an entry point for dart program
void main(List<String> args) {
  // when u print a person object by default it will call toString Method
  print(Person("Willane", 23));
}