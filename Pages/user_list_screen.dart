import 'package:flutter/material.dart';
import 'package:flutterproject/Pages/add_user_screen.dart';
import 'package:flutterproject/Pages/crud_file.dart';
import 'package:flutter/cupertino.dart';

class UserListScreen extends StatefulWidget {
  final User userInstance;

  UserListScreen({Key? key, required this.userInstance}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> userList = [];

  @override
  void initState() {
    super.initState();
    userList = widget.userInstance.getUser_details() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        backgroundColor: Colors.blue,
      ),



      body: Container(

        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search users...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    userList =
                        widget.userInstance.searchDetail(searchData: value) ??
                            [];
                  });
                },
              ),
            ),



            Expanded(
              child: userList.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_off,
                          size: 100,
                          color: Colors.white54,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'No users found',
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                        ),
                      ],
                    )
                  : ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        final user = userList[index];
                        return Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.lightBlueAccent,
                                  child: Text(
                                    user['fullName'] != null &&
                                            user['fullName'].isNotEmpty
                                        ? user['fullName'][0].toUpperCase()
                                        : '',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user['fullName'] ?? 'No Name',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Email: ${user['email'] ?? 'N/A'}',
                                        style: TextStyle(
                                            fontSize: 14, ),
                                      ),
                                      Text(
                                        'Mobile: ${user['mobile'] ?? 'N/A'}',
                                        style: TextStyle(
                                            fontSize: 14, ),
                                      ),
                                      ElevatedButton(onPressed: () {

                                      }, child: Text("View More"))
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.favorite_border,
                                          color: Colors.black),
                                      onPressed: () {
                                        // Favorite button action
                                      },
                                    ),
                                    IconButton(
                                      icon:
                                          Icon(Icons.edit, color: Colors.blue),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AddEditUserScreen(
                                              userInstance: widget.userInstance,
                                            ),
                                          ),
                                        ).then((_) => setState(() {
                                              userList = widget.userInstance
                                                      .getUser_details() ??
                                                  [];
                                            }));
                                      },
                                    ),
                                    IconButton(
                                      icon:
                                          Icon(Icons.delete, color: Colors.red),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return CupertinoAlertDialog(
                                              title: Text('DELETE'),
                                              content: Text(
                                                  'Are you sure want to delete?'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      widget.userInstance
                                                          .delete_user(index);
                                                      userList = widget
                                                              .userInstance
                                                              .getUser_details() ??
                                                          [];
                                                    });
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                            'User deleted successfully!'),
                                                      ),
                                                    );
                                                  },
                                                  child: Text('Yes'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('No'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
