import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:school_app_1/student/exercise_detail.dart';
import 'package:school_app_1/student/exercises_overview.dart';
import 'package:school_app_1/student/profile_student.dart';
import 'package:school_app_1/teacher/class_details.dart';
import 'package:school_app_1/teacher/classes_overview.dart';
import 'package:school_app_1/teacher/marketplace.dart';
import 'package:school_app_1/teacher/messages_teacher.dart';
import 'package:school_app_1/teacher/new_exercise_languages.dart';
import 'package:school_app_1/teacher/new_exercise_math.dart';
import 'package:school_app_1/teacher/own_ressources.dart';
import 'package:school_app_1/teacher/profile_teacher.dart';
import 'package:school_app_1/teacher/ressource_detail.dart';
import 'package:school_app_1/teacher/student_details.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// Main function that starts the main application
void main() {
  runApp(spinalApp());
}

// Widget that sets the localization and the theme
class spinalApp extends StatelessWidget {
  const spinalApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School App 1',
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: mainApp(),
    );
  }
}

// The main app with the view and the crucial variables
class mainApp extends StatefulWidget {
  const mainApp({Key? key}) : super(key: key);

  @override
  State<mainApp> createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {


  String appBarTitle = "Profile";

  List<String> comments = [];
  List<int> commentsIds = [];

  List<String> _equationStepsLeft = [];
  List<String> _equationStepsRight = [];

  List<String> _ressourceDetailEquationStepsLeft = ["ln(x)"];
  List<String> _ressourceDetailEquationStepsRight = ["((x^2.0) + (2.718281828459045 * x))"];

  String _exerciseName = "";
  String _exerciseExplanation = "";

  String exerciseType = "Please select a type";
  int exerciseTypeId = 0;

  // Toggles between teacher view and student view
  var teacher = true;
  // Depending on this Id, the different pages will be displayed
  var subPageId = 0;

  // Does nothing right now. But maybe later we dont want all the
  // math exercises to be linear equations
  bool linEq = true;

  // While working on a exercise we switch between the exercise and the
  // material
  bool showMaterial = false;

  // The item that toggles teacher/student
  late PopupMenuItem popItem;

  late List<ListTile> _teacherDrawItems;
  late List<ListTile> _studentDrawItems;

  void _buildTitle(){
    if(teacher){
      popItem = const PopupMenuItem(
          value: "Student",
          child: Text("Student")
      );
    }else{
      popItem = const PopupMenuItem(
          value: "Teacher",
          child: Text("Teacher")
      );
    }
  }



  @override
  Widget build(BuildContext context) {

    _teacherDrawItems = initTeacherDrawItems();
    _studentDrawItems = initStudentDrawItems();

    _buildTitle();

    return _buildScaffold(_teacherDrawItems, _studentDrawItems);
  }

  Widget _buildScaffold(_teacherDrawItems, _studentDrawItems){
    if(!teacher && subPageId == 2){
      return Scaffold(
        appBar: _buildAppBar(),
        drawer: _buildDrawer(_teacherDrawItems, _studentDrawItems),
        body: selectPage(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _toggleShowMaterial();
          },
          backgroundColor: Colors.white70,
          child: const Icon(FontAwesomeIcons.artstation),
        ),
      );
    }else{
      return Scaffold(
        appBar: _buildAppBar(),
        drawer: _buildDrawer(_teacherDrawItems, _studentDrawItems),
        body: selectPage(),
      );
    }
  }

  // Widget _buildView(){
  //   return selectPage();
  // }

  void setAppBarTitle(String value){
    appBarTitle = value;
  }

  void setSubPageId(int value){
    setState(() {
      subPageId = value;
      if(teacher){
        switch(value){
          case 1:setAppBarTitle("Classes");break;
          case 2:setAppBarTitle("Ressources");break;
          case 3: setAppBarTitle("Marketplace");break;
          case 4:setAppBarTitle("New math exercise");break;
          case 5: setAppBarTitle("New language exercise");break;
          case 6: setAppBarTitle("Class Details"); break;
          case 7: setAppBarTitle("Student Overview"); break;
          case 8: setAppBarTitle("Ressource"); break;
          case 9: setAppBarTitle("Messages"); break;
          case 0:setAppBarTitle("Profile");break;
        }
      }else{
        switch(value){
          case 1:setAppBarTitle("Exercise Overview");break;
          case 2: setAppBarTitle("Work on Exercise");break;
          case 0:
          default: setAppBarTitle("Profile");break;
        }
      }
    });
  }

