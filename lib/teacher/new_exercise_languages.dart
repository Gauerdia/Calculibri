import 'package:flutter/material.dart';



class NewExerciseLanguages extends StatefulWidget {
  NewExerciseLanguages({Key? key}) : super(key: key);

  @override
  State<NewExerciseLanguages> createState() => _NewExerciseLanguagesState();
}

class _NewExerciseLanguagesState extends State<NewExerciseLanguages> {
  //final Function(String value, int index) setExerciseType;
  // Initial Selected Value
  String exerciseType = "Choose Something";
  int exerciseTypeId = 0;
  String exerciseTypeTitle = "Test";

  // List of items in our dropdown menu
  List<String> list = <String>['Please select a type', 'Gap Text', 'Quiz'];


  List<QuizQuestion> quizQuestions = [];

  late String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: _buildScrollView(context),
    );
  }

  void  setExerciseType(String value, int index){
    setState(() {
      exerciseType = value;
      exerciseTypeId = index;
    });
  }

  Widget _buildScrollView(BuildContext context){

    Size screenSize = MediaQuery.of(context).size;


    exerciseTypeId == 1
        ? exerciseTypeTitle = "Gap Text":
    exerciseTypeId == 2? exerciseTypeTitle = "Quiz"
        : exerciseTypeTitle = "";

    return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              Container(
                width: screenSize.width,
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
                width: screenSize.width,
                child: const Padding(
                  padding: EdgeInsets.only(left:10,top:8),
                  child: Text("Type",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),

              // Dropdown of type
              Container(
                width: screenSize.width,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.white70),
                  underline: Container(
                    height: 2,
                    color: Colors.white70,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                      setExerciseType(value, list.indexOf(value));
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

              // Headline of type
              Container(
                width: screenSize.width,
                child: Padding(
                  padding: EdgeInsets.only(left:8, top: 16),
                  child: Text(exerciseTypeTitle, style: TextStyle(
                      fontSize: 24
                  ),),
                ),
              ),


              for(var question in quizQuestions) exerciseTypeId == 2 ? _buildQuestionCard(context, screenSize, question)
              : Container(),

              // Add Button
              exerciseTypeId == 2 ?Padding(
                padding: EdgeInsets.only(top:20),
                child:GestureDetector(
                  onTap: (){
                    _showDialogAddQuiz(context, screenSize);
                  },
                  child: const Icon(
                      Icons.add_circle_outline_outlined,
                      size: 40
                  ),
                ),
              ):Container(),

              exerciseTypeId != 0 ?GestureDetector(
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
              ):Container(),
            ]
        )
    );
  }

  void onClickSubmitButton(){

  }

  void _showDialogAddElement(BuildContext context){
    String formula1 = "";
    String formula2 = "";

    bool isSwitched = false;

    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Add an equation step'),
          content:Container(
            height:200,
            child: Column(
              children: [
                Center(
                  child: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                )


                // MathField(
                //   variables: const ['x', 'y', 'z'],
                //   onChanged: (value) {
                //     String expression;
                //     try {
                //       expression = '${TeXParser(value).parse()}';
                //     } catch (_) {
                //       expression = 'invalid input';
                //     }
                //
                //     print('input expression: $value\n'
                //         'converted expression: $expression');
                //     formula1 = expression;
                //   },
                // ),
                //
                // linEq ? Padding(
                //     padding: EdgeInsets.only(top:50),
                //     child:Container(
                //       child: Text("="),
                //     )
                // ) : Container(),
                //
                //
                // linEq? MathField(
                //   variables: const ['x', 'y', 'z'],
                //   onChanged: (value) {
                //     String expression;
                //     try {
                //       expression = '${TeXParser(value).parse()}';
                //     } catch (_) {
                //       expression = 'invalid input';
                //     }
                //
                //     print('input expression: $value\n'
                //         'converted expression: $expression');
                //     formula2 = expression;
                //   },
                // ):Container(),
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
                //addEquation(formula1, formula2);
                Navigator.of(context).pop();
              },
              child: Text('Accept'),
            ),
          ],
        )
    );

  }

  void showDialogEditQuiz(BuildContext context, Size screenSize,
      QuizQuestion quizQuestion, int id){

    TextEditingController _questionController = TextEditingController();
    TextEditingController _firstAnswerController = TextEditingController();
    TextEditingController _secondAnswerController = TextEditingController();
    TextEditingController _thirdAnswerController = TextEditingController();

    _questionController.text = quizQuestion.question;
    _firstAnswerController.text = quizQuestion.firstAnswer;
    _secondAnswerController.text = quizQuestion.secondAnswer;
    _thirdAnswerController.text = quizQuestion.thirdAnswer;

    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Add a quiz question'),
          content:Container(
              height:screenSize.height*0.6,
              width: screenSize.width*0.8,
              child: SingleChildScrollView(
                child:Column(
                  children: [
                    Text("Question"),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _questionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: "Question",
                        border: UnderlineInputBorder(),
                        hintText: 'Question',
                      ),
                      onChanged: (value){
                        quizQuestion.setQuestion(value);
                        //_editQuizQuestion(value);
                      },
                    ),
                    SizedBox(height: 40,),
                    Text("Possible Answers"),
                    SizedBox(height: 20,),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: _firstAnswerController,
                      decoration: InputDecoration(
                        labelText: "First Answer",
                        border: UnderlineInputBorder(),
                        hintText: 'First answer',
                      ),
                      onChanged: (value){
                        quizQuestion.setfirstAnswer(value);
                        //_editFirstQuizAnswer(value);
                      },
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: _secondAnswerController,
                      decoration: InputDecoration(
                        labelText: "Second Answer",
                        border: UnderlineInputBorder(),
                        hintText: 'Second Answer',
                      ),
                      onChanged: (value){
                        quizQuestion.setSecondAnswer(value);
                        //_editSecondQuizAnswer(value);
                      },
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: _thirdAnswerController,
                      decoration: InputDecoration(
                        labelText: "Third Answer",
                        border: UnderlineInputBorder(),
                        hintText: 'Third answer',
                      ),
                      onChanged: (value){
                        quizQuestion.setThirdAnswer(value);
                        //_editThirdQuizAnswer(value);
                      },
                    ),
                  ],
                ),
              )
          ),
          actions: [
            TextButton(
              onPressed: () {Navigator.of(context).pop();},
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  quizQuestions[id] = quizQuestion;
                });
                Navigator.of(context).pop();
              },
              child: Text('Accept'),
            ),
          ],
        )
    );
  }

  void _showDialogAddQuiz(BuildContext context, Size screenSize){

    QuizQuestion newQuizQuestion = QuizQuestion();

    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Add a quiz question'),
          content:Container(
            height:screenSize.height*0.6,
            width: screenSize.width*0.8,
            child: SingleChildScrollView(
              child:Column(
                children: [
                  Text("Question"),
                  SizedBox(height: 20,),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Question',
                    ),
                    onChanged: (value){
                      newQuizQuestion.setQuestion(value);
                      //_editQuizQuestion(value);
                    },
                  ),
                  SizedBox(height: 40,),
                  Text("Possible Answers"),
                  SizedBox(height: 20,),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'First answer',
                    ),
                    onChanged: (value){
                      newQuizQuestion.setfirstAnswer(value);
                      //_editFirstQuizAnswer(value);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Second answer',
                    ),
                    onChanged: (value){
                      newQuizQuestion.setSecondAnswer(value);
                      //_editSecondQuizAnswer(value);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Third answer',
                    ),
                    onChanged: (value){
                      newQuizQuestion.setThirdAnswer(value);
                      //_editThirdQuizAnswer(value);
                    },
                  ),
                ],
              ),
            )
          ),
          actions: [
            TextButton(
              onPressed: () {Navigator.of(context).pop();},
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  quizQuestions.add(newQuizQuestion);
                });
                Navigator.of(context).pop();
              },
              child: Text('Accept'),
            ),
          ],
        )
    );
  }

  Widget _buildQuestionCard(BuildContext context, Size screenSize, QuizQuestion quizQuestion){
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 8, top: 4, bottom: 4),
      child:GestureDetector(
        onTap:(){
          showDialogEditQuiz(context, screenSize, quizQuestion, quizQuestions.indexOf(quizQuestion));
        },
        child: Card(
          color: Colors.grey[800],
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DefaultTextStyle.merge(
              style: const TextStyle(
                fontSize: 24,
              ),
              child: Center(
                child: Text(quizQuestion.question),
              ),
            ),
          ),
        ),
      )
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
              child: TextField(
                decoration: const InputDecoration(
                    hintText: "Give the exercise a name"
                ),
                onChanged: (value){
                  //editExerciseName(value);
                },
              ),
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
}

