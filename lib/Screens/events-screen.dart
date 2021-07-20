import 'package:flutter/material.dart';
import '../Models/events-model.dart';
import '../Data/events-data.dart';
import '../Widgets/events-widget.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
}