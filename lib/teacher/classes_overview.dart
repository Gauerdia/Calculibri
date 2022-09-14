import 'package:flutter/material.dart';

class ClassesOverview extends StatelessWidget {
  ClassesOverview({Key? key, required this.setSubPageId}) : super(key: key);

  final Function(int value) setSubPageId;

  List<StudentClass> studentClassDummy = [
    StudentClass(titleValue: "8a",subTitleValue: "Mathematics", icon: Icons.percent, color: Colors.blue),
    StudentClass(titleValue: "9b",subTitleValue: "Spanish", icon: Icons.language, color: Colors.yellow),
    StudentClass(titleValue: "6a",subTitleValue: "Mathematics", icon: Icons.percent, color: Colors.blue)
  ];

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
                    children: const [
                      Text("Your Classes",
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.filter_list)
                    ],
                  ),
                ),
              ),

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: studentClassDummy.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () => setSubPageId(6),
                    child: _buildClassCard(studentClassDummy[i]),
                  );
                }
              )
            ]
          )
        )
    );
  }

  _buildClassCard(StudentClass studentClass){
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top:2, bottom: 2),
      child: Card(
        child: Column(
          children:[
            ListTile(
              leading: Icon(studentClass.icon, color: studentClass.color,),
              title: Text(studentClass.titleValue, style:TextStyle(fontSize: 20)),
              subtitle: Text(studentClass.subTitleValue, style:TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }

}

class StudentClass{
  final String titleValue;
  final String subTitleValue;
  final IconData icon;
  final Color color;

  StudentClass({required this.titleValue, required this.subTitleValue,
  required this.icon, required this.color});
}