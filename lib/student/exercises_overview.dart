import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:school_app_1/teacher/new_exercise_math.dart';

class ExercisesOverview extends StatelessWidget {
  ExercisesOverview({required this.toggleTeacher, required this.teacher});

  final VoidCallback toggleTeacher;
  final bool teacher;


  final dummy = Exercise(name: "Testname", exercise: "Write something easy.",
  equationStepsLeft: ["ln(2)","sin(3x)"], equationStepsRight: ["4x", "69"]);

  _buildMathField(){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: MathField(
        variables: const ['a', 's', 'c'],
        onChanged: (value) {
          String expression;
          try {
            expression = '${TeXParser(value).parse()}';
          } catch (_) {
            expression = 'invalid input';
          }

          print('input expression: $value\n'
              'converted expression: $expression');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              width: screenSize.width,
              child: Padding(
                padding: EdgeInsets.only(left:8, top:16, bottom: 16, right:8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Available Exercises",
                      style: TextStyle(fontSize: 20),),
                    Icon(Icons.filter_list)
                  ],
                ),
              ),
            ),


            Card(
              child: Column(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      'assets/images/img_3.png',
                      width: screenSize.width,
                      height: 105,
                    ),
                  ),
                  ListTile(
                    leading: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top:6),
                          child: Icon(Icons.percent_outlined,
                            color: Colors.blueAccent,
                          )
                        ),
                        Text("MAT")
                      ],
                    ),
                    title: const Text('Linear Equations - Ex.12',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    subtitle: const Text(
                      'Ex. to dive deeper into linear Eqs',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Padding(
                      padding: EdgeInsets.only(top:0),
                      child: Icon(Icons.sim_card_alert_outlined, color: Colors.redAccent,),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(padding: EdgeInsets.only(left:8),
                        child: Text("Due: 11.09.",
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),
                      ),

                      TextButton(
                        onPressed: (){

                        },
                        child: Text("Start now", style: TextStyle(fontSize: 20),),
                      )
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 8,),

            Card(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      'assets/images/img_6.png',
                      width: screenSize.width,
                      height: 105,
                    ),
                  ),
                  ListTile(
                    leading: Column(
                      children: const [
                        Icon(Icons.language, color: Colors.yellowAccent,),
                        Text("ESP")
                      ],
                    ),
                    title: const Text('Practicar el gerundio',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    subtitle: const Text(
                      'Preparen este ejercicio hasta el viernes',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Icon(Icons.sim_card_alert_outlined, color: Colors.redAccent,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(padding: EdgeInsets.only(left:8),
                        child: Text("Due: 09.09.",
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),
                      ),

                      TextButton(
                        onPressed: (){

                        },
                        child: Text("Start now",style: TextStyle(fontSize: 20),),
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 8,),


            Card(
              child: Column(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      'assets/images/img_7.png',
                      width: screenSize.width,
                      height: 105,
                    ),
                  ),
                  ListTile(
                    leading: Column(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(top:6),
                            child: Icon(Icons.percent_outlined,
                              color: Colors.blueAccent,
                            )
                        ),
                        Text("MAT")
                      ],
                    ),
                    title: const Text('Linear Equations - Ex.11',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    subtitle: const Text(
                      'Ex. to get an idea of lin. eqs',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Icon(Icons.check_box, color: Colors.greenAccent,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      const Padding(padding: EdgeInsets.only(left:8),
                        child: Text("Due: 05.09.",
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),
                      ),

                      TextButton(
                        onPressed: (){

                        },
                        child: Text("Revisit",style: TextStyle(fontSize: 20),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Exercise{

  final String name;
  final String exercise;
  final List<String> equationStepsLeft;
  final List<String> equationStepsRight;

  Exercise({required this.name, required this.exercise, required this.equationStepsRight,
            required this.equationStepsLeft});
}