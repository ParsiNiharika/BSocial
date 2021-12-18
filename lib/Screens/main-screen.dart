import 'package:flutter/material.dart';
import '../Data/student-chapters.dart';
import '../Widgets/logo-cards.dart';
import './introScreen.dart';

class MainScreen extends StatelessWidget {
  showIntroScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return IntroScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(
            "BSocial",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                showIntroScreen(context);
              },
            )
          ],
        ),
        body: Container(
          color: Color.fromRGBO(43, 45, 66, 1),
          child: GridView(
            padding: EdgeInsets.all(25),
            children: StudentChapter_Data.map((data) => LogoCard(
                title: data.title,
                id: data.id,
                imageUrl: data.imageUrl,
                description: data.description,
                gallery: data.gallery,
                registrationLink: data.registrationLink,
                contactUs: data.contactUs,
                events: data.events)).toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 2.1 / 2.2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
          ),
        ));
  }
}
