import 'package:flutter/material.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({Key? key}) : super(key: key);

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {

  List<Ressource> mathDummy = [
    Ressource(titleValue: "Linear Equations - 03",subTitleValue: "Grade 5-6",
    icon: Icons.percent, color: Colors.blue),
    Ressource(titleValue: "Linear Equations - 02",subTitleValue: "Grade 5-6",
        icon: Icons.percent, color: Colors.blue),
    Ressource(titleValue: "Linear Equations - 01",subTitleValue: "Grade 5-6",
        icon: Icons.percent, color: Colors.blue)
  ];

  List<Ressource> spanishDummy = [
    Ressource(titleValue: "Gerundio",subTitleValue: "Grade 5-7",
        icon: Icons.language, color: Colors.yellow),
    Ressource(titleValue: "Los verbos ser y estar",subTitleValue: "Grade 5",
        icon: Icons.language, color: Colors.yellow),
    Ressource(titleValue: "El subjuntivo",subTitleValue: "Grade 7",
        icon: Icons.language, color: Colors.yellow)
  ];

  List<Ressource> englishDummy = [
    Ressource(titleValue: "Present progressive",subTitleValue: "Grade 5-6",
        icon: Icons.language, color: Colors.red),
    Ressource(titleValue: "Past tense",subTitleValue: "Grade 5-6",
        icon: Icons.language, color: Colors.red),
    Ressource(titleValue: "Slang words",subTitleValue: "Grade 8-9",
        icon: Icons.language, color: Colors.red)
  ];

  List<Ressource> geographyDummy = [
    Ressource(titleValue: "Europe",subTitleValue: "Grade 5-6",
        icon: Icons.landscape, color: Colors.brown),
    Ressource(titleValue: "Climate Change",subTitleValue: "Grade 8-9",
        icon: Icons.landscape, color: Colors.brown),
    Ressource(titleValue: "Petroleum",subTitleValue: "Grade 7-8",
        icon: Icons.landscape, color: Colors.brown)
  ];

  List<Ressource> politicsDummy = [
    Ressource(titleValue: "Catalunya",subTitleValue: "Grade 6-7",
        icon: Icons.policy_outlined, color: Colors.green),
    Ressource(titleValue: "Venezuela",subTitleValue: "Grade 7-9",
        icon: Icons.policy_outlined, color: Colors.green),
    Ressource(titleValue: "China",subTitleValue: "Grade 5-7",
        icon: Icons.policy_outlined, color: Colors.green)
  ];

  List<Ressource> sportsDummy = [
    Ressource(titleValue: "Basketball",subTitleValue: "Grade 5-7",
        icon: Icons.sports_baseball, color: Colors.grey),
    Ressource(titleValue: "Athletics",subTitleValue: "Grade 7-9",
        icon: Icons.sports_baseball, color: Colors.grey),
    Ressource(titleValue: "Weight lifting",subTitleValue: "Grade 9-10",
        icon: Icons.sports_baseball, color: Colors.grey)
  ];

  bool mathematicsActive = false;
  bool spanishActive = false;
  bool englishActive = false;
  bool geographyActive = false;
  bool politicsActive = false;
  bool sportsActive = false;

  void toggleMathematics(){
    setState(() {
      mathematicsActive = !mathematicsActive;
    });
  }
  void toggleSpanish(){
    setState(() {
      spanishActive = !spanishActive;
    });
  }
  void toggleEnglish(){
    setState(() {
      englishActive = !englishActive;
    });
  }
  void toggleGeography(){
    setState(() {
      geographyActive = !geographyActive;
    });
  }
  void togglePolitics(){
    setState(() {
      politicsActive = !politicsActive;
    });
  }
  void toggleSports(){
    setState(() {
      sportsActive = !sportsActive;
    });
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
                        children: const [
                          Text("Marketplace",
                            style: TextStyle(fontSize: 20),),
                          Icon(Icons.filter_list)
                        ],
                      ),
                    ),
                  ),

                  _buildSubject(toggleMathematics,mathematicsActive,"Mathematics"),
                  mathematicsActive? _buildSubjectItems(mathDummy) : Container(),
                  _buildSubject(toggleSpanish,spanishActive,"Spanish"),
                  spanishActive ? _buildSubjectItems(spanishDummy) : Container(),
                  _buildSubject(toggleEnglish,englishActive,"English"),
                  englishActive ? _buildSubjectItems(englishDummy) : Container(),
                  _buildSubject(toggleGeography,geographyActive,"Geography"),
                  geographyActive? _buildSubjectItems(geographyDummy) : Container(),
                  _buildSubject(togglePolitics,politicsActive,"Politics"),
                  politicsActive? _buildSubjectItems(politicsDummy) : Container(),
                  _buildSubject(toggleSports,sportsActive,"Sports"),
                  sportsActive? _buildSubjectItems(sportsDummy) : Container(),

                ]
            )
        )
    );
  }


  _buildSubject(Function toggle, bool toggleActive, String name){
    return GestureDetector(
      onTap: ()=>toggle(),
      child: Card(
          child:Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child:ListTile(
                      title: Text(name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ), // <-- Wrapped in Expanded.
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: toggleActive ?
                    const Icon(Icons.arrow_drop_up_sharp)
                        : const Icon(Icons.arrow_drop_down_sharp),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }

  _buildSubjectItems(List<Ressource> dummyItems){
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, i) {
          return _buildRessource(dummyItems[i]);
        }
    );
  }

  _buildRessource(Ressource ressource){
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, top:2, bottom: 2),
      child: Card(
        child: Column(
          children:[
            ListTile(
              leading: Icon(ressource.icon, color: ressource.color,),
              title: Text(ressource.titleValue),
              subtitle: Text(ressource.subTitleValue),
            )
          ],
        ),
      ),
    );
  }

}


class Ressource{
  final String titleValue;
  final String subTitleValue;
  final IconData icon;
  final Color color;

  Ressource({required this.titleValue, required this.subTitleValue,
            required this.icon, required this.color});
}
