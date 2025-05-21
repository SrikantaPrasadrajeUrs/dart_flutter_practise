
// dart programing 
// this, static 
import 'dart:io';

void main(List<String> args) {
  // only person type data 
  List<Person> persons = []; //

  // Create Read Update Delete = CRUD
   while(true){
    print("\n====Menu====");
    print("Enter 1 to add a Person\n");
    print("Enter 2 to read all Person\n");
    print("Enter 3 to update Person age by name\n");
    print("Enter 4 to Delete a Person");
    print("Enter 5 to enter as guest");
    print("Enter 6 to exit");
    // store Person can be 2 type
    // Name and age --- Guest

    String? choice = stdin.readLineSync();
    switch (choice) {
      case "1":
      // add a Person
      print("enter Person name and age");
      String? name = stdin.readLineSync();
      int? age = int.tryParse(stdin.readLineSync()??"");
      if(name == null || age ==null){
        print("Enter a valid name or age");
      }else{
        persons.add(Person(name: name, age: age));
      } 
        break;
      case "2":
      print("${persons.length} Persons found: $persons");
      // read Person
      break;
      case "3":
      print("Please enter your name to update age");
      String? name = stdin.readLineSync();
       int? updatedAge = int.tryParse(stdin.readLineSync()??"");
      if(name == null || updatedAge ==null){
        print("Enter a valid input");
      }else{
        for(var person in persons){
          if(person.name==name){
            // bharat age 24->25
            person.age = updatedAge;
          }
        }
      }
      // update a Person
      break;
      case "4":
      String? name = stdin.readLineSync(); //sekar
      if(name==null){
        print("invalid name");
      }else{  //3 [0 1 2]<3
          for(int i=0;i<persons.length;i++){
            if(persons[i].name == name){
              persons.removeAt(i);
              break;
            }
          }
      }
      // delete a Person
        break;
      case "5":
        persons.add(Person.guest());
        // close and Print all stored Person
        break;
        case "6":
        print("Exiting program");
        return;
      default:
        print("Invalid choice");
    }
   }
}

class Person {
  final String name;
  int age;

  Person({required this.name, required this.age});

  Person.guest()
      : name = 'Guest',
        age = 0;

  @override
  String toString() => 'Person(name: $name, age: $age)';
}