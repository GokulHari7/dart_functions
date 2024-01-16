
 /*note:function overloading  is absent in dart. Therefore we cannot use  fns having same names with different argument or return type. */
Future<void> main() async{  //main fn is converted to a future fn inorder to await summ function only
  sum();
  sumparams(2,6);
  int c=sumReturn(5,9);
  print(c);
  sumReq(firstNumber:100, secondNumber:200);
  sumOpt(number1:10, number2:6,number3:30);
  sumFunction(23,24,sumparams);

  anonymousfn(500,600, (int x, int y){ 
                            print('sum of anonymous fn=${x+y}');
                           }
             );

  sumFuture(770,7);
  print('after sumfuture');

  await summ();
  print('after future2');
}

void sum(){
  print(2+3);
}

void sumparams(int a, int b){
  print('${a+b}');
}

int sumReturn(int a ,int b){

  return a+b;
}

//PGM2 
void sumReq({ required int firstNumber,required int secondNumber,int? thirdNumber}){
  /*named parameters are kept inside curly braces seperately. 
  Now here the value of thirdnumber is null.But int value cannot become null.
  therefore we use question mark after int which means the value can or cannot be null  */
  print(firstNumber+secondNumber);
  print(thirdNumber); 
}

void sumOpt({int? number1, int? number2, int number3=0}){
  print(number1!+number2!+number3);  //this is not possible which shows error but y ? check it.Ya checked it, its possible by putting  a null check for number1 and number2 because we are not sure about their values.They can be null.
  print(number3); 
  print(number1);
  print(number2);
}
 
//PGM3 PASSING FUNCTION AS ARGUMENT
void sumFunction(int a, int b, void Function(int, int) costumSum){ /*costumSum is the name of the fn that we
 have given inorder to recieve and call the fn which is coming as argument (or aycha functione recieve cheyth 
 call cheyaan nmml ivde indaki vecha fn aanu costumSum) */
  costumSum(a,b); //here when costumSum fn is called, sumparams fn gets called.
}

//PGM4 ANONYMOUS FUNCTON
void anonymousfn(int a, int b, void Function(int,int) anonyy){
  anonyy(a,b);
}

//PGM5 FUTURE FUNCTION
  /*future fn is used for tasks to do or a heavy time consuming process. If we use it, it gets work by 
  taking its own time without wasting the time of remaining code. remaining part of the code gets 
  excecuted without giving any delay and the result of the future function gets printed after it gets finished */
Future<void> sumFuture(int a,int b) async{  //here Future and async are defined keywords to mention future function. <void> means fn  of void.
  await Future.delayed(Duration(seconds:3)); //here we puposfully gave the delay inorder to make the process of the function time consuming
  print('Sum Future ${a+b}');
  
}

Future<void> summ() async{ //aboove future fn is called inside this future fn
  await sumFuture(50,50); //await is used to wait till the work finish and not to print or work the next line.ALSO await can only be used for future function only.
  print('In just Sum');
}
