import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.white, // Set the AppBar to grey[900]
        elevation: 0,
      ),
      body: Container(
        // Solid Grey Background for the entire body
        color: Colors.grey[900],
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Profile Icon with shadow effect
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.amber[700], // Circle background color
              child: Icon(
                Icons.account_circle, // Default user icon
                size: 90,
                color: Colors.white, // Icon color
              ),
            ),
            SizedBox(height: 20),

            // Card for Username and Email
            Card(
              color: Colors.grey[850], // Darker card background to contrast
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // User Name
                    Text(
                      'John Doe', // Replace with dynamic username if needed
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),

                    // User Email
                    Text(
                      'johndoe@example.com', // Replace with dynamic email if needed
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),

            // Reset Password Button
            ElevatedButton(
              onPressed: () {
                _showResetPasswordDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[700], // Amber color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Reset Password'),
            ),
            SizedBox(height: 20),

            // Log Out Option
            TextButton(
              onPressed: () {
                // Handle logout or other actions
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show reset password dialog
  void _showResetPasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[850], // Dialog background color to match
          title: Text('Reset Password', style: TextStyle(color: Colors.white)),
          content: TextField(
            decoration: InputDecoration(
              hintText: 'Enter new password',
              hintStyle: TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            obscureText: true,
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                // Implement reset password logic
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                'Reset',
                style: TextStyle(color: Colors.amber[700]),
              ),
            ),
          ],
        );
      },
    );
  }
}
