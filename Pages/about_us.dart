import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
      ),
      
      
      body: Column(
        children: [
          Text("Welcome to Matrimony App, where meaningful connections are made, and lasting relationships are built.\n",style: TextStyle(fontSize: 20),),
          Text("Our mission is simple yet profound: to bring people together in their search for a lifetime partner. With a blend of cutting-edge technology and a deep understanding of cultural values, we aim to provide a seamless and trustworthy platform for individuals to find their perfect match.\n",style: TextStyle(fontSize: 20),),
          Text("This Project is Developed by a darshan University student Nandan Lalani",style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}
