import 'package:flutter/material.dart';
import 'package:school_app_1/charts/class_details_average_grade_chart.dart';
import 'package:school_app_1/charts/class_details_last_exercise_chart.dart';


class ClassDetails extends StatefulWidget {
  ClassDetails({Key? key, required this.setSubPageId}) : super(key: key);

  final Function(int value) setSubPageId;

  @override
  State<ClassDetails> createState() => _ClassDetailsState();
}

class _ClassDetailsState extends State<ClassDetails> {


  final className = "8a";

  bool statisticsActive = false;
  bool studentsActive = false;

  void toggleStatistics(){
    setState(() {
      statisticsActive = !statisticsActive;
    });
  }

  void toggleStudents(){
    setState(() {
      studentsActive = !studentsActive;
    });
  }

  Widget _buildStatisticsDropDown(Size screenSize){
    return statisticsActive ?
        Column(
          children: [
            Container(
              width: screenSize.width,
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 8, top: 8
                ),
                child: Text(
                  "Last exercise",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
              )
            ),
            Container(
              width: screenSize.width,
              child: ClassDetailsLastExerciseChart(),
            ),
            Container(
                width: screenSize.width,
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 8, top: 8
                  ),
                  child: Text(
                    "Average Grade",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
              width: screenSize.width,
              child: ClassDetailsAverageGradeChart(),
            ),
          ],
        )
        : Container();
  }

  Widget _buildStudentsDropDown(Size screnSize){

    List<String> names = ["Tim Postert", "Peter Thiel", "Nancy Pelosi", "Stephanie Garcias",
                          "Britney Peck","Hans Sapei", "Till Phil", "Laura Baum", "Stacy Cabrill",
                          "Tabea Steck"];



    return studentsActive?
    ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, i) {

          var j = i+1;

          if(j>5){
            j = j-5;
          }

          String imagePath = "assets/images/student" + j.toString() + ".png";

          return GestureDetector(
            onTap: () => widget.setSubPageId(7),
            child: Padding(
              padding: EdgeInsets.only(left: 8,right: 8,top:2,bottom:2),
              child: Card(
                child: Column(
                  children: [

                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(imagePath),
                        radius: 20.0,
                      ),
                      title: Text(names[i]),
                      subtitle: Text("Class: 8a"),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    )
        : Container();
  }



  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Container(
        child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [


                  Container(
                    width: screenSize.width,
                    child: Padding(
                      padding: EdgeInsets.only(left:8, top:16, bottom: 16, right:8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Class " + className,
                            style: TextStyle(fontSize: 20),),
                          Icon(Icons.filter_list)
                        ],
                      ),
                    ),
                  ),


                  GestureDetector(
                    onTap: ()=>toggleStatistics(),
                    child: Card(
                        child:Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child:ListTile(
                                    title: Text("Statistics",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ), // <-- Wrapped in Expanded.
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: statisticsActive ?
                                  Icon(Icons.arrow_drop_up_sharp)
                                  : Icon(Icons.arrow_drop_down_sharp),
                                )
                              ],
                            ),
                          ],
                        )
                    ),
                  ),

                  _buildStatisticsDropDown(screenSize),

                  GestureDetector(
                    onTap: () => toggleStudents(),
                    child: Card(
                        child:Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child:ListTile(
                                    title: Text("Students",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ), // <-- Wrapped in Expanded.
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: studentsActive ?
                                  Icon(Icons.arrow_drop_up_sharp)
                                      : Icon(Icons.arrow_drop_down_sharp),
                                )
                              ],
                            ),
                          ],
                        )
                    ),
                  ),

                  _buildStudentsDropDown(screenSize),

                ]
            )
        )
    );
  }
}

