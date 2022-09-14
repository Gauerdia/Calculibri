import 'package:flutter/material.dart';
import 'package:school_app_1/charts/template_chart_2.dart';
import 'package:school_app_1/charts/template_charts.dart';


class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {

  bool statisticsActive = false;
  bool coursesActive = false;
  bool annotationsActive = false;

  void toggleStatistics(){
    setState(() {
      statisticsActive = !statisticsActive;
    });
  }

  void toggleCourses(){
    setState(() {
      coursesActive = !coursesActive;
    });
  }

  void toggleAnnotations(){
    setState(() {
      annotationsActive = !annotationsActive;
    });
  }

  Widget _buildStatisticsDropDown(Size screenSize){
    return statisticsActive ?
    Container(
      width: screenSize.width,
      child: Column(
        children: const [
          LineChartSample2(),
          //SizedBox(height: 40,),
          //LineChartSample1(),
        ],
      )
    )
        : Container();
  }

  Widget _buildCoursesDropDown(Size screenSize){
    return coursesActive ?
        Container(
          child: Column(
            children: [
              _buildRessource("Mathematics", "Mrs Carcasonne", Icons.percent_outlined, Colors.blue),
              _buildRessource("Spanish", "Mrs Gonzales", Icons.language, Colors.yellowAccent),
              _buildRessource("English", "Mr Smith", Icons.business, Colors.red),
              _buildRessource("Geography", "Mr Atlas", Icons.landscape_outlined, Colors.brown)
            ],
          ),
        ) : Container();
  }

  Widget _buildAnnotationsDropDown(Size screenSize){
    return annotationsActive ?
    Container(
      child: Column(
        children: [
          _buildRessource("Mr Smith", "He mentioned he has problems with his parents. Maybe we should keep an eye on that.", Icons.note, Colors.white),
        ],
      ),
    ) : Container();
  }


  Widget _buildHead(){

    return Padding(
      padding: EdgeInsets.only(top: 16, left:8, right:8),
      child: Card(
          color: Colors.grey[600],
          child: const Padding(
            padding: EdgeInsets.only(top:8, left:0,right:8, bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage( "assets/images/student1.png"),
                radius: 50.0,
              ),
              title: Text("Tim Postert"),
              subtitle: Text("Class 8a"),
              trailing: Icon(Icons.more_vert)
            ),
          )
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Container(
        child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  _buildHead(),

                  const SizedBox(height: 20,),

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
                                  padding: const EdgeInsets.only(right: 8),
                                  child: statisticsActive ?
                                  const Icon(Icons.arrow_drop_up_sharp)
                                      : const Icon(Icons.arrow_drop_down_sharp),
                                )
                              ],
                            ),
                          ],
                        )
                    ),
                  ),

                  _buildStatisticsDropDown(screenSize),

                  GestureDetector(
                    onTap: ()=>toggleCourses(),
                    child: Card(
                        child:Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child:ListTile(
                                    title: Text("Courses",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ), // <-- Wrapped in Expanded.
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: coursesActive ?
                                  const Icon(Icons.arrow_drop_up_sharp)
                                      : const Icon(Icons.arrow_drop_down_sharp),
                                )
                              ],
                            ),
                          ],
                        )
                    ),
                  ),

                  _buildCoursesDropDown(screenSize),

                  GestureDetector(
                    onTap: ()=>toggleAnnotations(),
                    child: Card(
                        child:Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child:ListTile(
                                    title: Text("Annotations",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ), // <-- Wrapped in Expanded.
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: annotationsActive ?
                                  const Icon(Icons.arrow_drop_up_sharp)
                                      : const Icon(Icons.arrow_drop_down_sharp),
                                )
                              ],
                            ),
                          ],
                        )
                    ),
                  ),

                  _buildAnnotationsDropDown(screenSize)
                ]
            )
        )
    );
  }


  _buildRessource(String titleValue, String subtitleValue, IconData icon, Color iconColor){
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top:2, bottom: 2),
      child: Card(
        child: Column(
          children:[
            ListTile(
              leading: Icon(icon, color: iconColor,),
              title: Text(titleValue),
              subtitle: Text(subtitleValue),
            )
          ],
        ),
      ),
    );
  }



}