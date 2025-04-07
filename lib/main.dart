import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testauth/support.dart';
import 'firebase_options.dart';
import 'landing_path.dart';
import 'login_page.dart';
import 'signup_page.dart';
import 'home.dart';
import 'profile.dart'; // Ensure correct import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/support': (context) => const HelpSupportPage(),
      },
    );
  }
}
