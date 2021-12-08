import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/main-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Data/student-chapters.dart';
import 'Screens/homeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await getStudentChapters();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HOME PAGE",
      home: HomeScreen(),
    );
  }
}
