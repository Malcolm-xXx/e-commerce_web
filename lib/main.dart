import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_web/Screens/Home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'experiment_file.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wellens',
      //removing debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError){
              print("Error");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return HomeScreen();
            }
            return CircularProgressIndicator();
          },
          //child: const HomeScreen()),
          // MyDropdownMenu(),
      ),
    );
  }
}
