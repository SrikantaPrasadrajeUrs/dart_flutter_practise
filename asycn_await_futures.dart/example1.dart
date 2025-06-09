void main(List<String> args) async{
  // sync async await Future

  // sync
  // print("start");
  // syncFunction();// 12 sec sync
  // print("end");

  // async
  print("start");
  // program will not wait for asynchronous method
  // if want it to wait await
  await asyncFunc(); //async method
  print("end");
}

// async function
// Future - failed success or pending state 
// Function defined with async keyword and it will return Future object
// 
  Future asyncFunc()async{
    return Future.delayed(Duration(seconds: 6),()=>print("mid"));
  }

int sum(int a, int b) => a + b; // List => Map = Set = data manipulation

// sync function
// A synchronous function executes line after line
// program flow will move to next line until current line is resolved or completed
void syncFunction(){
  for(int i=0;i<2000000000;i++){
  }
  print("Function ran");
}