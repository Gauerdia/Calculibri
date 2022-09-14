import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';

class RessourceDetail extends StatelessWidget {
  RessourceDetail({Key? key, required this.setSubPageId, required this.ressourceName,required this.toggleTeacher,
    required this.teacher, required this.comments, required this.commentIds,
    required this.addComment, required this.addEquation, required this.editEquation,
    required this.equationStepsLeft, required this.equationStepsRight,
    required this.editExerciseName, required this.editExerciseExplanation,
    required this.submitExercise, required this.linEq, required this.removeEquation})
      : super(key: key);

  final Function(String formula1, String formula2) addEquation;
  final Function(String formula1, String formula2, int id) editEquation;
  final Function(String value, int id) addComment;
  final Function(String value) editExerciseName;
  final Function(String value) editExerciseExplanation;
  final Function(int id) removeEquation;
  final Function() submitExercise;

  final bool linEq;

  String ressourceName = "Linear Equation - 01";
  String ressoureExercise = "Find the value of x.";

  final VoidCallback toggleTeacher;
  final bool teacher;
  late Size screenSize;
  List<Widget> equationWidgets = [];

  List<String> equationStepsLeft = ["ln(x)"];
  List<String> equationStepsRight = ["6x^2 + 34x + 3"];

  List<String> comments;
  List<int> commentIds;
  final Function(int value) setSubPageId;

  _buildEqWidgets(BuildContext context){

    double width = MediaQuery.of(context).size.width;

    if(equationWidgets.length < equationStepsLeft.length){
      for(var i=0;i<equationStepsLeft.length;i++){

        late var _expressionControllerLeft;
        late var _expressionControllerRight;

        if(equationStepsLeft[i].isNotEmpty){
          _expressionControllerLeft = MathFieldEditedEditingController()
            ..updateValue(Parser().parse(equationStepsLeft[i]));
        }else{
          _expressionControllerLeft = MathFieldEditedEditingController()
            ..updateValue(Parser().parse("0"));
        }

        if(equationStepsRight[i].isNotEmpty){
          _expressionControllerRight = MathFieldEditedEditingController()
            ..updateValue(Parser().parse(equationStepsRight[i]));
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
              if(equationStepsLeft[i].isNotEmpty){
                leftValue = equationStepsLeft[i];
              }
              if(equationStepsRight[i].isNotEmpty){
                rightValue = equationStepsRight[i];
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
        equationWidgets.add(mathItem);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    _buildEqWidgets(context);

    return _buildScrollView(context);
  }

  Widget _buildScrollView(context){

    double screenSize = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              child: Text("Equations",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),

          // Render all Eq steps
          for(var widget in equationWidgets)widget,

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

}