  Widget selectPage(){
    late var page;
    if(teacher){
      switch(subPageId){
        case 1:
          page = ClassesOverview(setSubPageId: setSubPageId,);
          break;
        case 2:
          page = OwnRessources(setSubPageId: setSubPageId,);
          break;
        case 3:
          page = Marketplace();
          break;
        case 4:
          page = NewExerciseMath(toggleTeacher:toggleTeacher, teacher: teacher,
            comments: comments, addComment: addComment,
            addEquation: addEquation, commentIds: commentsIds, equationStepsLeft: _equationStepsLeft,
            editEquation: editEquation, editExerciseName: editExerciseName, equationStepsRight: _equationStepsRight,
            editExerciseExplanation: editExerciseExplanation, submitExercise: submitExercise, linEq: linEq,
            removeEquation: removeEquation);
          break;
        case 5:
          page = NewExerciseLanguages();
          break;
        case 6:
          page = ClassDetails(setSubPageId:setSubPageId);
          break;
        case 7:
          page = StudentDetails();
          break;
        case 8:
          page = RessourceDetail(setSubPageId:setSubPageId, ressourceName:"Linear Equation - 01",toggleTeacher:toggleTeacher, teacher: teacher,
              comments: comments, addComment: addComment,
              addEquation: addEquation, commentIds: commentsIds, equationStepsLeft: _ressourceDetailEquationStepsLeft,
              editEquation: editEquation, editExerciseName: editExerciseName, equationStepsRight: _ressourceDetailEquationStepsRight,
              editExerciseExplanation: editExerciseExplanation, submitExercise: submitExercise, linEq: linEq,
              removeEquation: removeEquation);
          break;
        case 9:
          page = MessagesTeacher(setSubPageId:setSubPageId);
          break;
        case 0:
        default:
          page = TeachersProfile(setSubPageId: setSubPageId,);
          break;
      }
    }else{
      switch(subPageId){
        case 1:
          page = ExercisesOverview(toggleTeacher: toggleTeacher, teacher: teacher);
          break;
        case 2:
          page = ExerciseDetail(toggleMaterial:_toggleShowMaterial, showMaterial: showMaterial,);
          break;
        case 0:
        default:
          page = const StudentProfile();
          break;
      }
    }
    return page;
  }

  void _toggleShowMaterial(){
    setState(() {
      showMaterial = !showMaterial;
    });
  }

  void toggleTeacher(){
    setState((){teacher = !teacher;subPageId=0;});
  }

  void addComment(String value, int id){

    final index1 = this.commentsIds.indexWhere((element) => element == id);
    if (index1 == -1) {
      setState((){comments.add(value);commentsIds.add(id);});
    }else{
      setState((){comments[index1] = value;});
    }


  }

  void addEquation(String formula1, String formula2) {
    setState(() {
      _equationStepsLeft.add(formula1);
      _equationStepsRight.add(formula2);
    });
  }

  void editEquation(String formula1,String formula2, int id){
    setState(() {
      _equationStepsLeft[id] = formula1;
      _equationStepsRight[id] = formula2;
    });
  }

  void removeEquation(int id){
    setState(() {
      _equationStepsLeft.removeAt(id);
      _equationStepsRight.removeAt(id);
    });
  }

  void editExerciseName(String value){
    _exerciseName = value;
  }

  void editExerciseExplanation(String value){
    _exerciseExplanation = value;
  }

  void submitExercise(){
    print("Name " + _exerciseName);
    print("Exercise " + _exerciseExplanation);
    print("Steps " + _equationStepsLeft.toString() + " = " + _equationStepsRight.toString());
  }

  setExerciseType(String value, int index){
    setState(() {
      exerciseType = value;
      exerciseTypeId = index;
    });
  }

  AppBar _buildAppBar(){
    return AppBar(
      title: Text(appBarTitle),
      actions: [
        GestureDetector(
          onTap: ()=>setSubPageId(9),
          child: Icon(Icons.message_outlined),
        ),
        PopupMenuButton(
            onSelected: (newValue) {
              toggleTeacher();
              print("onSelect");
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              popItem
            ]
        )
      ],
    );
  }

  Drawer _buildDrawer(List<ListTile> _teacherDrawItems,List<ListTile> _studentDrawItems){
    return Drawer(
      child: ListView.builder(
        itemCount: teacher? _teacherDrawItems.length+1 : _studentDrawItems.length+1,
        itemBuilder: (context, i) {
          if(i==0){
            return const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  matchTextDirection: true,
                  repeat: ImageRepeat.noRepeat,
                  image: AssetImage("assets/images/logo1.png"),
                )
              ),
              child: Text("")
            );
          }else{
            return teacher? _teacherDrawItems[i-1] : _studentDrawItems[i-1];
          }
        },
      )
    );
  }

  List<ListTile> initTeacherDrawItems(){
    return [
      ListTile(leading:Icon(Icons.home),title: Text("Profile"),
          onTap:(){
            setSubPageId(0);
            Navigator.of(context).pop();}),
      ListTile(leading: Icon(Icons.school),title: Text("Classes"),onTap:(){
        setSubPageId(1);
        Navigator.of(context).pop();}),
      ListTile(leading: Icon(Icons.warehouse),title: Text("Ressources"),onTap:(){
        setSubPageId(2);
        Navigator.of(context).pop();}),
      ListTile(leading: Icon(Icons.house),title: Text("Marketplace"),onTap:(){
        setSubPageId(3);
        Navigator.of(context).pop();}),
      ListTile(leading: Icon(Icons.percent),title: Text("New Math Exercise"),onTap:(){
        setSubPageId(4);
        Navigator.of(context).pop();}),
      ListTile(leading: Icon(Icons.language),title: Text("New Language Exercise"),onTap:(){
        setSubPageId(5);
        Navigator.of(context).pop();}),
    ];
  }
  List<ListTile> initStudentDrawItems(){
    return [
      ListTile(leading:Icon(Icons.home),title: Text("Profile"),onTap:(){
        setSubPageId(0);
        Navigator.of(context).pop();}),
      ListTile(leading: Icon(Icons.task),title: Text("Exercises"),onTap:(){
        setSubPageId(1);
        Navigator.of(context).pop();}),
      ListTile(leading: Icon(Icons.task),title: Text("Test Exercises"),onTap:(){
        setSubPageId(2);
        Navigator.of(context).pop();}),
    ];
  }

}

class DrawerItem{
  final IconData icon;
  final String text;
  final Function() toggle;

  DrawerItem({required this.icon, required this.text, required this.toggle});
}
