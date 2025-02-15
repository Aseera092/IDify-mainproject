import 'package:flutter/material.dart';

class notification extends StatelessWidget {
  const notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Row(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text("Notification 1"),
                  subtitle: Text("This is the first notification"),
                ),
                ListTile(
                  title: Text("Notification 2"),
                  subtitle: Text("This is the second notification"),
                ),
                ListTile(
                  title: Text("Notification 3"),
                  subtitle: Text("This is the third notification"),
                ),
                ListTile(
                  title: Text("Notification 4"),
                  subtitle: Text("This is the fourth notification"),
                ),
                ListTile(
                  title: Text("Notification 5"),
                  subtitle: Text("This is the fifth notification"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}