import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ExerciseDetail extends StatefulWidget {
  ExerciseDetail({Key? key, required this.toggleMaterial, required this.showMaterial})
      : super(key: key);

  bool showMaterial;

  final Function() toggleMaterial;

  @override
  State<ExerciseDetail> createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {

  bool linEq = true;

  bool addOwnSolution = false;

  String ressourceName = "Linear Equations - 03";
  String ressoureExercise = "Solve the given equation.";

  List<Widget> taskEquationWidgets = [];
  List<String> taskEquationStepsLeft = ["(8.0 * x)"];//["ln(x)"];
  List<String> taskEquationStepsRight = ["16"];//["((x^2.0) + (2.718281828459045 * x))"];

  List<Widget> solutionEquationWidgets = [];
  List<String> solutionEquationStepsLeft = [];
  List<String> solutionEquationStepsRight = [];

  void toggleAddOwnSolution(){
    setState(() {
      addOwnSolution = !addOwnSolution;
    });
  }

  Widget _buildMainTitle(String value){
    return Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: RichText(
            text: TextSpan(
              text: value,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            )
        )
    );
  }
  Widget _buildSubTitle(String value){
    return Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: RichText(
            text: TextSpan(
              text: value,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            )
        )
    );
  }
  Widget _buildNormalText(String value){
    return Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: RichText(
            text: TextSpan(
              text: value,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
        )
    );
  }


  Widget _buildExampleTable(){
    return Table(
      defaultColumnWidth: FixedColumnWidth(180.0),
      border: TableBorder.all(
          color: Colors.black,
          style: BorderStyle.solid,
          width: 2),
      children: [
        TableRow( children: [
          Column(children:const [Padding(
            padding: EdgeInsets.only(top:10, bottom: 10),
            child: Text('Equations', style: TextStyle(fontSize: 20.0)),
          )]),
          Column(children: const[Padding(
            padding: EdgeInsets.only(top:10, bottom: 10),
            child: Text('Linear or non-linear', style: TextStyle(fontSize: 20.0)),
          )]),
        ]),
        TableRow( children: [
          Column(children: const[Padding(
            padding: EdgeInsets.only(top:10, bottom: 10),
            child: Text('y=8x-9', style: TextStyle(fontSize: 20.0)),
          )]),
          Column(children: const[Padding(
            padding: EdgeInsets.only(top:10, bottom: 10),
            child: Text('Linear', style: TextStyle(fontSize: 20.0)),
          )]),
        ]),
        TableRow( children: [
          Column(children: const[Padding(
            padding: EdgeInsets.only(top:10, bottom: 10),
            child: Text('y = x^2 - 7', style: TextStyle(fontSize: 20.0)),
          )]),
          Column(children: const[Padding(
            padding: EdgeInsets.only(top:10, bottom: 10, left:10),
            child: Text('Non-Linear, the power of the variable x is 2', style: TextStyle(fontSize: 20.0)),
          )]),
        ]),
        TableRow( children: [
          Column(children: const[Padding(
            padding: EdgeInsets.only(top:10, bottom: 10),
            child: Text('y+3x-1 = 0', style: TextStyle(fontSize: 20.0)),
          )]),
          Column(children: const[Padding(
            padding: EdgeInsets.only(top:10, bottom: 10),
            child: Text('Linear', style: TextStyle(fontSize: 20.0)),
          )]),
        ]),
      ],
    );
  }

  Widget _buildTestMaterial(){
    double screenSize = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(left:0, top: 16),
            child: Center(
              child: Column(
                children: [

                  SizedBox(height: 10,),

                  _buildMainTitle("Linear Equations"),

                  SizedBox(height: 40,),

                  _buildNormalText("A linear equation is an equation in which the highest power of the variable is always 1. "
                      "It is also known as a one-degree equation. "
                      "The standard form of a linear equation in one variable is of the form Ax + B = 0. "
                      "Here, x is a variable, A is a coefficient and B is constant. "
                      "The standard form of a linear equation in two variables is of the form Ax + By = C. "
                      "Here, x and y are variables, A and B are coefficients and C is a constant."),


                  SizedBox(height: 40,),

                  _buildSubTitle("What is a Linear Equation?"),

                  SizedBox(height: 20,),

                  _buildNormalText("An equation that has the highest degree of 1 is known as a linear equation. "
                      "This means that no variable in a linear equation has an exponent more than 1. "
                      "The graph of a linear equation always forms a straight line."),

                  SizedBox(height: 10,),

                  _buildNormalText("Linear Equation Definition: A linear equation is an algebraic equation where "
                      "each term has an exponent of 1 and when this equation is graphed, it always "
                      "results in a straight line. This is the reason why it is named as a "
                      "'linear equation'."),

                  SizedBox(height: 10,),

                  _buildNormalText("There are linear equations in one variable and linear equations in two variables. "
                      "Let us learn how to identify linear equations and non-linear equations with the "
                      "help of the following examples."),

                  SizedBox(height: 30,),

                  _buildExampleTable(),

                  SizedBox(height: 30,),

                  _buildSubTitle( "Linear Equations in Standard Form"),

                  SizedBox(height: 30,),

                  _buildNormalText("The standard form or the general form of linear equations in one variable is "
                      "written as, Ax + B = 0; where A and B are real numbers, and x is the single variable. "
                      "The standard form of linear equations in two variables is expressed as,"
                      " Ax + By = C; where A, B and C are any real numbers, and x and y are the variables."),

                  SizedBox(height: 30,),


                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child:  Container(
                      color: Colors.white,
                      child: Image.asset("assets/images/lin_eq_1.png"),
                    ),
                  ),


                  SizedBox(height:50,),

                  Text("Links and Ressources",
                  style: TextStyle(fontSize: 20),),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: screenSize,
                      child: Text(
                        ' ',
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                          icon: FaIcon(FontAwesomeIcons.youtube),
                          onPressed: () { print("Pressed"); }
                      ),
                      Text("Video: Linear Equations - Algebra"),
                    ],
                  ),

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                          icon: FaIcon(FontAwesomeIcons.youtube),
                          onPressed: () { print("Pressed"); }
                      ),
                      Text("Video: Linear Equations - Examples"),
                    ],
                  ),

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                          icon: FaIcon(FontAwesomeIcons.link),
                          onPressed: () { print("Pressed"); }
                      ),
                      Text("Link: Linear Equations - Introduction"),
                    ],
                  ),

                  SizedBox(height: 100,)

              ],
              )
              ),
            ),
        ],
      ),
    );
  }

  _buildEqWidgets(BuildContext context){

    double width = MediaQuery.of(context).size.width;

    if(taskEquationWidgets.length < taskEquationStepsLeft.length){
      for(var i=0;i<taskEquationStepsLeft.length;i++){

        late var _expressionControllerLeft;
        late var _expressionControllerRight;

        if(taskEquationStepsLeft[i].isNotEmpty){
          _expressionControllerLeft = MathFieldEditedEditingController()
            ..updateValue(Parser().parse(taskEquationStepsLeft[i]));
        }else{
          _expressionControllerLeft = MathFieldEditedEditingController()
            ..updateValue(Parser().parse("0"));
        }

        if(taskEquationStepsRight[i].isNotEmpty){
          _expressionControllerRight = MathFieldEditedEditingController()
            ..updateValue(Parser().parse(taskEquationStepsRight[i]));
        }else{
          _expressionControllerRight = MathFieldEditedEditingController()
            ..updateValue(Parser().parse("0"));
        }


        var mathItem = Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: GestureDetector(
            onTap: (){
              var leftValue = "0";
              var rightValue = "0";
              if(taskEquationStepsLeft[i].isNotEmpty){
                leftValue = taskEquationStepsLeft[i];
              }
              if(taskEquationStepsRight[i].isNotEmpty){
                rightValue = taskEquationStepsRight[i];
              }
              openEditEquationDialog(context, leftValue, rightValue, i);
            },
            child:Container(
              width: width,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            MathFieldEdited(
                              screenWidth: width,
                              controller: _expressionControllerLeft,
                              decoration: const InputDecoration(
                                filled: true,
                              ),
                            ),

                            Text(" = "),

                            MathFieldEdited(
                              screenWidth: width,
                              controller: _expressionControllerRight,
                              decoration: const InputDecoration(
                                filled: true,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
            ),
          ),
        );
        taskEquationWidgets.add(mathItem);
      }
    }

    solutionEquationWidgets=[];

    print("test1: " + solutionEquationWidgets.length.toString());
    print("test1: " + solutionEquationStepsLeft.length.toString());

    if(solutionEquationWidgets.length < solutionEquationStepsLeft.length){
      for(var i=0;i<solutionEquationStepsLeft.length;i++){

        late var _expressionControllerLeft;
        late var _expressionControllerRight;

        if(solutionEquationStepsLeft[i].isNotEmpty){
          _expressionControllerLeft = MathFieldEditedEditingController()
            ..updateValue(Parser().parse(solutionEquationStepsLeft[i]));
        }else{
          _expressionControllerLeft = MathFieldEditedEditingController()
            ..updateValue(Parser().parse("0"));
        }

        if(solutionEquationStepsRight[i].isNotEmpty){
          _expressionControllerRight = MathFieldEditedEditingController()
            ..updateValue(Parser().parse(solutionEquationStepsRight[i]));
        }else{
          _expressionControllerRight = MathFieldEditedEditingController()
            ..updateValue(Parser().parse("0"));
        }


        var mathItem = Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: GestureDetector(
            onTap: (){
              var leftValue = "0";
              var rightValue = "0";
              if(solutionEquationStepsLeft[i].isNotEmpty){
                leftValue = solutionEquationStepsLeft[i];
              }
              if(solutionEquationStepsRight[i].isNotEmpty){
                rightValue = solutionEquationStepsRight[i];
              }
              openEditEquationDialog(context, leftValue, rightValue, i);
            },
            child:Container(
              width: width,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                  child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            MathFieldEdited(
                              screenWidth: width,
                              controller: _expressionControllerLeft,
                              decoration: const InputDecoration(
                                filled: true,
                              ),
                            ),

                            Text(" = "),

                            MathFieldEdited(
                              screenWidth: width,
                              controller: _expressionControllerRight,
                              decoration: const InputDecoration(
                                filled: true,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
            ),
          ),
        );
        solutionEquationWidgets.add(mathItem);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _buildEqWidgets(context);

    return widget.showMaterial? _buildTestMaterial()
                              :_buildScrollView(context);
  }

  Widget _buildScrollView(context){

    double screenSize = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(

        children: <Widget>[

          Container(
            width: screenSize,
            child: const Padding(
              padding: EdgeInsets.only(left:10,top:8),
              child: Text("Name",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),

          _buildNameExercice(),

          Container(
            width: screenSize,
            child: const Padding(
              padding: EdgeInsets.only(left:10,top:8),
              child: Text("Exercise",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),

          _buildExplainExercise(),

          Container(
            width: screenSize,
            child: const Padding(
              padding: EdgeInsets.only(left:10,top:8),
              child: Text("Given Equations",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),

          // Render all Eq steps
          for(var widget in taskEquationWidgets)widget,

          !addOwnSolution? GestureDetector(
            onTap: ()=>toggleAddOwnSolution(),
            child: addOwnSolutionButton(),
          ) : Container(),

          addOwnSolution? Container(
            width: screenSize,
            child: const Padding(
              padding: EdgeInsets.only(left:10,top:8),
              child: Text("Your Solution",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ) : Container(),

          for(var widget in solutionEquationWidgets) addOwnSolution?widget:Container(),

          addOwnSolution? Padding(
            padding: EdgeInsets.only(top:20),
            child:GestureDetector(
              onTap: (){
                triggerAddEquation(context);
              },
              child: const Icon(
                  Icons.add_circle_outline_outlined,
                  size: 40
              ),
            ),
          )
              : Container(),

          addOwnSolution? GestureDetector(
            onTap: (){
              onClickSubmitButton();
            },
            child: Padding(
                padding: EdgeInsets.only(left:130, right:130, bottom: 10, top:20),
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      border: Border.all(
                          color: Colors.black
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.blue
                        ),
                      ),
                    )
                )
            ),
          ): Container(),

        ],
      ),
    );
  }

  Widget _buildNameExercice(){

    return Padding(
      padding: const EdgeInsets.all(8),
      child:Card(
        color: Colors.grey[800],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DefaultTextStyle.merge(
            style: const TextStyle(
              fontSize: 24,
            ),
            child: Center(
                child: Text(ressourceName)
            ),
          ),
        ),
      ),
    );

    // return Padding(
    //   padding: EdgeInsets.only(top:10),
    //   child:TextField(
    //     cursorHeight: 20,
    //     autofocus: false,
    //     controller: TextEditingController(text: ""),
    //     decoration: InputDecoration(
    //       labelText: 'Name the exercise',
    //       hintText: "Enter a new name",
    //       prefixIcon: Icon(Icons.add_photo_alternate),
    //       suffixIcon: Icon(Icons.keyboard_arrow_down),
    //       contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(20),
    //         borderSide: BorderSide(color: Colors.grey, width: 2),
    //       ),
    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(20),
    //         borderSide: BorderSide(color: Colors.grey, width: 1.5),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         gapPadding: 0.0,
    //         borderRadius: BorderRadius.circular(20),
    //         borderSide: BorderSide(color: Colors.red, width: 1.5),
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget _buildExplainExercise(){

    return Padding(
      padding: const EdgeInsets.all(8),
      child:Card(
        color: Colors.grey[800],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DefaultTextStyle.merge(
            style: const TextStyle(
              fontSize: 24,
            ),
            child: Center(
                child: Text(ressoureExercise)
            ),
          ),
        ),
      ),
    );

    // return Padding(
    //   padding: EdgeInsets.only(top:10),
    //   child:TextField(
    //     cursorHeight: 20,
    //     autofocus: false,
    //     controller: TextEditingController(text: ""),
    //     maxLines: 5,
    //     minLines: 1,
    //     decoration: InputDecoration(
    //       labelText: 'Exercise',
    //       hintText: "Explain the exercise",
    //       prefixIcon: Icon(Icons.add_photo_alternate),
    //       suffixIcon: Icon(Icons.keyboard_arrow_down),
    //       contentPadding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(20),
    //         borderSide: BorderSide(color: Colors.grey, width: 2),
    //       ),
    //       enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(20),
    //         borderSide: BorderSide(color: Colors.grey, width: 1.5),
    //       ),
    //       focusedBorder: OutlineInputBorder(
    //         gapPadding: 0.0,
    //         borderRadius: BorderRadius.circular(20),
    //         borderSide: BorderSide(color: Colors.red, width: 1.5),
    //       ),
    //     ),
    //   ),
    // );
  }

  void openEditEquationDialog(BuildContext context, String formula1, String formula2, int id){

    final _expressionControllerLeft = MathFieldEditingController()
      ..updateValue(Parser().parse(formula1));

    final _expressionControllerRight = MathFieldEditingController()
      ..updateValue(Parser().parse(formula2));

    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Edit an equation'),
          content:Container(
            height:200,
            child: Column(
              children: [
                MathField(
                  controller: _expressionControllerLeft,
                  variables: const ['x', 'y', 'z'],
                  onChanged: (value) {
                    String expression;
                    try {
                      expression = '${TeXParser(value).parse()}';
                    } catch (_) {
                      expression = 'invalid input';
                    }

                    print('input expression: $value\n'
                        'converted expression: $expression');
                    formula1 = expression;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top:50),
                  child: Text("="),
                ),
                MathField(
                  controller: _expressionControllerRight,
                  variables: const ['x', 'y', 'z'],
                  onChanged: (value) {
                    String expression;
                    try {
                      expression = '${TeXParser(value).parse()}';
                    } catch (_) {
                      expression = 'invalid input';
                    }

                    print('input expression: $value\n'
                        'converted expression: $expression');
                    formula2 = expression;
                  },
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right:80),
              child: GestureDetector(
                  onTap: (){
                    removeEquation(id);
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                      Icons.highlight_remove
                  )
              ),
            ),
            TextButton(
              onPressed: () {Navigator.of(context).pop();},
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                editEquation(formula1, formula2, id);
                Navigator.of(context).pop();
              },
              child: Text('Accept'),
            ),
          ],
        )
    );
  }

  triggerAddEquation(BuildContext context){
    //addEquation();
    openAddEquationDialog(context);
  }

  void onClickSubmitButton(){
    submitExercise();
  }

  void openAddEquationDialog(BuildContext context){

    String formula1 = "";
    String formula2 = "";

    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Add an equation step'),
          content:Container(
            height:200,
            child: Column(
              children: [
                MathField(
                  variables: const ['x', 'y', 'z'],
                  onChanged: (value) {
                    String expression;
                    try {
                      expression = '${TeXParser(value).parse()}';
                    } catch (_) {
                      expression = 'invalid input';
                    }

                    print('input expression: $value\n'
                        'converted expression: $expression');
                    formula1 = expression;
                  },
                ),

                linEq ? Padding(
                    padding: EdgeInsets.only(top:50),
                    child:Container(
                      child: Text("="),
                    )
                ) : Container(),


                linEq? MathField(
                  variables: const ['x', 'y', 'z'],
                  onChanged: (value) {
                    String expression;
                    try {
                      expression = '${TeXParser(value).parse()}';
                    } catch (_) {
                      expression = 'invalid input';
                    }

                    print('input expression: $value\n'
                        'converted expression: $expression');
                    formula2 = expression;
                  },
                ):Container(),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {Navigator.of(context).pop();},
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if(formula1.isEmpty){
                  formula1 = "0";
                }
                if(formula2.isEmpty){
                  formula2 = "0";
                }
                addEquation(formula1, formula2);
                Navigator.of(context).pop();
              },
              child: Text('Accept'),
            ),
          ],
        )
    );
  }

  void addEquation(String formula1, String formula2) {
    setState(() {
      solutionEquationStepsLeft.add(formula1);
      solutionEquationStepsRight.add(formula2);
    });
  }

  void editEquation(String formula1,String formula2, int id){
    setState(() {
      solutionEquationStepsLeft[id] = formula1;
      solutionEquationStepsRight[id] = formula2;
    });
  }


  void removeEquation(int id){
    setState(() {
      solutionEquationStepsLeft.removeAt(id);
      solutionEquationStepsRight.removeAt(id);
    });
  }

  submitExercise(){

  }

  Widget addOwnSolutionButton(){
    return Padding(
      padding: const EdgeInsets.all(32),
      child:Card(
        color: Colors.grey[700],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DefaultTextStyle.merge(
            style: const TextStyle(
              fontSize: 24,
            ),
            child: Center(
                child: Text("Add Solution")
            ),
          ),
        ),
      ),
    );
  }

}
