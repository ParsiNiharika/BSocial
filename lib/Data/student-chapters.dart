import '../Models/model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
var index=0;
List<StudentChapter> StudentChapter_Data =  [];


 Future<void> getStudentChapters() async {
  var index=0;
  await FirebaseFirestore.instance
      .collection('StudentChapters')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      var id = doc["id"];
      var imageUrl = doc["imageUrl"];
      var description = doc["description"];
      var title=doc["title"];
      List<String> gallery=doc["gallery"].cast<String>();
      var registrationLink=doc["registrationLink"];
      List<String> contactUs=doc["contactUs"].cast<String>();
      List<String> events=doc["events"].cast<String>();

      StudentChapter s = new StudentChapter(events: events,id: id, title: title, description: description,imageUrl: imageUrl,gallery: gallery,registrationLink: registrationLink,contactUs: contactUs);
      StudentChapter_Data.add(s);
    });
  });
}


