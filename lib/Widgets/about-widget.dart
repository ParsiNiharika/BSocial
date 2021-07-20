import 'package:flutter/material.dart';

import '../Models/model.dart';
import '../Screens/managingCommitte.dart';
import '../Screens/actionCommitte.dart';

class About extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  final List<Person> managingCommitte;
  final List<Person> actionCommitte;
  final String registrationLink;
  final List<String> contactUs;

  About(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.description,
      required this.gallery,
      required this.managingCommitte,
      required this.actionCommitte,
      required this.registrationLink,
      required this.contactUs});

  showManagingCommitte(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return managingCommitteScreen(
          title: this.title,
          id: this.id,
          imageUrl: this.imageUrl,
          description: this.description,
          gallery: this.gallery,
          managingCommitte: this.managingCommitte,
          actionCommitte: this.actionCommitte,
          registrationLink: this.registrationLink,
          contactUs: this.contactUs);
    }));
  }

  showActionCommitte(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return actionCommitteScreen(
          title: this.title,
          id: this.id,
          imageUrl: this.imageUrl,
          description: this.description,
          gallery: this.gallery,
          managingCommitte: this.managingCommitte,
          actionCommitte: this.actionCommitte,
          registrationLink: this.registrationLink,
          contactUs: this.contactUs);
    }));
  }

  showRegistrationLink(BuildContext context){
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Registration Link",
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
                      this.registrationLink,
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

showContactUs(BuildContext context){
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Contact Us",
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
                    child:Text(
                      this.contactUs[0],
                      maxLines: 3,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child:Text(
                      this.contactUs[1],
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

  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(25,20,10,0),
                  child: Image.asset(
                    imageUrl,
                    width: 200,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Divider(color: Colors.black38),
                      SizedBox(height: 32),
                      Text(
                        description,
                        maxLines: 100,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 32),
                      Divider(color: Colors.black38),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0,bottom: 32),
                  child: Text(
                    'GALLERY',
                    style: TextStyle(
                      fontSize: 25,
                      color: const Color(0xff47455f),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  height: 250,
                  padding: const EdgeInsets.only(left: 32.0),
                  child: ListView.builder(
                      itemCount: gallery.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                gallery[index],
                                fit: BoxFit.cover,
                              )),
                        );
                      }),
                ),
                SizedBox(height: 32),
                Padding(padding: EdgeInsets.only(left:32,right:32),
                  child: Divider(color: Colors.black38),
                ),
                SizedBox(height: 32),
                Center(
                  child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 250, height: 50),
                    child: ElevatedButton(
                      onPressed: () => showManagingCommitte(context),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          'Managing Committe',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    ),
                ),
                ),
                SizedBox(height: 32),
                Center(
                child: ConstrainedBox(
                   constraints: BoxConstraints.tightFor(width: 250, height: 50),
                  child: ElevatedButton(
                    onPressed: () => showActionCommitte(context),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        'Action Committe',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                  ),
                ),
                ),

                SizedBox(height: 32),
                Center(
                  child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 250, height: 50),
                    child: ElevatedButton(
                      onPressed: () => showRegistrationLink(context),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          'Registration Link',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Center(
                  child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 250, height: 50),
                    child: ElevatedButton(
                      onPressed: () => showContactUs(context),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
