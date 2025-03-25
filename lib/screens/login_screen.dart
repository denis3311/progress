   import 'package:flutter/material.dart';
   import 'main_screen.dart';class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ... (TextEditingController, validation logic, etc.)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(decoration: InputDecoration(labelText: 'Username')),
            TextField(decoration: InputDecoration(labelText: 'Password')),
            ElevatedButton(
              onPressed: () {
                // ... (Login logic)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
