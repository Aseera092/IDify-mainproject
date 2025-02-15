import 'package:flutter/material.dart';
import 'package:idfy_user_application/homepage.dart';
import 'package:idfy_user_application/login.dart';

// void main() {
//   runApp(LoginPage());
// }
// class UserApp extends StatelessWidget {
//   const UserApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
//       title: 'User Application',
//     );
//   }
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // Ensures Directionality is provided
    );
  }
}
