import 'dart:io';
void main(){
  performTask();
}
void performTask()async{
  task1();
  String task2results = await  task2();
  task3(task2results);
}
void task1(){
  String result = 'task 1 data';
  print("Task 1 complete");
}
Future <String> task2() async{
  Duration threeSec = Duration(seconds: 3);
  String result = await Future.delayed(threeSec, (){
    print("Taks 2 complete");
    return 'task2Data';
  });
  
  return result;
}
void task3(String task2Data){
  String result = 'task 3 complete';
  print("Task 3 complete with $task2Data");
}