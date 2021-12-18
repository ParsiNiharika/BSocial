import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import "package:image_picker/image_picker.dart";
import 'package:flutter/material.dart';
import 'package:test/Widgets/checkbox.dart';
import '../Screens/main-screen.dart';
import '../Data/adminData.dart';

// Create a Form widget.
class EventForm extends StatefulWidget {
  @override
  EventFormState createState() {
    return EventFormState();
  }
}

class EventFormState extends State<EventForm> {
  File? _image;
  ImagePicker imagePicker = new ImagePicker();
  final _formKey = GlobalKey<FormState>();
  String? desc = "";
  String? event = "";

  Widget bottomSheet() {
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(children: <Widget>[
          Text("Choose Profile Photo",
              style: TextStyle(
                fontSize: 20.0,
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: Icon(Icons.camera),
                  label: Text("Camera")),
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text("Gallery")),
            ],
          )
        ]));
  }

  Future takePhoto(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(
        source: source,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    setState(() {
      if (image != null) _image = File(image.path);
    });
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(color: Colors.red[200]),
            child: _image != null
                ? Image.file(
                    _image!,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.fitHeight,
                  )
                : Container(
                    decoration: BoxDecoration(color: Colors.red[200]),
                    width: 200,
                    height: 200,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    ),
                  ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context, builder: ((builder) => bottomSheet()));
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Material(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imageProfile(),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.event),
                    hintText: 'Enter Feed Title',
                    labelText: 'Feed',
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter valid event Name';
                    }
                    event = value;
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    icon: const Icon(Icons.description),
                    hintText: 'Enter description',
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter valid Description';
                    }
                    desc = value;
                    return null;
                  },
                ),
                Container(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: new ElevatedButton(
                      onPressed: () {
                        final form = _formKey.currentState;
                        if (form != null && !form.validate()) {
                          return;
                        }
                        form?.save();
                        FirebaseFirestore.instance
                            .collection('Events')
                            .doc(event)
                            .set({'title': event, 'description': desc});
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.pink),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
