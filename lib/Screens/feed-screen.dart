import 'package:flutter/material.dart';

import '../Data/feed-data.dart';
import '../Widgets/feedcard.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var feedList=feedData.toList();
    return ListView.builder( itemCount: feedList.length,
        itemBuilder: (context, index ){
          return FeedCard(
            title: feedList[index].title,
            id: feedList[index].id,
            imageUrl: feedList[index].imageUrl,
            description: feedList[index].description,
          );
        });
  }
}