import 'package:flutter/material.dart';

class OwnRessources extends StatelessWidget {
  OwnRessources({Key? key, required this.setSubPageId}) : super(key: key);

  final Function(int value) setSubPageId;

  List<Ressource> studentClassDummy = [
    Ressource(titleValue: "Linear Algebra - 03",subTitleValue: "Mathematics"),
    Ressource(titleValue: "Linear Algebra - 02",subTitleValue: "Mathematics"),
    Ressource(titleValue: "Linear Algebra - 01",subTitleValue: "Mathematics")
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
                          Text("Your Ressources",
                            style: TextStyle(fontSize: 20),),
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
                        return _buildRessource(studentClassDummy[i].titleValue, studentClassDummy[i].subTitleValue);
                      }
                  )
                ]
            )
        )
    );
  }

  _buildRessource(String titleValue, String subtitleValue){
    return GestureDetector(
      onTap: () => setSubPageId(8),
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top:2, bottom: 2),
        child: Card(
          child: Column(
            children:[
              ListTile(
                leading: Icon(Icons.percent_outlined, color: Colors.blue,),
                title: Text(titleValue, style: TextStyle(fontSize: 20),),
                subtitle: Text(subtitleValue),
              )
            ],
          ),
        ),
      ),
    );
  }

}

class Ressource{
  final String titleValue;
  final String subTitleValue;

  Ressource({required this.titleValue, required this.subTitleValue});
}
