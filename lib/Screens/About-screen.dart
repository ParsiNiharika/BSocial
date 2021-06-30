import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import '../Screens/Navigation-screen.dart';

class AboutScreen extends StatefulWidget {

  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;

  AboutScreen({ required this.title, required this.id, required this.imageUrl, required this.description, required this.gallery} );


  @override
  _Main createState() => _Main(title: this.title,id: this.id, imageUrl: this.imageUrl,description: this.description, gallery: this.gallery);
}


class _Main extends State<AboutScreen> {

  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;
  int _index=1;

  _Main({ required this.title, required this.id, required this.imageUrl, required this.description, required this.gallery } );

  selectIcon(index,context ) {
    setState(() {
      this._index=index;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: NavigationScreen(title: this.title,id: this.id, imageUrl: this.imageUrl,description: this.description, gallery: this.gallery, index: this._index),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.redAccent,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.verified_user,size:20,color:Colors.black),
          Icon(Icons.add,size:20,color:Colors.black),
          Icon(Icons.list,size:20,color:Colors.black),
        ],
        animationDuration: Duration(
          milliseconds: 200,
        ),
        index:1,

        onTap: (index){
          selectIcon(index,context);
        },
      ),
    );
  }
}
