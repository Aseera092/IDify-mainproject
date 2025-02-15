import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:idfy_user_application/notification.dart';
import 'package:idfy_user_application/request.dart';
import 'package:idfy_user_application/viewprofile.dart';
import 'package:idfy_user_application/login.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Application',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "../assets/image/bg3.jpeg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            // Carousel Slider
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CarouselSlider(
                items: [
                  "carousel1.jpg",
                  "carousel2.jpg",
                  "carousel3.jpg",
                ].map((item) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/image/$item", fit: BoxFit.cover, width: double.infinity),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
      // Drawer Menu
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              accountName: Text("User Name", style: TextStyle(fontSize: 18)),
              accountEmail: Text("user@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.indigo),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.indigo),
              title: Text("View Profile"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Viewprofile())),
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.indigo),
              title: Text("Notifications"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => notification())),
            ),
             ListTile(
              leading: Icon(Icons.notifications, color: Colors.indigo),
              title: Text("Compaint Registration"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Request())),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout"),
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Home"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
