import 'package:flutter/material.dart';

class FeedContentScreen extends StatelessWidget{
  final String title;
  final String id;
  final String imageUrl;
  final String description;

  FeedContentScreen(
      {required this.title,
        required this.id,
        required this.imageUrl,
        required this.description,
      });
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.pink,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(imageUrl,fit: BoxFit.fill,),
          DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.2,
              maxChildSize: 0.8,
              builder:(context,controller)=>ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:Container(
                  color: Colors.white,
                  child:SingleChildScrollView(
                    controller: controller,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(15),
                          child:Text(
                            title,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          // width: 200,
                          padding: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              description,
                              maxLines: 1000,
                              style: TextStyle(fontSize: 15, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              )
          )
        ],
      )
    );
  }
}