import 'package:flutter/material.dart';

import '../Screens/popup-screen.dart';
import '../Models/popup-model.dart';

class About extends StatelessWidget{

  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;

  About({ required this.title, required this.id, required this.imageUrl, required this.description, required this.gallery});

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
                  padding: EdgeInsets.all(10.0),
                  child:Image.asset(imageUrl,width: 200,height: 200,),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 56,
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
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 25,
                      color: const Color(0xff47455f),
                      fontWeight: FontWeight.w300,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}