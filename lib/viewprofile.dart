import 'package:flutter/material.dart';

class Viewprofile extends StatelessWidget {
  const Viewprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Profile"),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text("Name"),
            subtitle: Text("User Name"),
          ),
          ListTile(
            title: Text("Email"),
            subtitle: Text("")
          ),
          ListTile(
            title: Text("Phone"),
            subtitle: Text("")
          ),
        ],
    )
    );
  }
}