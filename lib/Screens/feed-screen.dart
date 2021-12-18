import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/Widgets/form-widget.dart';

import '../Widgets/feedcard.dart';
import '../Models/feed-model.dart';
import 'eventForm.dart';

class FeedScreen extends StatelessWidget {
  final String id;
  final List<Feed> feedData = [];

  FeedScreen({
    required this.id,
  });

  showEventForm(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return EventForm();
    }));
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Feed'),
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

  Future<void> getFeed() async {
    await FirebaseFirestore.instance
        .collection(id)
        .doc('Feed')
        .collection('Feed')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var id = doc["id"];
        var imageUrl = doc["imageUrl"];
        var description = doc["description"];
        var title = doc["title"];
        Feed feed = new Feed(
            id: id, title: title, description: description, imageUrl: imageUrl);
        feedData.add(feed);
      });
    });
  }

  Widget build(context) {
    return Scaffold(
      body: FutureBuilder<void>(
          future: getFeed(),
          builder: (context, AsyncSnapshot<void> snapshot) {
            var feedList = feedData.toList();
            return ListView.builder(
                itemCount: feedList.length,
                itemBuilder: (context, index) {
                  return FeedCard(
                    title: feedList[index].title,
                    id: feedList[index].id,
                    imageUrl: feedList[index].imageUrl,
                    description: feedList[index].description,
                  );
                });
          }),
      floatingActionButton:
          MyFormState.isLogin ? buttonVisible(context) : Container(),
    );
  }
}
