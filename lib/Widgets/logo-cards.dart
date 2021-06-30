import 'package:flutter/material.dart';
import '../Screens/About-screen.dart';

class LogoCard extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final List<String> gallery;

  LogoCard({ required this.title, required this.id, required this.imageUrl,required this.description, required this.gallery});

  selectCategory(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder:(_){
      return AboutScreen(title: this.title,id: this.id, imageUrl: this.imageUrl,description: this.description, gallery: this.gallery,);
    } ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
        child:Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(20.0),
            color: Colors.white,
            border: Border.all(),
            image: new DecorationImage(
              image: ExactAssetImage(imageUrl),
              fit: BoxFit.fitWidth,
            ),

          ),
        )
    );
  }
}