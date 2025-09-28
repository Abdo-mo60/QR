import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr/core/utlis/router.dart';



import 'package:qr/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const QrApp());
}

class QrApp extends StatefulWidget {
  const QrApp({super.key});

  @override
  State<QrApp> createState() => _QrAppState();
}

class _QrAppState extends State<QrApp> {
 @override
  void initState() {
FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
   
    super.initState();
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig:AppRouter.router ,
      debugShowCheckedModeBanner: false,
      
      
   );

}
}
