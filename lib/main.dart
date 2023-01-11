import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugasflutter/screens/category_screen.dart';
import 'package:tugasflutter/screens/dashboard_screen.dart';
import 'package:tugasflutter/screens/delete_screen.dart';
import 'package:tugasflutter/screens/login_screen.dart';
import 'package:tugasflutter/screens/profile_screen.dart';
import 'package:tugasflutter/screens/quiz_guitar_screen.dart';
import 'package:tugasflutter/screens/quiz_music_screen.dart';
import 'package:tugasflutter/screens/quiz_piano_screen.dart';
import 'package:tugasflutter/screens/register_screen.dart';
import 'package:tugasflutter/screens/detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCLiQ-Q1c7f1yZLXmajDRemqcuquFPMb7w",
        appId: "1:661914157752:web:145c12f7dc4e399d4f2a4d",
        messagingSenderId: "661914157752",
        projectId: "tugasflutter-bcee7")
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter',
      // home: const LogInScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (context) => LogInScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        DashboardScreen.routeName: (context) => DashboardScreen(),
        CategoryScreen.routeName: (context) => CategoryScreen(),
        DetailScreen.routeName: (context) => DetailScreen(),
        DeleteScreen.routeName: (context) => DeleteScreen(),
        QuizMusicScreen.routeName: (context) => QuizMusicScreen(),
        QuizPianoScreen.routeName: (context) => QuizPianoScreen(),
        QuizGuitarScreen.routeName: (context) => QuizGuitarScreen()
      },
    );
  }
}