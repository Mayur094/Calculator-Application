import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Project1_Calculator',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  //Storing The Index of Buttons
  int? valueIndex;

  double num1 = 0;
  double num2 = 0;

  //Storing The Text to Display
  List<String> text3 = [];
  String text2 = '';
  String text1 = '';
  List<String> text = [];

  void display(int? valueIndex){
    switch(valueIndex){
      case 0 :    text3.clear();
                  text2 = '';
                  text1 = '';
                  text.clear();
               break;
      case 1 : if(text[0] == '-'){
                  text.removeAt(0);
               }
               else{
                  text.insert(0,'-');
               }
               break;
      case 4 : text.add('7');break;
      case 5 : text.add('8');break;
      case 6 : text.add('9');break;
      case 8 : text.add('4');break;
      case 9 : text.add('5');break;
      case 10 : text.add('6');break;
      case 12 : text.add('1');break;
      case 13 : text.add('2');break;
      case 14 : text.add('3');break;
    }
  }

  @override
  Widget build(BuildContext context){
    RichText plusSup = RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Transform.translate(
              offset: Offset(0, -8),
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          TextSpan(text: "/",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold,)),
          WidgetSpan(
              child: Transform.translate(offset: Offset(0,8),
                child: Text('-',style: TextStyle(
                  color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold,),),
              )
          ),
        ]
      ),
    );
    List<Widget> calc = [
      Text('AC',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
      plusSup,
      Text('%',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('/',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('7',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('8',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('9',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('X',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('4',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('5',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('6',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('-',style: TextStyle(fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('1',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('2',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('3',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold)),
      Text('+',style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold)),
    ];

    //Main AppBar and Body
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF1838ed),
        leading: Icon(Icons.calculate),
      ),
      body: SafeArea(
          child: Padding(padding: EdgeInsets.all(10),
          child: Column(
            children: [
              //Container 1 in Result field
              Flexible(
                flex: 1,
                child:Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    text3.join(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              //Container 2 in Result field
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    text2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              //Container 3 in Result field
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    text1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              //Container 4 in Result field
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    text.join(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 Columns
                  crossAxisSpacing: 10, // Spaces between Columns
                  mainAxisSpacing: 10,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 16,
                itemBuilder: (context,index){
                  return Material(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          if(index == 15 || index == 11 || index == 7 || index == 3 || index == 2){
                            text2 = text.join().toString();
                            text.clear();
                            switch(index){
                              case 15: text1 = '+';break;
                              case 11: text1 = '-';break;
                              case 7: text1 = 'X';break;
                              case 3: text1 = '÷';break;
                              case 2: text1 = '%';break;
                            };
                          }
                          valueIndex = index;
                          display(valueIndex);
                        });
                      },
                      splashColor: Colors.deepOrange,
                      child: Ink(
                        color: Color(0xFf3753f0),
                        child: Center(
                          child: calc[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFf3753f0),
                        ),
                        child: Material(
                          child: InkWell(
                            onTap:(){
                              setState(() {
                                text.add('0');
                              });
                            },
                            splashColor: Colors.deepOrange,
                            child: Ink(
                              color: Color(0xFf3753f0),
                              child: Center(
                                child: Text('0',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Color(0xFf3753f0),
                        child: Material(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                text.add('.');
                              });
                            },
                            splashColor: Colors.deepOrange,
                            child: Ink(
                              color: Color(0xFf3753f0),
                              child: Center(
                                child : Text('.',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      child: Container(
                        color: Color(0xFf3753f0),
                        child: Material(
                            child: InkWell(
                            onTap: (){
                              setState(() {
                                num1 = double.parse(text2);
                                num2 = double.parse(text.join());

                                if(text1 == '+'){
                                  text.clear();
                                  text1 = '';
                                  text2 = '';
                                  text.add((num1 + num2).toString());
                                }
                                else if(text1 == '-'){
                                  text.clear();
                                  text1 = '';
                                  text2 = '';
                                  text.add((num1 - num2).toString());
                                }
                                else if(text1 == 'X'){
                                  text.clear();
                                  text1 = '';
                                  text2 = '';
                                  text.add((num1 * num2).toString());
                                }
                                else if(text1 == '%'){
                                  text.clear();
                                  text1 = '';
                                  text2 = '';
                                  text.add((num1 % num2).toString());
                                }
                                else if(text1 == '÷'){
                                  String temp = text.join();
                                  if(temp == '0' || text2 == '0') {
                                    text.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Center(
                                          child: Text('Can\'t Divided by Zero',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                        margin: EdgeInsets.all(80),
                                        // padding: EdgeInsets.all(40),
                                        backgroundColor: Colors.black,
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  }
                                  else{
                                    text.clear();
                                    text1 = '';
                                    text2 = '';
                                    text.add((num1 / num2).toString());
                                  }
                                }
                              });
                            },
                            splashColor: Colors.deepOrange,
                            child: Ink(
                              color: Color(0xFf3753f0),
                              child: Center(
                                child : Text('=',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
                              ),
                            ),
                          )
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}