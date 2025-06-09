import 'dart:io';
import 'package:http/http.dart' as http;

const String _filePath = "text.txt";
void main(List<String> args) {
  createFile();
  // read();
  // add("Bye flutter");
  // deleteFile();
}
// ./file_op/exx1.dart = path
// CRUD = CREATE READ UPDATE DELETE

// create
void createFile(){
  final File file = File(_filePath);
  file.create(recursive: true);
}
// read
void read()async{
  final File file = File(_filePath);
  print(await file.readAsString());// hello flutter
}
// update
void add(String content){
    final File file = File(_filePath);
    file.writeAsString(content, mode: FileMode.append);// bye flutter
}
// delete
void deleteFile(){
  final File file = File(_filePath);
  file.deleteSync();
}