class QuizQuestion{

  String question = "";
  String firstAnswer = "";
  String secondAnswer = "";
  String thirdAnswer = "";

  QuizQuestion();

  void setQuestion(String value){
    this.question = value;
  }
  void setfirstAnswer(String value){
    this.firstAnswer = value;
  }
  void setSecondAnswer(String value){
    this.secondAnswer = value;
  }
  void setThirdAnswer(String value){
    this.thirdAnswer = value;
  }
}



// class NewExerciseLanguages extends StatelessWidget {
//   NewExerciseLanguages({Key? key, required this.exerciseType, required this.setExerciseType,
//     required this.exerciseTypeId
//   }) : super(key: key);
//
//
//   final Function(String value, int index) setExerciseType;
//   // Initial Selected Value
//   String exerciseType;
//   int exerciseTypeId;
//   String exerciseTypeTitle = "";
//
//   // List of items in our dropdown menu
//   var items = [
//     'Please select a type',
//     'Gap Text',
//     'Quiz',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: _buildScrollView(context),
//     );
//   }
//
//
//   Widget _buildScrollView(BuildContext context){
//
//     double screenSize = MediaQuery.of(context).size.width;
//
//     exerciseTypeId == 1
//         ? exerciseTypeTitle = "Gap Text":
//     exerciseTypeId == 2? exerciseTypeTitle = "Quiz"
//         : exerciseTypeTitle = "";
//
//     return SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//
//             Container(
//               width: screenSize,
//               child: const Padding(
//                 padding: EdgeInsets.only(left:10,top:8),
//                 child: Text("Name",
//                   style: TextStyle(
//                     fontSize: 24,
//                   ),
//                 ),
//               ),
//             ),
//
//             _buildNameExercice(),
//
//             Container(
//               width: screenSize,
//               child: const Padding(
//                 padding: EdgeInsets.only(left:10,top:8),
//                 child: Text("Type",
//                   style: TextStyle(
//                     fontSize: 24,
//                   ),
//                 ),
//               ),
//             ),
//
//             Container(
//               width: screenSize,
//               child: DropdownButton(
//                   value: exerciseType,
//                   icon: const Icon(Icons.keyboard_arrow_down),
//                   items: items.map((String items){
//                     return DropdownMenuItem(
//                         value: items,
//                         child: Text(items)
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue){
//                     setExerciseType(newValue!, items.indexOf(newValue));
//                   }),
//             ),
//
//             Container(
//               width: screenSize,
//               child: Padding(
//                 padding: EdgeInsets.only(left:8, top: 16),
//                 child: Text(exerciseTypeTitle, style: TextStyle(
//                   fontSize: 24
//                 ),),
//               ),
//             ),
//
//             Padding(
//               padding: EdgeInsets.only(top:20),
//               child:GestureDetector(
//                 onTap: (){
//                   _showDialogAddElement(context);
//                 },
//                 child: const Icon(
//                     Icons.add_circle_outline_outlined,
//                     size: 40
//                 ),
//               ),
//             ),
//
//
//           ]
//     )
//     );
//   }
//
//   void _showDialogAddElement(BuildContext context){
//     String formula1 = "";
//     String formula2 = "";
//
//     bool isSwitched = false;
//
//     showDialog(
//         context: context,
//         builder: (ctx) => AlertDialog(
//           title: Text('Add an equation step'),
//           content:Container(
//             height:200,
//             child: Column(
//               children: [
//                 Center(
//                   child: Switch(
//                     value: isSwitched,
//                     onChanged: (value) {
//                       setState(() {
//                         isSwitched = value;
//                         print(isSwitched);
//                       });
//                     },
//                     activeTrackColor: Colors.lightGreenAccent,
//                     activeColor: Colors.green,
//                   ),
//                 )
//
//
//                 // MathField(
//                 //   variables: const ['x', 'y', 'z'],
//                 //   onChanged: (value) {
//                 //     String expression;
//                 //     try {
//                 //       expression = '${TeXParser(value).parse()}';
//                 //     } catch (_) {
//                 //       expression = 'invalid input';
//                 //     }
//                 //
//                 //     print('input expression: $value\n'
//                 //         'converted expression: $expression');
//                 //     formula1 = expression;
//                 //   },
//                 // ),
//                 //
//                 // linEq ? Padding(
//                 //     padding: EdgeInsets.only(top:50),
//                 //     child:Container(
//                 //       child: Text("="),
//                 //     )
//                 // ) : Container(),
//                 //
//                 //
//                 // linEq? MathField(
//                 //   variables: const ['x', 'y', 'z'],
//                 //   onChanged: (value) {
//                 //     String expression;
//                 //     try {
//                 //       expression = '${TeXParser(value).parse()}';
//                 //     } catch (_) {
//                 //       expression = 'invalid input';
//                 //     }
//                 //
//                 //     print('input expression: $value\n'
//                 //         'converted expression: $expression');
//                 //     formula2 = expression;
//                 //   },
//                 // ):Container(),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {Navigator.of(context).pop();},
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 if(formula1.isEmpty){
//                   formula1 = "0";
//                 }
//                 if(formula2.isEmpty){
//                   formula2 = "0";
//                 }
//                 //addEquation(formula1, formula2);
//                 Navigator.of(context).pop();
//               },
//               child: Text('Accept'),
//             ),
//           ],
//         )
//     );
//
//   }
//
//   Widget _buildNameExercice(){
//
//     return Padding(
//       padding: const EdgeInsets.all(8),
//       child:Card(
//         color: Colors.grey[800],
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: DefaultTextStyle.merge(
//             style: const TextStyle(
//               fontSize: 24,
//             ),
//             child: Center(
//               child: TextField(
//                 decoration: const InputDecoration(
//                     hintText: "Give the exercise a name"
//                 ),
//                 onChanged: (value){
//                   //editExerciseName(value);
//                 },
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//
//     // return Padding(
//     //   padding: EdgeInsets.only(top:10),
//     //   child:TextField(
//     //     cursorHeight: 20,
//     //     autofocus: false,
//     //     controller: TextEditingController(text: ""),
//     //     decoration: InputDecoration(
//     //       labelText: 'Name the exercise',
//     //       hintText: "Enter a new name",
//     //       prefixIcon: Icon(Icons.add_photo_alternate),
//     //       suffixIcon: Icon(Icons.keyboard_arrow_down),
//     //       contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//     //       border: OutlineInputBorder(
//     //         borderRadius: BorderRadius.circular(20),
//     //         borderSide: BorderSide(color: Colors.grey, width: 2),
//     //       ),
//     //       enabledBorder: OutlineInputBorder(
//     //         borderRadius: BorderRadius.circular(20),
//     //         borderSide: BorderSide(color: Colors.grey, width: 1.5),
//     //       ),
//     //       focusedBorder: OutlineInputBorder(
//     //         gapPadding: 0.0,
//     //         borderRadius: BorderRadius.circular(20),
//     //         borderSide: BorderSide(color: Colors.red, width: 1.5),
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }
