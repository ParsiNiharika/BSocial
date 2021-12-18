import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/events-model.dart';
import '../Screens/eventForm.dart';
import '../Widgets/form-widget.dart';
import '../Widgets/events-widget.dart';
import '../Screens/eventForm.dart';

class EventScreen extends StatelessWidget {
  final String id;
  final List<String> events;
  final List<Events> eventsData = [];

  EventScreen({required this.events, required this.id});

  showEventForm(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return EventForm();
    }));
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Popup example'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          EventForm(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }

  buttonVisible(context) {
    return FloatingActionButton.extended(
      onPressed: () {
        // Add your onPressed code here!
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog(context),
        );
      },
      label: const Text('ADD'),
      icon: const Icon(Icons.add),
      backgroundColor: Colors.pink,
    );
  }

  Future<void> getEvents() async {
    await Future.wait(events.map((element) async {
      await FirebaseFirestore.instance
          .collection("Events")
          .doc(element)
          .get()
          .then((DocumentSnapshot doc) {
        var id = doc["id"];
        var imageUrl = doc["imageUrl"];
        var description = doc["description"];
        var title = doc["title"];
        Events e = new Events(
            id: id, title: title, description: description, imageUrl: imageUrl);
        eventsData.add(e);
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: FutureBuilder<void>(
            future: getEvents(),
            builder: (context, AsyncSnapshot<void> snapshot) {
              var eventsList = eventsData.toList();
              return ListView.builder(
                  itemCount: eventsList.length,
                  itemBuilder: (context, index) {
                    return EventsCard(
                      title: eventsList[index].title,
                      id: eventsList[index].id,
                      imageUrl: eventsList[index].imageUrl,
                      description: eventsList[index].description,
                    );
                  });
            }),
        floatingActionButton:
            MyFormState.isLogin ? buttonVisible(context) : Container());
  }
}
