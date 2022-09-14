import 'package:flutter/material.dart';

class TeachersProfile extends StatefulWidget {
  TeachersProfile({Key? key, required this.setSubPageId}) : super(key: key);

  final Function(int value) setSubPageId;

  @override
  State<TeachersProfile> createState() => _TeachersProfileState();
}

class _TeachersProfileState extends State<TeachersProfile>{

  bool classesActive = false;
  bool exercisesActive = false;

  void toggleClassesActive(){
    setState(() {
      classesActive = !classesActive;
    });
  }

  void toggleExercisesActive(){
    setState(() {
      exercisesActive = !exercisesActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildProfileView(context);
  }

  // Builds the main content items
  _buildProfileView(BuildContext context){
    double screenSize = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              _buildHead(),

              SizedBox(height: 30,),

              _buildClassesDropdown(),

              classesActive? _buildClassesActive():Container(),

              _buildPendingExercisesDropdown(),

              exercisesActive ? _buildExerciseActive():Container(),

            ]
        )
    );
  }

  // Builds Flag, Profile Pic, Name, And the two metric rows
  Widget _buildHead(){
    return Column(
      children: [
        Stack(
          children: [
            Image.asset("assets/images/colombia2.png"),
            const SizedBox(height: 70.0),
            const Padding(
              padding: EdgeInsets.only(left:120, top: 30),
              child: CircleAvatar(
                backgroundImage: AssetImage( "assets/images/teacher1.png"),
                radius: 80.0,
              ),
            )
          ],
        ),
        SizedBox(height: 30.0),
        const Text(
          "Amalia Carcasonne",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 30.0,
          ),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 20.0),
            Column(
              children: const [
                Text(
                  "29",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Following",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
            Column(
              children: const [
                Text(
                  "121.9k",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Followers",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            Column(
              children: const [
                Text(
                  "7.5M",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Like",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            SizedBox(width: 20.0),
          ],
        ),
      ],
    );
  }

  Widget _buildClassesDropdown(){
    return GestureDetector(
      onTap: ()=>toggleClassesActive(),
      child: Card(
          child:Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child:ListTile(
                      title: Text("Classes",
                        style: TextStyle(fontSize: 20),
                      ),
                    ), // <-- Wrapped in Expanded.
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: classesActive ?
                    Icon(Icons.arrow_drop_up_sharp)
                        : Icon(Icons.arrow_drop_down_sharp),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }

  Widget _buildPendingExercisesDropdown(){
    return GestureDetector(
      onTap: ()=>toggleExercisesActive(),
      child: Card(
          child:Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child:ListTile(
                      title: Text("Pending Exercises",
                        style: TextStyle(fontSize: 20),
                      ),
                    ), // <-- Wrapped in Expanded.
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: exercisesActive ?
                    Icon(Icons.arrow_drop_up_sharp)
                        : Icon(Icons.arrow_drop_down_sharp),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }

  Widget _buildExerciseActive(){
    var titleDummies = ["Linear Algebra", "Gerundio", "Exponential Function"];
    var subTitleDummies = ["Class: 8a", "Class: 9b", "Class: 6a"];
    var iconsDummies = [Icons.percent_outlined, Icons.language,Icons.percent_outlined];
    var colorsDummies = [Colors.blue, Colors.yellow, Colors.blue];

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, i) {
          return _buildClassCard(titleDummies[i], subTitleDummies[i],
              iconsDummies[i], colorsDummies[i]);
        }
    );
  }

  Widget _buildClassesActive(){

    var titleDummies = ["8a", "9b", "6a"];
    var subTitleDummies = ["Mathematics", "Spanish", "Mathematics"];
    var iconsDummies = [Icons.percent_outlined, Icons.language,Icons.percent_outlined];
    var colorsDummies = [Colors.blue, Colors.yellow, Colors.blue];

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, i) {
          return _buildClassCard(titleDummies[i], subTitleDummies[i],
              iconsDummies[i], colorsDummies[i]);
        }
    );
  }

  Widget _buildClassCard(String title, String subTitle,IconData icon, Color color){
    return GestureDetector(
        onTap: () => widget.setSubPageId(6),
    child: Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top:2, bottom: 2),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(icon, color: color),
              title: Text(title, style: TextStyle(fontSize: 20),),
              subtitle: Text(subTitle),
            )
          ],
        ),
      ),
    )
    );
  }
}
