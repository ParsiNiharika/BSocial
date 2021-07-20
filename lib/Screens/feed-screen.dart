import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Widgets/feedcard.dart';
import '../Models/feed-model.dart';

class FeedScreen extends StatelessWidget {
  final String id;
  final List<Feed> feedData = [];

  FeedScreen({
    required this.id,
  });

  Future<void> getFeed() async {
    await FirebaseFirestore.instance
        .collection(id)
        .doc('Feed').collection('Feed').get()
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
    return FutureBuilder<void>(
        future: getFeed(),
        builder: (context, AsyncSnapshot<void> snapshot) {
          var feedList = feedData.toList();
          return ListView.builder(itemCount: feedList.length,
              itemBuilder: (context, index) {
                return FeedCard(
                  title: feedList[index].title,
                  id: feedList[index].id,
                  imageUrl: feedList[index].imageUrl,
                  description: feedList[index].description,
                );
              });
        }
    );
  }
}

