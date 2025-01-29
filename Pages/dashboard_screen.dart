import 'package:flutter/material.dart';
import 'package:flutterproject/Pages/about_us.dart';
import 'package:flutterproject/Pages/add_user_screen.dart';
import 'package:flutterproject/Pages/user_list_screen.dart';
import 'package:flutterproject/Pages/crud_file.dart';

class DashboardScreen extends StatelessWidget {
  final User userInstance;

  DashboardScreen({Key? key, required this.userInstance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Matrimony App',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: 800,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1,
              children: [


                //Add User
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_add, size: 50, color: Colors.white,),
                        SizedBox(height: 8,),
                        Text("Add User", style: TextStyle(color: Colors.white,
                            fontSize: 25),)
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddEditUserScreen(
                              userInstance: userInstance,
                            ),
                      ),
                    );
                  },
                ),

                //User Liat
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list, size: 50, color: Colors.white,),
                        SizedBox(height: 8,),
                        Text("User List", style: TextStyle(color: Colors.white,
                            fontSize: 25),)
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UserListScreen(
                                  userInstance: userInstance)
                      ),
                    );
                  },
                ),

                //Favourite
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_outline_rounded, size: 50,
                          color: Colors.white,),
                        SizedBox(height: 8,),
                        Text("Favourite", style: TextStyle(color: Colors.white,
                            fontSize: 25),)
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UserListScreen(userInstance: userInstance)
                      ),
                    );
                  },
                ),


                //About Us
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info, size: 50, color: Colors.white,),
                        SizedBox(height: 8,),
                        Text("About Us", style: TextStyle(color: Colors.white,
                            fontSize: 25),)
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AboutUs()
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

