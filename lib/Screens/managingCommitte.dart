import 'package:flutter/material.dart';
import '../Models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Main Stateful Widget Start
// ignore: camel_case_types
class managingCommitteScreen extends StatefulWidget {
  final String id;
  final List<Person> managingCommitte = [];

  managingCommitteScreen({
    required this.id,
  });

  @override
  _managingCommitteScreenState createState() => _managingCommitteScreenState(
        id: this.id,
      );
}

class _managingCommitteScreenState extends State<managingCommitteScreen> {
  // Title List Here
  final String id;
  final List<Person> managingCommitte = [];

  _managingCommitteScreenState({
    required this.id,
  });

  Future<void> getcommitte() async {
    await FirebaseFirestore.instance
        .collection(id)
        .doc('ManagingCommitte')
        .collection('ManagingCommitte')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var id = doc["id"];
        var name = doc["name"];
        var position = doc["position"];
        Person p = new Person(id: id, name: name, position: position);
        managingCommitte.add(p);
      });
      managingCommitte
          .sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: getcommitte(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          double width = MediaQuery.of(context).size.width * 0.6;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                "Managing Committe",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            // Main List View With Builder
            body: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: this.managingCommitte.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // This Will Call When User Click On ListView Item
                    showDialogFunc(context, this.managingCommitte[index].name,
                        this.managingCommitte[index].position);
                  },
                  // Card Which Holds Layout Of ListView Item
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          width: 80,
                          height: 80,
                          child:
                              Image.asset('assets/images/managingCommitte.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                this.managingCommitte[index].name,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: width,
                                child: Text(
                                  this.managingCommitte[index].position,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }
// MediaQuery to get Device Width

}

// This is a block of Model Dialog
showDialogFunc(context, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'assets/images/managingCommitte.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
