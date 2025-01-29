import 'package:flutter/material.dart';
import 'package:flutterproject/Pages/crud_file.dart';
import 'package:flutterproject/Pages/user_list_screen.dart';
import 'package:intl/intl.dart';

class AddEditUserScreen extends StatefulWidget {
  final User userInstance;
  AddEditUserScreen({Key? key, required this.userInstance}) : super(key: key);

  @override
  _AddEditUserScreenState createState() => _AddEditUserScreenState();
}

class _AddEditUserScreenState extends State<AddEditUserScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for fields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();


  String? _gender;
  List<String> _hobbies = [];
  final List<String> _genderOptions = ['Male', 'Female',];
  final List<String> _hobbyOptions = ['Reading', 'Traveling', 'Music', 'Sports', 'Gaming'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                // Full Name
                Text("Full Name"),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter Your Full Name")
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid full name (3-50 characters, alphabets only).';
                    }
                    if (!RegExp(r"^[a-zA-Z\s'-]{3,50}").hasMatch(value)) {
                      return 'Enter a valid full name.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),



                // Email Address
                Text("Email Address"),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter Your Email Address")
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid email address.';
                    }
                    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                      return 'Enter a valid email address.';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.0),

                 // Mobile Number
                Text("Mobile Number"),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter Your Mobile Number")
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a valid 10-digit mobile number.';
                    }
                    if (!RegExp(r"^\+?[0-9]{10,15}$").hasMatch(value)) {
                      return 'Enter a valid mobile number.';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.0),

                // Date of Birth
                Text("Date of Birht"),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _dobController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter Your DOB")
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1940),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      _dobController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select a valid date of birth.';
                    }
                    DateTime? dob = DateFormat('dd/MM/yyyy').parse(value, true);
                    int age = DateTime.now().year - dob.year;
                    if (age < 18 || age > 80) {
                      return 'You must be between 18 and 80 years old.';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.0),

                // City
                Text("City"),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter Your City")
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your city.';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.0),


                // Gender
                Text("Gender"),
                SizedBox(height: 8,),
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Enter Your Gender")
                  ),
                  items: _genderOptions.map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Select your gender.';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 16.0),

                // Hobbies
                Text("Hobbies"),
                SizedBox(height: 8,),
                Wrap(
                  spacing: 8.0,
                  children: _hobbyOptions.map((hobby) {
                    return ChoiceChip(
                      label: Text(hobby),
                      selected: _hobbies.contains(hobby),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _hobbies.add(hobby);
                          } else {
                            _hobbies.remove(hobby);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),

                SizedBox(height: 20.0),
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.userInstance.add_User(
                            _fullNameController.text,
                            _emailController.text,
                            _mobileController.text,
                            _dobController.text,
                            _cityController.text,
                            _gender ?? '',
                            _hobbies,
                        );
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('User Added Successfully')),
                        );
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
