import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "John Doe";
  String _email = "john.doe@example.com";
  String _phone = "+1 234 567 8900";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Color.fromRGBO(72, 52, 102, 1.0),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image5.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile_placeholder.jpg'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    initialValue: _name,
                    decoration: InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onSaved: (value) => _name = value!,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: _email,
                    decoration: InputDecoration(
                      labelText: "Email",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onSaved: (value) => _email = value!,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    initialValue: _phone,
                    decoration: InputDecoration(
                      labelText: "Phone",
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onSaved: (value) => _phone = value!,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text(
                      "Save Changes",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // TODO: Implement save functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Profile updated successfully')),
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(72, 52, 102, 1.0),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}