
import 'package:flutter/material.dart';
import 'package:musicapp_final/screens/BUS/bushome_screen.dart';
import 'package:musicapp_final/screens/register_screen.dart';
import 'package:musicapp_final/screens/search_screen.dart';
import 'package:musicapp_final/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp();
    runApp(const MyApp());
  } catch (e) {
    print("Firebase initialization error: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SigninScreen(), 
        '/register': (context) => RegisterScreen(),
        '/search': (context) => SearchScreen(),
        '/dashboard': (context) => BushomeScreen(),

      },
      // home: const LoginScreen(),
    );
  }
}
