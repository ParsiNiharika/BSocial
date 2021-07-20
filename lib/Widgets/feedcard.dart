import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Screens/feed-content-screen.dart';

class FeedCard extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final String description;

  FeedCard(
      {required this.title,
        required this.id,
        required this.imageUrl,
        required this.description,
      });

  selectFeed(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return FeedContentScreen(
        title: this.title,
        id: this.id,
        imageUrl: this.imageUrl,
        description: this.description,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            margin: EdgeInsets.all(10),
            child: Row(
                children: <Widget> [
                  ClipRRect(borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ) ,
                      child:Image.asset(imageUrl,height: 150, width: 150,fit: BoxFit.cover)
                  ),
                  Padding(
                      padding: EdgeInsets.only(left:15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Align(
                              alignment: Alignment.topLeft,
                              child:Text(title,style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),)
                          ),
                          Container(
                            padding: EdgeInsets.only(top:12),
                            width: MediaQuery.of(context).size.width*0.5 ,
                            child: Text(description,
                              maxLines: 2 ,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey,
                              ),),
                          ),
                          Padding(
                              padding:EdgeInsets.only(top:8,bottom: 5) ,
                              child: InkWell(
                                onTap: ()=> selectFeed(context),
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child:Text("See More",
                                        style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.lightBlue,
                                        fontWeight: FontWeight.w200,
                                      ),)
                                  )
                              )
                          )
                        ],
                      )
                  )
                ]
            )
        )
    );
  }
}
