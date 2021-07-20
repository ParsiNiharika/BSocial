import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/main-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Data/student-chapters.dart';


Future<void> main() async {


  await getStudentChapters();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  "HOME PAGE",
      home: MainScreen(),
    );
  }
}



