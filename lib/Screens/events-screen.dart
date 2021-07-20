import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/events-model.dart';

import '../Widgets/events-widget.dart';

class EventScreen extends StatelessWidget {
  final String id;
  final List<String> events;
  final List<Events> eventsData = [];

  EventScreen({
    required this.events,
    required this.id
});

  Future<void> getEvents() async {
     await Future.wait(
         events.map((element) async  {
           await FirebaseFirestore.instance
               .collection("Events")
               .doc(element).get()
               .then((DocumentSnapshot doc ) {
             var id = doc["id"];
             var imageUrl = doc["imageUrl"];
             var description = doc["description"];
             var title = doc["title"];
             Events e = new Events(
                 id: id, title: title, description: description, imageUrl: imageUrl);
             eventsData.add(e);
           });
         })
     );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<void>(
        future: getEvents(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          var eventsList=eventsData.toList();
          return ListView.builder( itemCount: eventsList.length,
              itemBuilder: (context, index ){
                return EventsCard(
                  title: eventsList[index].title,
                  id: eventsList[index].id,
                  imageUrl: eventsList[index].imageUrl,
                  description: eventsList[index].description,
                );
              });
        }
    );

  }
}