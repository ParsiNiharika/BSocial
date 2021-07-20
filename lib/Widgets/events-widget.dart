import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventsCard extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final String description;

  EventsCard(
      {required this.title,
        required this.id,
        required this.imageUrl,
        required this.description,
       });

  showDialogFunc(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(25),
              height: 450,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      imageUrl,
                      width: 250,
                      height: 250,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    // width: 200,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        description,
                        maxLines: 5,
                        style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            color: Color.fromRGBO( 43,45,66,1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget> [
                    ClipRRect(borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ) ,
                    child:Image.asset(imageUrl,height: 250, width: double.infinity,fit: BoxFit.cover)
                    ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Align(
                        alignment: Alignment.topLeft,
                        child:Text(title,style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),)
                    ),
                    Padding(
                        padding:EdgeInsets.only(top:10,bottom: 10) ,
                        child: InkWell(
                          onTap:()=> {
                        showDialogFunc(context)
                          },
                          child: Align(
                              alignment: Alignment.topLeft,
                              child:Text("See More",style: TextStyle(
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
