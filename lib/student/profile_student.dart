import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return _buildProfileView(context);
  }

  _buildProfileView(BuildContext context){
    double screenSize = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 70.0),
              const CircleAvatar(
                backgroundImage: AssetImage( "assets/images/student1.png"),
                radius: 80.0,
              ),
              SizedBox(height: 20.0),
              const Text(
                "Richard Burtons",
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
                        "121",
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
                        "342",
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
                        "456",
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

              Container(
                width: screenSize,
                child: Padding(
                  padding: EdgeInsets.only(left:16, top: 16),
                  child: Text("Classes", style: TextStyle(fontSize:20),),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 8, right: 8, top:8, bottom: 2),
                child: Card(
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.percent_outlined, color: Colors.blue,),
                        title: Text("Mathematics"),
                        subtitle: Text("Mrs. González"),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 8, right: 8, top:2, bottom: 2),
                child: Card(
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.language, color: Colors.red,),
                        title: Text("English"),
                        subtitle: Text("Mr. Smith"),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 8, right: 8, top:2, bottom: 2),
                child: Card(
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.language, color: Colors.yellowAccent,),
                        title: Text("Spanish"),
                        subtitle: Text("Mr. Suarez"),
                      )
                    ],
                  ),
                ),
              )

            ]
        )
    );
  }
}
